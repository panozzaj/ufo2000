/*
This file is part of "UFO 2000" aka "X-COM: Gladiators"
                    http://ufo2000.sourceforge.net/
Copyright (C) 2000-2001  Alexander Ivanov aka Sanami
Copyright (C) 2002       ufo2000 development team

This program is free software; you can redistribute it and/or modify
it under the terms of the GNU General Public License as published by
the Free Software Foundation; either version 2 of the License, or
(at your option) any later version.

This program is distributed in the hope that it will be useful,
but WITHOUT ANY WARRANTY; without even the implied warranty of
MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
GNU General Public License for more details.

You should have received a copy of the GNU General Public License
along with this program; if not, write to the Free Software
Foundation, Inc., 675 Mass Ave, Cambridge, MA 02139, USA.
*/

#include "stdafx.h"

#include "global.h"

#include "video.h"
#include "wind.h"
#include "explo.h"
#include "multiplay.h"
#include "map.h"
#include "sound.h"
#include "scenario.h"
#include "colors.h"
#include "text.h"

static std::list<std::string> g_hotseat_cmd_queue;

void packet_send_hotseat(const std::string &data)
{
	g_hotseat_cmd_queue.push_back(data);
}

int packet_recv_hotseat(std::string &packet)
{
	if (g_hotseat_cmd_queue.empty()) {
		packet = "";
		return 0;
	}

	packet = g_hotseat_cmd_queue.front();
	g_hotseat_cmd_queue.pop_front();
	return packet.size();
}

void inithotseatgame()
{
	while (!g_hotseat_cmd_queue.empty()) g_hotseat_cmd_queue.pop_front();
}

void closehotseatgame()
{
	while (!g_hotseat_cmd_queue.empty()) g_hotseat_cmd_queue.pop_front();
}

void Net::error(char *str)
{
	g_console->printf("___error in %s___", str);
	log("%s\n", str);
}

Net::Net()
{
	SEND = 1;
	queue = new BQ(1000);
	connect = new Connect();
	flog = fopen(F("$(home)/ufo2000.log"), "wt");
	ASSERT(flog != NULL);
	log("%s\n", "_____________Net()");
	gametype = GAME_TYPE_HOTSEAT;
}

Net::~Net()
{
	log("%s\n", "_____________~Net()");
	fclose(flog);
	delete connect;
	delete queue;
}

void Net::log(const char *fmt, ...)
{
	time_t now = time(NULL);
	struct tm * t = localtime(&now);
	char timebuf[1000];
	strftime(timebuf, 1000, "%d/%m/%Y %H:%M:%S", t);

	va_list arglist;
	va_start(arglist, fmt);

	fprintf(flog, "%s ", timebuf);
	vfprintf(flog, fmt, arglist);
	fflush(flog);

	va_end(arglist);
}

/**
 * Call mission-planner for network- and hotseat-games
 */
int Net::init()
{
	log("%s\n", "init()");
	SEND = 1;
	
	if (queue != NULL) delete queue;
	queue = new BQ(1000);

	connect->reset_uds();
    MouseRange temp_mouse_range(0, 0, SCREEN_W - 1, SCREEN_H - 1);

	if (gametype == GAME_TYPE_HOTSEAT) {
		HOST = 1;
		if (!connect->do_planner(1))
			return 0;
		clear(screen);
		reset_video();
        alert(" ", _("  NEXT PLAYER  "), " ", _("    OK    "), NULL, 1, 0);
		HOST = 0;
		connect->swap_uds();
		if (!connect->do_planner(1, 0))
			return 0;
		HOST = 1;
		clear(screen);
		reset_video();
        alert(" ", _("  GAME START  "), " ", _("    OK    "), NULL, 1, 0);
		inithotseatgame();
	} else {
		if (!connect->do_chat() || !connect->do_planner(0)) {
			close();
			return 0;
		}
		net->send_debug_message("terrain:%s", 
			terrain_set->get_terrain_name(mapdata.terrain).c_str());
	}
	
	return 1;
}

void Net::close()
{
	log("%s\n", "close()");
	switch (gametype) {
		case GAME_TYPE_HOTSEAT:
			closehotseatgame();
			break;
		default:
			break;
	}
	delete queue;
/* It fixes existing problem with crash when game is loaded after some other 
game have been played before. I suppose "queue" will be deleted in destructor 
in any case.*/
    queue = new BQ(1000);
}

Soldier *Net::findman(int NID)
{
	Soldier *ss = platoon_remote->findman(NID);
	if (ss == NULL) ss = platoon_local->findman(NID);

	return ss;
}

void Net::send_message(const std::string &msg)
{
	send(std::string("_Xmes_") + msg);
}

extern int GAMELOOP;

void Net::send()
{
    if (GAMELOOP && (net->gametype != GAME_TYPE_REPLAY))
        *m_oreplay_file<<pkt.str()<<"\n";

    ASSERT(pkt.str_len() > 0);
    send(pkt.str());
}

void Net::send(const std::string &pkt)
{
    if (FLAGS & F_RAWMESSAGES) 
        g_console->printf( _("send:[%s]"), pkt.c_str());

	log("send:[%s]\n", pkt.c_str());

	switch (gametype) {
		case GAME_TYPE_HOTSEAT:
			if (MODE != PLANNER)
				packet_send_hotseat(pkt);
			break;
		case GAME_TYPE_INTERNET_SERVER:
			m_internet_server->send_packet(SRV_GAME_PACKET, pkt);
			break;
       case GAME_TYPE_REPLAY:
           break;
		default:
			ASSERT(false);
	}
}

int Net::recv(std::string &pkt)
{
	pkt = "";
	switch (gametype) {
		case GAME_TYPE_HOTSEAT:
			if (MODE != WATCH) return 0;
			packet_recv_hotseat(pkt);
			return pkt.size();
		case GAME_TYPE_INTERNET_SERVER:
			NLulong id;
			if (!m_internet_server->recv_packet(id, pkt) || id != SRV_GAME_PACKET) {
				pkt = "";
				return 0;
			} else {
                if ((net->gametype != GAME_TYPE_REPLAY) && GAMELOOP)
                    *m_oreplay_file<<pkt<<"\n";

                return pkt.size();
			}
        case GAME_TYPE_REPLAY:
            // loads packet from replay file up to \n, needs to 
            // be rewritten in a proper way
            char buffer[1000];
            m_ireplay_file->getline(buffer, 1000);
            pkt = buffer;
            return pkt.size();
		default:
			ASSERT(false);
			break;
	}
	return 0;
}

/**
 * Receive packets from network and check them
 */
void Net::check()
{
	std::string packet;

	if (gametype == GAME_TYPE_INTERNET_SERVER)
		m_internet_server->send_delayed_packet();

	recv(packet);

	if (!packet.empty()) {
		queue->put((char *)packet.data(), packet.size());
		if (FLAGS & F_RAWMESSAGES) {
            g_console->printf( _("put:[%d]"), packet.size());
			g_console->printf("%s", packet.c_str());
		}
	}

	if (GAMELOOP && (!nomoves()))
		return ;

	if (!queue->get(packet)) return;

	if (FLAGS & F_RAWMESSAGES) {
        g_console->printf( _("get:[%d]"), packet.size());
		g_console->printf("%s", packet.c_str());
	}

	log("recv:[%s]\n", packet.c_str());
	switch (pkt.command((char *)packet.data(), packet.size())) {
		case CMD_NOTICE:
			recv_notice();
			break;
		case CMD_QUITGAME:
			recv_quit();
			break;
		case CMD_RESTARTGAME:
			recv_restart();
			break;
		case CMD_ENDTURN:
			recv_endturn();
			break;
		case CMD_OPENDOOR:
			recv_open_door();
			break;
		case CMD_CHANGEPOSE:
			recv_change_pose();
			break;
		case CMD_RESTIME:
			recv_reserve_time();
			break;
		case CMD_PRIMEGRENADE:
			recv_prime_grenade();
			break;
		case CMD_UNLOAD_AMMO:
			recv_unload_ammo();
			break;
		case CMD_LOAD_AMMO:
			recv_load_ammo();
			break;
		case CMD_TAKE_ITEM:
			recv_select_item();
			break;
		case CMD_DROP_ITEM:
			recv_deselect_item();
			break;
		case CMD_MOVE:
			recv_move();
			break;
		case CMD_FACE:
			recv_face();
			break;
		case CMD_USE_ELEVATOR:
			recv_use_elevator();
			break;
        case CMD_TARGET_ACTION:
            recv_target_action();
            break;
		case CMD_ADD_UNIT:
			recv_add_unit();
			break;
		case CMD_SELECT_UNIT:
			recv_select_unit();
			break;
		case CMD_DESELECT_UNIT:
			recv_deselect_unit();
			break;
		case CMD_UNIT_DATA_SIZE:
			recv_unit_data_size();
			break;
		case CMD_UNIT_DATA:
			recv_unit_data();
			break;
		case CMD_MAP_DATA:
			recv_map_data();
			break;
		case CMD_TIME_LIMIT:
			recv_time_limit();
			break;
		case CMD_P2_ISSIT:
			recv_p2_start_sit();
			break;
		case CMD_TERRAIN_CRC32:
			recv_terrain_crc32();
			break;
		case CMD_SCENARIO:
		    recv_scenario();
		    break;
		case CMD_RULES:
		    recv_rules();
		    break;
		case CMD_OPTIONS:
			recv_options();
			break;
		case CMD_EQUIPMENT:
			recv_equipment();
			break;
		case CMD_PANIC:
			recv_panic();
			break;
		case CMD_MORALE:
			recv_morale_change();
			break;
		case CMD_FINISH_PLANNER:
			recv_finish_planner();
			break;
		case CMD_MESSAGE:
			soundSystem::getInstance()->play(SS_BUTTON_PUSH_1);
			g_console->print(pkt.str(), COLOR_RED00);
			break;
        case CMD_TIE:
            recv_tie();
            break;
        case CMD_INITRAND:
            recv_initrand();
            break;
		case CMD_NONE:
        case COMMAND_NUM:
			ASSERT(false);
			break;
	};
}

void Net::send_notice()
{
	if (!SEND) return ;

	pkt.create(CMD_NOTICE);
	send();
}

int Net::recv_notice()
{ // "NOTE"
	NOTICEremote = 0;
	return 1;
}

void Net::send_quit()
{
	if (!SEND) return ;

	pkt.create(CMD_QUITGAME);
	send();
}

int Net::recv_quit()
{ // "QUIT"
	error("Remote exit from game");
	return 1;
}

extern void restartgame();
int CONFIRM_REQUESTED = 0;

void Net::send_restart()
{
	if (!SEND) return ;

	pkt.create(CMD_RESTARTGAME);
	pkt << CONFIRM_REQUESTED;
	send();

	if (CONFIRM_REQUESTED) {
		restartgame();
		CONFIRM_REQUESTED = 0;
	}
}

int Net::recv_restart()
{ //"REST"
	int CONFIRMED;

	pkt >> CONFIRMED;
	if (CONFIRMED) {
		restartgame();
		CONFIRM_REQUESTED = 0;
	}

	if (!CONFIRMED) {
		error("Remote want restart game, press F5 to confirm");
		CONFIRM_REQUESTED = 1;
	}
	return 1;
}

void Net::send_endturn(int crc)
{
	if (!SEND) return ;

	pkt.create(CMD_ENDTURN);
	pkt << crc;
	send();
}

int Net::recv_endturn()
{ // "TURN"
	int crc; pkt >> crc;
	recv_turn(crc);
	return 1;
}


void Net::send_open_door(int NID)
{
	if (!SEND) return ;

	pkt.create(CMD_OPENDOOR);
	pkt << NID;
	send();
}

int Net::recv_open_door()
{ //DOOR
	int NID;

	pkt >> NID;

	Soldier *ss = findman(NID);
	if (ss != NULL) {
		ASSERT(ss->is_active());
		SEND = 0;
		if (!ss->open_door())
			error("NID can't open door");
		SEND = 1;
		return 1;
	} else
		error("NID");
	return 0;
}


void Net::send_change_pose(int NID)
{
	if (!SEND) return ;

	pkt.create(CMD_CHANGEPOSE);
	pkt << NID;
	send();
}

int Net::recv_change_pose()
{ // "POSE"
	int NID;

	pkt >> NID;

	Soldier *ss = findman(NID);
	if (ss != NULL) {
		ASSERT(ss->is_active());
		SEND = 0;
		if (!ss->change_pose()) {
			error("NID can't change_pose");
		}
		SEND = 1;
		return 1;
	} else {
		error("NID");
	}
	return 0;
}

void Net::send_reserve_time(int NID, int res)
{
    if (!SEND) return ;

    pkt.create(CMD_RESTIME);
    pkt << NID;
    pkt << res;
    send();
}

int Net::recv_reserve_time()
{ // "RESTIME"
	int NID;
	int res;

	pkt >> NID;
	pkt >> res;

	Soldier *ss = findman(NID);
	if (ss != NULL) {
		SEND = 0;
		ss->set_reserve_type(res);
		SEND = 1;
		return 1;
	} else {
		error("NID reserve type");
	}
	return 0;
}


void Net::send_prime_grenade(int NID, int iplace, int delay_time, int req_time)
{
	if (!SEND) return ;

	pkt.create(CMD_PRIMEGRENADE);
	pkt << NID;
	pkt << iplace;
	pkt << delay_time;
	pkt << req_time;
	send();
}

int Net::recv_prime_grenade()
{ // "PRIM"
	int NID, iplace, delay_time, req_time;

	pkt >> NID;
	pkt >> iplace;
	pkt >> delay_time;
	pkt >> req_time;

	Soldier *ss = findman(NID);
	if (ss != NULL) {
		SEND = 0;
		if (!ss->prime_grenade(iplace, delay_time, req_time))
			error("NID can't prime_grenade");
		SEND = 1;
		return 1;
	} else {
		error("NID");
	}
	return 0;
}



void Net::send_unload_ammo(int NID)
{
	if (!SEND) return ;

	pkt.create(CMD_UNLOAD_AMMO);
	pkt << NID;
	send();
}

int Net::recv_unload_ammo()
{ // "UNLO"
	int NID;

	pkt >> NID;

	Soldier *ss = findman(NID);
	if (ss != NULL) {
		SEND = 0;
		if (!ss->unload_ammo(itaken)) {
			error("NID can't unload ammo");
		}
		SEND = 1;
		return 1;
	} else {
		error("NID");
	}
	return 0;
}


void Net::send_load_ammo(int NID, int iplace, int srcplace)
{
	if (!SEND) return ;

	pkt.create(CMD_LOAD_AMMO);
	pkt << NID;
	pkt << iplace;
	pkt << srcplace;
	send();
}

int Net::recv_load_ammo()
{ // "LOAD"
	int NID, iplace, srcplace;

	pkt >> NID;
	pkt >> iplace;
	pkt >> srcplace;

	Soldier *ss = findman(NID);
	if (ss != NULL) {
		SEND = 0;
		if (!ss->load_ammo(iplace, srcplace, itaken)) {
			error("NID can't load ammo");
			return 1;
		}
		SEND = 1;
		return 1;
	} else {
		error("NID");
	}
	return 0;
}

void Net::send_select_item(int NID, int iplace, int ix, int iy)
{
	if (!SEND) return ;

	pkt.create(CMD_TAKE_ITEM);
	pkt << NID;
	pkt << iplace;
	pkt << ix;
	pkt << iy;
	send();
}

int Net::recv_select_item()
{ //"TAKE"
	int NID, iplace, ix, iy;

	pkt >> NID;
	pkt >> iplace;
	pkt >> ix;
	pkt >> iy;

	Soldier *ss = findman(NID);
	if (ss != NULL) {
		SEND = 0;
		itaken = ss->getitem(iplace, ix, iy);
		SEND = 1;
		if (itaken == NULL) {
			error("takeitem==NULL");
		} else
			return 1;
	} else {
		error("NID");
	}
	return 0;
}


void Net::send_deselect_item(int NID, int iplace, int ix, int iy, int req_time)
{
	if (!SEND) return ;

	pkt.create(CMD_DROP_ITEM);
	pkt << NID;
	pkt << iplace;
	pkt << ix;
	pkt << iy;
	pkt << req_time;
	send();
}

int Net::recv_deselect_item()
{ //"DROP"
	int NID, iplace, ix, iy, req_time;

	pkt >> NID;
	pkt >> iplace;
	pkt >> ix;
	pkt >> iy;
	pkt >> req_time;

	Soldier *ss = findman(NID);
	if (ss != NULL) {
		if (itaken != NULL) {
			SEND = 0;
			if (!ss->putitem(itaken, iplace, ix, iy))
				error("can't put item");
			ss->spend_time(req_time);
			SEND = 1;
			return 1;
		} else {
			error("dropitem==NULL");
		}
	} else {
		error("NID");
	}

	return 0;
}


void Net::send_move(int NID, int lev, int col, int row)
{
	if (!SEND) return ;

	pkt.create(CMD_MOVE);
	pkt << NID;
	pkt << lev;
	pkt << col;
	pkt << row;
	send();
}

int Net::recv_move()
{ // "MOVE"
	int NID, lev, col, row;

	pkt >> NID;
	pkt >> lev;
	pkt >> col;
	pkt >> row;

	Soldier *ss = findman(NID);
	if (ss != NULL) {
		ASSERT(ss->is_active());
		SEND = 0;
		if (net->gametype == GAME_TYPE_REPLAY) sel_man = ss;
		ss->wayto(lev, col, row);
		SEND = 1;
		return 1;
	} else
		error("NID");
	return 0;
}


void Net::send_face(int NID, int col, int row)
{
	if (!SEND) return ;

	pkt.create(CMD_FACE);
	pkt << NID;
	pkt << col;
	pkt << row;
	send();
}

int Net::recv_face()
{ // "FACE"
	int NID, col, row;

	pkt >> NID;
	pkt >> col;
	pkt >> row;

	Soldier *ss = findman(NID);
	if (ss != NULL) {
		ASSERT(ss->is_active());
		SEND = 0;
		ss->faceto(col, row);
		SEND = 1;
		return 1;
	} else
		error("NID");
	return 0;
}

void Net::send_use_elevator(int NID, int dz)
{ // "ELEV"
	if (!SEND) return;

	pkt.create(CMD_USE_ELEVATOR);
	pkt << NID;
	pkt << dz;
	send();
}

int Net::recv_use_elevator()
{ // "ELEV"
	int NID, dz;

	pkt >> NID;
	pkt >> dz;

	Soldier *ss = findman(NID);
	if (ss != NULL) {
		ASSERT(ss->is_active());
		SEND = 0;
		ss->use_elevator(dz);
		SEND = 1;
		return 1;
	} else
		error("NID");
	return 0;
}
	
void Net::send_target_action(int NID, int z0, int x0, int y0, int zd, int xd, int yd, Action action, int iplace)
{
    if (!SEND) return;

    pkt.create(CMD_TARGET_ACTION);
    pkt << NID;
    pkt << z0;
    pkt << x0;
    pkt << y0;
    pkt << zd;
    pkt << xd;
    pkt << yd;
    pkt << (int) action;
    pkt << iplace;

    send();
}

int Net::recv_target_action()
{
    int NID, z0, x0, y0, zd, xd, yd, iaction, iplace;
    Action action;

    pkt >> NID;
    pkt >> z0;
    pkt >> x0;
    pkt >> y0;
    pkt >> zd;
    pkt >> xd;
    pkt >> yd;
    pkt >> iaction;
    pkt >> iplace;
    action = (Action) iaction;

    Soldier *ss = findman(NID);
    if (ss != NULL) {
        SEND = 0;
        if (ss->do_target_action(z0, x0, y0, zd, xd, yd, action, iplace)) {
            error("NID can't perform the required target action");
        }
        SEND = 1;
        return 1;
    } else
    error("NID");
    return 0;
}

extern Units local;
extern Units remote;

void Net::send_add_unit(int num, char *name, int cost)
{
	if (!SEND) return ;

	pkt.create(CMD_ADD_UNIT);
	pkt << num;
	pkt << name;
	pkt << cost;
	send();

	local.SEND = 0;
	local.START = 0;
	remote.START = 0;
}

int Net::recv_add_unit()
{
	int num;
	char name[26];
	int cost;

	pkt >> num;
	pkt >> name;
	pkt >> cost;

	if (!remote.add(num, name, cost)) {
		error("can't add to remote units");
		return 0;
	}

	remote.SEND = 0;
	local.START = 0;
	remote.START = 0;
	return 1;
}

void Net::send_select_unit(int num, int lev, int col, int row)
{
	if (!SEND) return ;

	pkt.create(CMD_SELECT_UNIT);
	pkt << num;
    pkt << lev;
    pkt << col;
    pkt << row;
	send();

	local.SEND = 0;
	local.START = 0;
	remote.START = 0;
}

int Net::recv_select_unit()
{
	int num, lev, col, row;

	pkt >> num;
    pkt >> lev;
    pkt >> col;
    pkt >> row;

	if (!remote.select_unit(num, lev, col, row)) {
		error("can't select remote unit");
		return 0;
	}

	remote.SEND = 0;
	local.START = 0;
	remote.START = 0;
	return 1;
}

void Net::send_deselect_unit(int num)
{
	if (!SEND) return ;

	pkt.create(CMD_DESELECT_UNIT);
	pkt << num;
	send();

	local.SEND = 0;
	local.START = 0;
	remote.START = 0;
}

int Net::recv_deselect_unit()
{
	int num;

	pkt >> num;

	if (!remote.deselect_unit(num)) {
		error("can't deselect remote unit");
		return 0;
	}

	remote.SEND = 0;
	local.START = 0;
	remote.START = 0;
	return 1;
}

//!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
extern int FINISH_PLANNER;

void Net::send_finish_planner()
{
	if (!SEND) return ;

	if ((!local.SEND) || (!remote.SEND))
		return ;

	local.START = 1;

	pkt.create(CMD_FINISH_PLANNER);
	if (!remote.START) {
		pkt << FINISH_PLANNER;
	} else {
		FINISH_PLANNER = 1;
		pkt << FINISH_PLANNER;
	}
	send();
}

int Net::recv_finish_planner()
{
	remote.START = 1;
	int CNF;
	pkt >> CNF;

	if (CNF) {
		FINISH_PLANNER = 1;
	}
	return 1;
}

void Net::send_unit_data_size(int size)
{
	if (!SEND) return ;

	pkt.create(CMD_UNIT_DATA_SIZE);
	pkt << size;
	send();

	if (size)
		local.SEND = 1;
}

extern PLAYERDATA *pd_remote;

int Net::recv_unit_data_size()
{
	int size;

	pkt >> size;

    // ?? gettext
    if (size == 0) { //begin send
		memset(pd_remote, 0, sizeof(PLAYERDATA));
		g_console->printf("%s", "pd recv begin");
	} else { //end send
		//info->printstr("pd recv end\n");
		pd_remote->size = size;
		g_console->printf("pd recv end. size %d", (int)pd_remote->size);
		remote.SEND = 1;
	}
	return 1;
}

void Net::send_unit_data(int num, int lev, int col, int row, MANDATA *md, ITEMDATA *id)
{
	if (!SEND) return ;

	pkt.create(CMD_UNIT_DATA);
	pkt << num;
	pkt << lev;
	pkt << col;
	pkt << row;
	pkt.push((char *)md, sizeof(MANDATA));
	pkt.push((char *)id, sizeof(ITEMDATA));
	//send();
	send(pkt.str(), pkt.str_len());
}

int Net::recv_unit_data()
{
	int num, lev, col, row;
	MANDATA md;
	ITEMDATA id;

	pkt >> num;
	pkt >> lev;
	pkt >> col;
	pkt >> row;
	pkt.pop((char *) & md, sizeof(MANDATA));
	pkt.pop((char *) & id, sizeof(ITEMDATA));

	if (num > 19) {
		error("PD num > 19");
		return 0;
	}

	pd_remote->lev[num] = lev;
	pd_remote->col[num] = col;
	pd_remote->row[num] = row;
	memcpy(&pd_remote->md[num], &md, sizeof(MANDATA));
	memcpy(&pd_remote->id[num], &id, sizeof(ITEMDATA));

	return 1;
}

void Net::send_map_data(GEODATA *gd)
{
	if (!SEND) return ;

	pkt.create(CMD_MAP_DATA);
	pkt << terrain_set->get_terrain_name(gd->terrain);
	pkt << gd->x_size;
	pkt << gd->y_size;
	pkt << gd->z_size;
	pkt << std::string((char *)&gd->mapdata, (char *)&gd->mapdata + gd->x_size * gd->y_size);
	send(pkt.str(), pkt.str_len());
}

int Net::recv_map_data()
{
	std::string map_name;
	std::string map_data;
	pkt >> map_name;
	pkt >> mapdata.x_size;
	pkt >> mapdata.y_size;
	pkt >> mapdata.z_size;
	pkt >> map_data;
	ASSERT((int)map_data.size() == mapdata.x_size * mapdata.y_size);
	memcpy(&mapdata.mapdata, map_data.data(), map_data.size());
	mapdata.terrain = terrain_set->get_terrain_id(map_name);
	ASSERT(mapdata.terrain >= 0);

	mapdata.load_game = 77;
	scenario->new_coords();
	return 1;
}

void Net::send_time_limit(int time_limit)
{
	if (!SEND) return ;

	pkt.create(CMD_TIME_LIMIT);
	pkt << time_limit;

	send(pkt.str(), pkt.str_len());
}

int Net::recv_time_limit()
{
	int time_limit;
	pkt >> time_limit;
	g_time_limit = time_limit;
	return 1;
}

void Net::send_p2_start_sit(int is_sit)
{
	if (!SEND) return ;

	pkt.create(CMD_P2_ISSIT);
	pkt << is_sit;

	send(pkt.str(), pkt.str_len());
}

int Net::recv_p2_start_sit()
{
	int is_sit;
	pkt >> is_sit;
	g_p2_start_sit = is_sit;
	return 1;
}


void Net::send_terrain_crc32(const std::string &name, uint32 crc32)
{
	if (!SEND) return ;

	pkt.create(CMD_TERRAIN_CRC32);
	pkt << name;
	pkt << crc32;

	send(pkt.str(), pkt.str_len());
}

std::set<std::string> g_net_allowed_terrains;
std::set<std::string> g_net_invalid_terrains;

int Net::recv_terrain_crc32()
{
	uint32 crc32;

	std::string map_name;

	pkt >> map_name;
	pkt >> crc32;

	if (map_name.empty()) {
		// special end of terrain list marker received (empty terrain name)
		g_console->printf("\n");
        g_console->printf( _("Remote player has the following %d maps that can be used for network game:\n"),
			g_net_allowed_terrains.size());

		std::string tlist = "";
		
		std::set<std::string>::iterator it = g_net_allowed_terrains.begin();
		while (it != g_net_allowed_terrains.end()) {
			tlist.append(tlist.empty() ? "" : ", ");
			tlist.append(*it);
			it++;
		}

		g_console->printf(makecol(255, 255, 0), "%s\n", tlist.c_str());

#undef map
		if (g_net_allowed_terrains.size() != terrain_set->terrain.size()) {
			tlist = "";
			std::map<int, Terrain *>::iterator it = terrain_set->terrain.begin();
			while (it != terrain_set->terrain.end()) {
				if (g_net_allowed_terrains.find(terrain_set->get_terrain_name(it->first)) == g_net_allowed_terrains.end()) {
					tlist.append(tlist.empty() ? "" : ", ");
					tlist.append(it->second->get_name());
				}
				it++;
			}
            g_console->printf( _("The following maps can not be used, they are modified or just not installed by remote player:\n") );
			g_console->printf(COLOR_RED00, "%s\n", tlist.c_str());
		}
#define map g_map
		g_console->printf("\n");

		g_net_allowed_terrains.insert("");
		return 1;
	}

	int index = terrain_set->get_terrain_id(map_name);
	if (index >= 0 && crc32 == terrain_set->get_terrain_crc32(index))
		g_net_allowed_terrains.insert(map_name);
	else
		g_net_invalid_terrains.insert(map_name);

	return 1;
}

void Net::send_equipment()
{
	if (!SEND) return;
	pkt.create(CMD_EQUIPMENT);
	lua_pushstring(L, "QueryEquipmentInfo");
	lua_gettable(L, LUA_GLOBALSINDEX);
	lua_safe_call(L, 0, 1);
	ASSERT(lua_isstring(L, -1));
	pkt << lua_tostring(L, -1);
	lua_pop(L, 1);
	send(pkt.str(), pkt.str_len());
}

int Net::recv_equipment()
{
	std::string data;
	
	pkt >> data;
	
	lua_pushstring(L, "SyncEquipmentInfo");
	lua_gettable(L, LUA_GLOBALSINDEX);
	lua_pushstring(L, data.c_str());
	lua_safe_call(L, 1, 0);

	return 1;
}


void Net::send_scenario()
{
	if (!SEND) return ;

	pkt.create(CMD_SCENARIO);
	pkt << scenario->type;
	pkt << scenario->x1;
	pkt << scenario->x2;
	pkt << scenario->y1;
	pkt << scenario->y2;

	send(pkt.str(), pkt.str_len());
	
	net->send_debug_message("scenario:%s", scenario->name[scenario->type]);
	//local.START = 0;
	//remote.START = 0;
}

int Net::recv_scenario()
{
	int type;
	
	pkt >> type;
	
	scenario->new_scenario(type);
	
	pkt >> scenario->x1;
	pkt >> scenario->x2;
	pkt >> scenario->y1;
 	pkt >> scenario->y2;
 	
	//local.START = 0;
	//remote.START = 0;
	
	mapdata.load_game = 77;

	return 1;
}

void Net::send_rules(int index, int value)
{
	if (!SEND) return ;

	pkt.create(CMD_RULES);
	pkt << index;
	pkt << value;
	
	send(pkt.str(), pkt.str_len());
	
	local.SEND =
	local.START = 
	remote.SEND =
	remote.START = 0;
}

int Net::recv_rules()
{
	int index;
	
	pkt >> index;
	pkt >> scenario->rules[index];

	local.SEND =
	local.START = 
	remote.SEND =
	remote.START = 0;

	return 1;
}

void Net::send_options(int scenario_type, int index, int value)
{
	if (!SEND) return ;

	pkt.create(CMD_OPTIONS);
	pkt << scenario_type;
	pkt << index;
	pkt << value;
	
	send(pkt.str(), pkt.str_len());
	
    if (scenario->options[scenario_type][index]->type != OPT_HIDDEN)
        local.SEND =
        remote.SEND =
        local.START = 
        remote.START = 0;
}

int Net::recv_options()
{
	int scenario_type;
	int index;
	
	pkt >> scenario_type;
	pkt >> index;
	pkt >> scenario->options[scenario_type][index]->value;

    if (scenario->options[scenario_type][index]->type != OPT_HIDDEN)
        local.SEND =
        local.START = 
        remote.SEND =
        remote.START = 0;
	
    if (scenario->options[scenario_type][index]->reset_deploy)
    {
        mapdata.load_game = 77;
        // We need to update the deployment type not only in
        // the option, but also in the scenario.
        scenario->update_deploy_type();
    }

    return 1;
}

void Net::send_panic(int NID, int action)
{
	if (!SEND) return ;

	pkt.create(CMD_PANIC);
	pkt << NID;
	pkt << action;
	send();
}

int Net::recv_panic()
{
	int NID, action;

	pkt >> NID;
	pkt >> action;

	Soldier *ss = findman(NID);
	if (ss != NULL) {
		SEND = 0;
		ss->panic(action);
		SEND = 1;
		return 1;
	} else {
		error("NID");
	}
	return 0;
}

void Net::send_morale_change(int delta)
{
	if (!SEND) return ;

	pkt.create(CMD_MORALE);
	pkt << delta;
	send();
}

int Net::recv_morale_change()
{
	int delta;

	pkt >> delta;

	SEND = 0;
	platoon_remote->change_morale(delta, false);
	SEND = 1;
	return 1;
	
	return 0;
}

extern int g_tie;

void Net::send_tie(int who)
{
    if (!SEND) return;
    pkt.create(CMD_TIE);
    pkt << who;
    send();
}

int Net::recv_tie()
{
    int k, who;
    char buf[STDBUFSIZE];
    pkt >> who;
    k = (1 << who);
    if (gametype != GAME_TYPE_HOTSEAT)
        g_tie ^= k; // XOR - Should be done only once.
    if (g_tie == 3) {
        sprintf(buf, "%s", _("Opponent: Draw offer accepted"));
    } else if (g_tie & k) {
        sprintf(buf, "%s", _("Opponent: Draw offered"));
    } else {
        sprintf(buf, "%s", _("Opponent: Draw offer recalled"));
    }
    g_console->printf(COLOR_SYS_PROMPT, buf);
    battle_report("# %s\n", buf);
    return 0;
}

extern int g_random_init[2];

void Net::send_initrand(int init_num)
{
    if (!SEND) return;
    pkt.create(CMD_INITRAND);
    pkt << init_num;
    send();
}

int Net::recv_initrand()
{
    int initrand;
    pkt >> initrand;
    g_random_init[1] = initrand;
    return 0;
}

void Net::send_debug_message(const char *fmt, ...)
{
	if (gametype != GAME_TYPE_INTERNET_SERVER) return;

	char buffer[2048];
	memset(buffer, 0, sizeof(buffer));

	va_list arglist;
	va_start(arglist, fmt);

	uvszprintf(buffer, sizeof(buffer), fmt, arglist);

	va_end(arglist);

	m_internet_server->send_packet(SRV_DEBUG_MESSAGE, buffer);
}

void Net::flush()
{
	if (gametype != GAME_TYPE_INTERNET_SERVER) return;
	m_internet_server->flush_sent_packets();
}
