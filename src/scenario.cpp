/*
This file is part of "UFO 2000" aka "X-COM: Gladiators"
                    http://ufo2000.sourceforge.net/
Copyright (C) 2000-2001  Alexander Ivanov aka Sanami
Copyright (C) 2002-2004  ufo2000 development team

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

#include "global.h"
#include "scenario.h"
#include "multiplay.h"
#include "platoon.h"
#include "soldier.h"
#include "map.h"
#include "cell.h"
#include "place.h"
#include "units.h"
#include "item.h"

IMPLEMENT_PERSISTENCE(Scenario, "Scenario");

int explosives[3][8] = {{GRENADE, SMOKE_GRENADE, PROXIMITY_GRENADE, CANNON_HE_AMMO, CANNON_I_AMMO, AUTO_CANNON_HE_AMMO, AUTO_CANNON_I_AMMO, STUN_MISSILE},
						{HIGH_EXPLOSIVE, SMALL_ROCKET, INCENDIARY_ROCKET, 0xfe, 0xfe, 0xfe, 0xfe, 0xfe},
						{ALIEN_GRENADE, LARGE_ROCKET, BLASTER_BOMB, 0xfe, 0xfe, 0xfe, 0xfe, 0xfe}};
						
Scenario::Scenario (int sc_type)
{
	//we need to clear briefing strings in case we won't use all of them
	for (int i = 0; i < SCENARIO_NUMBER; i++) {
	    for (int j = 0; j < 8; j++) {
	        briefing_left[i][j] = "";
	        briefing_right[i][j] = "";
		}
	}

	init_deathmatch();
	init_escape();	
	init_sabotage();	
	init_control();
	init_assassin();
	init_hold();
	init_break();       
	init_capture();
	
	rules[0] = 3;	//all explosives allowed
	rules[1] = 15;	//15k points limit
	rules[2] = 0;	//no turn limit
	rules[3] = 0;   //all map isn't explored
	rules[4] = 0;	//weapons on ground in editor aren't allowed	
	
	new_scenario(sc_type);
}

void Scenario::init_deathmatch ()
{
	name[SC_DEATHMATCH] = "Deathmatch";
	
	briefing_left[SC_DEATHMATCH][0] = briefing_right[SC_DEATHMATCH][0] = "Kill 'em all!";
	
	options[SC_DEATHMATCH][0] = new Option(OPT_NONE);
	options[SC_DEATHMATCH][1] = new Option(OPT_NONE);
	options[SC_DEATHMATCH][2] = new Option(OPT_NONE);
}
            
void Scenario::init_escape ()
{
	name[SC_ESCAPE] = "Escape";

	briefing_left[SC_ESCAPE][0] = "You must get your leader (first selected soldier)";
	briefing_left[SC_ESCAPE][1] = "to the opposite edge of the map to win.          ";
	briefing_left[SC_ESCAPE][2] = "Your leader is always visible on your opponent's ";
	briefing_left[SC_ESCAPE][3] = "minimap.";
	
    briefing_right[SC_ESCAPE][0] = "You must kill enemy leader (first selected       ";
	briefing_right[SC_ESCAPE][1] = "soldier) before he gets to your edge of the map. ";
	briefing_right[SC_ESCAPE][2] = "Leader is always visible on your minimap.        ";
	
	options[SC_ESCAPE][0] = new Option(OPT_SWITCH, 0, "Leader can use two-handed weapons", "Leader can't use two-handed weapons", false);	
	options[SC_ESCAPE][1] = new Option(OPT_NONE);
	options[SC_ESCAPE][2] = new Option(OPT_NONE);
}
            
void Scenario::init_sabotage ()
{
	name[SC_SABOTAGE] = "Diversion";
                                     
	briefing_left[SC_SABOTAGE][0] = "You must place high explosives at places which   ";
	briefing_left[SC_SABOTAGE][1] = "are indicated on your minimap. You can have high ";
	briefing_left[SC_SABOTAGE][2] = "explosives even if they aren't allowed by rules  ";
	briefing_left[SC_SABOTAGE][3] = "of the match.                                    ";   
	
	briefing_right[SC_SABOTAGE][0] = "You must kill all enemy soldiers before they     ";
	briefing_right[SC_SABOTAGE][1] = "plant explosives at places which are indicated on";
	briefing_right[SC_SABOTAGE][2] = "the minimap.                                     ";
		
	options[SC_SABOTAGE][0] = new Option(OPT_NONE);
	options[SC_SABOTAGE][1] = new Option(OPT_NONE);
	options[SC_SABOTAGE][2] = new Option(OPT_NONE);
}
	
void Scenario::init_control ()
{
	name[SC_CONTROL] = "Control";
                                    
	briefing_left[SC_CONTROL][0] = briefing_right[SC_CONTROL][0] = "You must control the 10x10 area in the centre of ";
	briefing_left[SC_CONTROL][1] = briefing_right[SC_CONTROL][1] = "the map for number of successive half-turns set  ";
	briefing_left[SC_CONTROL][2] = briefing_right[SC_CONTROL][2] = "in the \"Options\" section.                      ";
	briefing_left[SC_CONTROL][3] = briefing_right[SC_CONTROL][3] = "To control an area you have to have in it more   ";
	briefing_left[SC_CONTROL][4] = briefing_right[SC_CONTROL][4] = "soldiers than your opponent.                     ";

	options[SC_CONTROL][0] = new Option(OPT_NUMBER, 3, 1, 2, 20, 0, "Half-turns to control the area", false);
	options[SC_CONTROL][1] = new Option(OPT_NONE);
	options[SC_CONTROL][2] = new Option(OPT_NONE);
}

void Scenario::init_assassin ()
{
	name[SC_ASSASSIN] = "Assassination";
                                     
	briefing_left[SC_ASSASSIN][0] = "You must kill enemy leader (first selected       ";
	briefing_left[SC_ASSASSIN][1] = "soldier). Enemy leader is always visible on your ";
	briefing_left[SC_ASSASSIN][2] = "minimap.                                         ";
	                                  
	briefing_right[SC_ASSASSIN][0] = "You must save your leader (first selected        ";
	briefing_right[SC_ASSASSIN][1] = "soldier). He is always visible for your opponent ";
	briefing_right[SC_ASSASSIN][2] = "on the minimap.                                  ";
			
	options[SC_ASSASSIN][0] = new Option(OPT_SWITCH, 0, "Leader can use two-handed weapons", "Leader can't use two-handed weapons", false);	
	options[SC_ASSASSIN][1] = new Option(OPT_NONE);
	options[SC_ASSASSIN][2] = new Option(OPT_NONE);
}

void Scenario::init_hold ()
{
	name[SC_HOLD] = "Hold";
                                 
	briefing_left[SC_HOLD][0] = "You must save at least half of your squad        ";
	briefing_left[SC_HOLD][1] = "(rounded down) until the end of the match (number";
	briefing_left[SC_HOLD][2] = "of turns is set in the \"Options\" section).       ";
	
	briefing_right[SC_HOLD][0] = "You must kill more than half of enemy squad      ";
	briefing_right[SC_HOLD][1] = "(rounded down) until the end of the match (number";
	briefing_right[SC_HOLD][2] = "of turns is set in the \"Options\" section).       ";
			
	options[SC_HOLD][0] = new Option(OPT_NUMBER, 5, 1, 1, 20, 0, "Turns to hold (match length)", false);
	options[SC_HOLD][1] = new Option(OPT_SWITCH, 1, "\"Surrounded\" deployment", "Standard deployment", true);
	options[SC_HOLD][2] = new Option(OPT_HIDDEN, 0);
}

void Scenario::init_break ()
{
	name[SC_BREAK] = "Breakthrough";
	
	briefing_left[SC_BREAK][0] = "You must bring at least half of your squad       ";
	briefing_left[SC_BREAK][1] = "(rounded up) to the opposite edge of the map if  ";
	briefing_left[SC_BREAK][2] = "standard deployment is selected or to any edge if";
	briefing_left[SC_BREAK][3] = "\"surrounded\" deployment is selected.             ";
	
	briefing_right[SC_BREAK][0] = "You must kill more than half of enemy squad      ";
	briefing_right[SC_BREAK][1] = "(rounded up) before they get to your edge of the ";
	briefing_right[SC_BREAK][2] = "map if standard deployment is selected or to any ";
	briefing_right[SC_BREAK][3] = "edge if \"surrounded\" deployment is selected.     ";
				
	options[SC_BREAK][0] = new Option(OPT_SWITCH, 0, "\"Surrounded\" deployment", "Standard deployment", true);
	options[SC_BREAK][1] = new Option(OPT_HIDDEN, 0);
	options[SC_BREAK][2] = new Option(OPT_NONE);
}              

void Scenario::init_capture ()
{
	name[SC_CAPTURE] = "Capture";
	                                
	briefing_left[SC_CAPTURE][0] = "You must capture enemy leader (first selected    ";
	briefing_left[SC_CAPTURE][1] = "soldier). To do this you must stun him and bring ";
	briefing_left[SC_CAPTURE][2] = "to your edge of the map. Leader is always visible";
	briefing_left[SC_CAPTURE][3] = "on your minimap.                                 ";
	
	briefing_right[SC_CAPTURE][0] = "You must save your leader (first selected man)   ";
	briefing_right[SC_CAPTURE][1] = "from capturing by enemy. He is always visible on ";
	briefing_right[SC_CAPTURE][2] = "your opponent's minimap.                         ";
	
	options[SC_CAPTURE][0] = new Option(OPT_SWITCH, 0, "Leader can have two-handed weapons", "Leader can't have two-handed weapons", false);
	options[SC_CAPTURE][1] = new Option(OPT_NONE);
	options[SC_CAPTURE][2] = new Option(OPT_NONE);
}

void Scenario::new_scenario (int sc_type)
{
	if (sc_type <= -1)
	    sc_type = SCENARIO_NUMBER - 1;
	    
	if (sc_type >= SCENARIO_NUMBER)
		sc_type = SC_DEATHMATCH;

	type = sc_type;

	//g_console->printf(name[type]);
	//if (HOST)
	//	g_console->printf(briefing_left[type]);
	//else
	//	g_console->printf(briefing_right[type]);
		
	new_coords();
	// We need to set the deployment type at the initialization stage.
	update_deploy_type();
}

bool Scenario::new_scenario (std::string sc_name)
{
	for (int i = 0; i < SCENARIO_NUMBER; i++) {
		if (sc_name == name[i]) {
			new_scenario(i);
			return true;
		}
	}	
	
	return false;
}

void Scenario::start ()
{
	if (rules[3]) {
	    // Set the entire map visible:
	    for (int i = 0; i < 4; i++) {
	        for (int j = 0; j < 10 * mapdata.x_size; j++) {
	            for (int k = 0; k < 10 * mapdata.y_size; k++) {
	                platoon_local->set_seen(i, j, k, 1);
	                platoon_remote->set_seen(i, j, k, 1);
				}
			}
		}
	}

	if (type == SC_CONTROL) {
	    // Reset the control time to zero:
		turn_hold[0] = turn_hold[1] = -1;
	}
}

void Scenario::new_coords ()
{
	turn_hold[0] = turn_hold[1] = -1;

	x1 = x2 = y1 = y2 = 0; //in case they won't be used
	
	switch (type) {
	    case SC_DEATHMATCH:
	    break;

	    case SC_ESCAPE:
	    break;

	    case SC_SABOTAGE:
		x1 = (rand() % ((mapdata.x_size - 2) * 10)) + 20;
		x2 = (rand() % ((mapdata.x_size - 2) * 10)) + 20;
		y1 = rand() % (mapdata.y_size * 10);
		y2 = rand() % (mapdata.y_size * 10);

		return;

	    case SC_CONTROL:
	    x1 = (mapdata.x_size * 10 - 10) / 2;
		x2 = x1 + 10;
  		y1 = (mapdata.y_size * 10 - 10) / 2;
        y2 = y1 + 10;
        return;
        
        case SC_ASSASSIN:
        break;
        
        case SC_HOLD:
        break;
        
        case SC_BREAK:
        break;
	}
}

int Scenario::check_conditions ()
{
	int n = 0;
	
	switch (type) {
		case SC_DEATHMATCH:
		break;

		case SC_ESCAPE:
		n = conditions_escape();
		break;

		case SC_SABOTAGE:
        n = conditions_sabotage();
		break;

		case SC_CONTROL:
        n = conditions_control();
		break;
		
		case SC_ASSASSIN:
		n = conditions_assassin();
		break;
		
		case SC_HOLD:
		n = conditions_hold();
		break;
		
		case SC_BREAK:
		n = conditions_break();
		break;
		
		case SC_CAPTURE:
		n = conditions_capture();
		break;
	}	
	if (n != 0) return n;
	
	n = conditions_common();
	if (n != 0) return n;
	
	return 0;
}

int Scenario::conditions_common ()
{
	int win = 0, loss = 0;
	
	int num_l = 0, num_r = 0;
	
    if (platoon_remote->captain() == NULL)
		win = 2;
		
	if (platoon_local->captain() == NULL)
		loss = 1;

	if (rules[2] > 0) {
		if ((turn / 2) + 1 > rules[2]) {
	        num_l = platoon_local->num_of_men();
	        num_r = platoon_remote->num_of_men();
	        
	        if (num_l >= num_r)
	            win = 2;
			else
			    loss = 1;
		}
	}

	return win + loss;
}

int Scenario::conditions_escape ()
{
	int win = 0, loss = 0;

    int x;
	Soldier *vip;
	
	if (p1->findman(1000) == NULL) {
		if (p1 == platoon_local)
			loss = 1;
		else
			win = 2;
	} else {
		vip = p1->findman(1000);
		x = vip->x;
		if (x == (mapdata.x_size * 10) - 1) {
			if (platoon_local->belong(vip))
				win = 2;
			else
				loss = 1;
		}
	}	
	
	return win + loss;
}

int Scenario::conditions_sabotage ()
{
	int win = 0, loss = 0;
	
    bool target1 = false, target2 = false;
	char buf[10000]; memset(buf, 0, sizeof(buf));
	int len = 0;
	
	map->cell(0, x1, y1)->get_place()->build_items_stats(buf, len);
	for (int i = 0; i < len; i++) {
	    if (buf[i] == HIGH_EXPLOSIVE) {
	    	target1 = true;
	    	break;
		}
	}
	
	for (int i = 0; i < len; i++) buf[i] = 0;
	len = 0; 
	
	map->cell(0, x2, y2)->get_place()->build_items_stats(buf, len);
	for (int i = 0; i < len; i++) {
	    if (buf[i] == HIGH_EXPLOSIVE) {
	    	target2 = true;
	    	break;
		}
	}

	if (target1 && target2) {
	    if (p1 == platoon_local)
	        win = 2;
		else
		    loss = 1;
	}
	
 	return win + loss;
}

int Scenario::conditions_control ()
{
	int win = 0, loss = 0;
	
    int temp1 = 0, temp2 = 0;

    for (int i = 0; i < p1->num_of_men(); i++) {
  	    if (p1->findnum(i)->x >= x1 && p1->findnum(i)->x < x2 && p1->findnum(i)->y >= y1 && p1->findnum(i)->y < y2)
  	        temp1++;
	}
	for (int i = 0; i < p2->num_of_men(); i++) {
       	if (p2->findnum(i)->x >= x1 && p2->findnum(i)->x < x2 && p2->findnum(i)->y >= y1 && p2->findnum(i)->y < y2)
  	        temp2++;
	}
	if (temp1 > temp2) {
	    //in hotseat mode this check is performed twice more times than in internet mode
		if (net->gametype == GAME_TYPE_HOTSEAT)
  	    	turn_hold[0]++;
		else
		    turn_hold[0] += 2;
  	    turn_hold[1] = -1;
  	    g_console->printf(xcom1_color(98), "Player 1 is controlling the target area for %d turn(s).", (turn_hold[0] / 2) + 1);
  	}
	if (temp1 < temp2) {
  	    turn_hold[0] = -1;
  	    if (net->gametype == GAME_TYPE_HOTSEAT)
  	    	turn_hold[1]++;
		else
		    turn_hold[1] += 2;
  	    g_console->printf(xcom1_color(98), "Player 2 is controlling the target area for %d turn(s).", (turn_hold[1] / 2) + 1);
  	}
	if (temp1 == temp2) {
	    turn_hold[0] = -1;
	    turn_hold[1] = -1;
		g_console->printf(xcom1_color(98), "Nobody is controlling the target area.");
    }
	// The "- 2" in the following lines means that there will be no watch
	// mode in hotseat when one of the players wins - he wins immediately
	// after his turn.
	if (turn_hold[0] >= options[SC_CONTROL][0]->value * 2 - 2 && p1 == platoon_local)
	    win = 2;
	if (turn_hold[0] >= options[SC_CONTROL][0]->value * 2 - 2 && p1 == platoon_remote)
	    loss = 1;
	if (turn_hold[1] >= options[SC_CONTROL][0]->value * 2 - 2 && p2 == platoon_local)
	    win = 2;
	if (turn_hold[1] >= options[SC_CONTROL][0]->value * 2 - 2 && p2 == platoon_remote)
	    loss = 1;
	    
    return win + loss;
}

int Scenario::conditions_assassin ()
{
	int win = 0, loss = 0;
	
    if (p2->findman(1000) == NULL && p2->findman(2000) == NULL) {
		if (p2 == platoon_local)
		    loss = 1;
		else
		    win = 2;
	}
	
	return win + loss;
}

int Scenario::conditions_hold ()
{
	int win = 0, loss = 0;
	
	int num_of_men = options[SC_HOLD][2]->value;
	
	if (p1->num_of_men() < (num_of_men / 2) + (num_of_men % 2)) {
	    if (p1 == platoon_local)
	        loss = 1;
		else
		    win = 2;
	} else {
		if ((turn / 2) + 1 > (options[SC_HOLD][0]->value - 1) / 2) {
			if (p1 == platoon_local)
				win = 2;
			else
				loss = 1;
		}
	}
	
	return win + loss;
}                               

int Scenario::conditions_break ()
{
	int win = 0, loss = 0;
	
	int num_of_men = options[SC_BREAK][1]->value;
	
	int escaped = 0;
	Soldier *sld;                                 
	
	if (p1->num_of_men() < (num_of_men / 2) + (num_of_men % 2)) {
		if (p1 == platoon_local)
			loss = 1;
		else
			win = 2;
	} else {	
		for (int i = 0; i < mapdata.y_size * 10; i++) {
			sld = map->cell(0, (mapdata.x_size * 10) - 1, i)->get_soldier();
			if (sld != NULL) {
				if (p1->belong(sld))
					escaped++;
			}
		}
		if (escaped >= (num_of_men / 2) + (num_of_men % 2)) {
			if (p1 == platoon_local)
				win = 2;
			else
				loss = 1;
		}
	}
	
	return win + loss;
}
			
int Scenario::conditions_capture ()
{
	int win = 0, loss = 0;
	
	Soldier *vip;
	
	if (p2->findman(2000) == NULL) {
		loss = 1;
		win = 2;
	} else {
		vip = p2->findman(2000);
		if (vip->is_stunned()) {
			for (int i = 0; i < mapdata.y_size * 10; i++) {
				if (map->cell(0, 0, i)->get_place()->isthere(vip->body())) {
					if (platoon_local->belong(vip))
						loss = 1;
					else
						win = 2;
					break;
				}
			}	
		}
	}	
	
	return win + loss;
}

bool Scenario::is_target_on_minimap (int lev, int col, int row, Map *m_map)
{
	switch (type) {
    	case SC_DEATHMATCH:
	    break;
	    
    	case SC_ESCAPE:
    	return minimap_escape(lev, col, row, m_map);
		break;
	
		case SC_SABOTAGE:
        return minimap_sabotage(lev, col, row);
		break;
		
		case SC_CONTROL:
		break;
	
		case SC_ASSASSIN:
		return minimap_assassin(lev, col, row, m_map);
		break;
		
		case SC_HOLD:
		break;
		
		case SC_BREAK:
		break;
		
		case SC_CAPTURE:
		return minimap_capture(lev, col, row, m_map);
		break;
	}
	
	return false;
}

void Scenario::draw_minimap_rectangle (BITMAP *bmp, int x, int y)
{
	switch (type) {
		case SC_DEATHMATCH:
		break;
		
		case SC_ESCAPE:
		break;
		
		case SC_SABOTAGE:
		break;
		
		case SC_CONTROL:
		minimap_control(bmp, x, y);
		break;
		
		case SC_ASSASSIN:
		break;
		
		case SC_HOLD:
		break;
		
		case SC_BREAK:
		break;
	}
}

bool Scenario::minimap_escape (int lev, int col, int row, Map *m_map)
{
	if (m_map->man(lev, col, row) != NULL) {
		if (m_map->man(lev, col, row)->get_NID() == 1000 && p1->belong(m_map->man(lev, col, row)) && p1 == platoon_remote)
			return true;
		if (m_map->man(lev, col, row)->get_NID() == 2000 && p1->belong(m_map->man(lev, col, row)) && p1 == platoon_remote)
		    return true;
	}

	return false;
}

bool Scenario::minimap_sabotage (int lev, int col, int row)
{
    if (lev == 0 && col == x1 && row == x1)
  		return true;
	if (lev == 0 && col == x2 && row == y2)
	    return true;
	    
	return false;
}

void Scenario::minimap_control (BITMAP *bmp, int x, int y)
{
	rect(bmp, x + x1 * 4, y + y1 * 4, x + x2 * 4, y + y2 * 4, xcom1_color(1));
}

bool Scenario::minimap_assassin (int lev, int col, int row, Map *m_map)
{
    if (m_map->man(lev, col, row) != NULL) {
		if (m_map->man(lev, col, row)->get_NID() == 1000 && p2->belong(m_map->man(lev, col, row)) && p2 == platoon_remote)
			return true;
		if (m_map->man(lev, col, row)->get_NID() == 2000 && p2->belong(m_map->man(lev, col, row)) && p2 == platoon_remote)
		    return true;
	}

	return false;
}

bool Scenario::minimap_capture (int lev, int col, int row, Map *m_map)
{
    if (m_map->man(lev, col, row) != NULL) {
		if (m_map->man(lev, col, row)->get_NID() == 1000 && p2->belong(m_map->man(lev, col, row)) && p2 == platoon_remote)
			return true;
		if (m_map->man(lev, col, row)->get_NID() == 2000 && p2->belong(m_map->man(lev, col, row)) && p2 == platoon_remote)
		    return true;
	}

	return false;
}

bool Scenario::is_correct_platoon (long points, Platoon *platoon, char *first_soldier, PanPos pos, char buf[10000], int len, int num_of_men_sel)
{
	bool n = true;
	
	switch (type) {
	    case SC_DEATHMATCH:
	    break;
	    
	    case SC_ESCAPE:
	    n = platoon_escape(platoon, pos, first_soldier);
	    break;
	    
	    case SC_SABOTAGE:
     	n = platoon_sabotage(pos, buf, len);
	    break;
	    
	    case SC_CONTROL:
	    break;
	    
	    case SC_ASSASSIN:
	    n = platoon_assassin(platoon, pos, first_soldier);
	    break;
	    
	    case SC_HOLD:
	    n = platoon_hold (pos, num_of_men_sel);
	    break;
	    
	    case SC_BREAK:
	    n = platoon_break (pos, num_of_men_sel);
	    break;
	    
	    case SC_CAPTURE:
	    n = platoon_capture (platoon, first_soldier, pos, buf, len);
	    break;
	}
	
	if (n == false) return n;
	
	n = platoon_common(points, platoon, pos, buf, len);
	if (n == false) return n;
	
	return true;
}

bool Scenario::platoon_common (long points, Platoon *platoon, PanPos pos, char buf[10000], int len)
{
	if(rules[0] < 3) {
		for (int i = 0; i < len; i++) {
			for (int j = rules[0]; j < 3; j++) {
			    for (int k = 0; k < 8; k++) {
			        if (buf[i] == explosives[j][k]) {
			            if (type != SC_SABOTAGE || explosives[j][k] != HIGH_EXPLOSIVE || pos != POS_LEFT) {
							g_console->printf(xcom1_color(36), "%s isn't allowed.", Item::obdata_name(explosives[j][k]).c_str());
			            	return false;
						}
					}
				}
			}
		}
	}
	
	if (points > rules[1] * 1000) {
	    g_console->printf(xcom1_color(36), "%d points limit exceeded!", rules[1] * 1000);
	    return false;
	}
	
	if (!rules[4]) {
		char tmp[10000]; memset(tmp, 0, sizeof(tmp));
		//char *buf2 = tmp;
		int len2 = 0;
		
		for (int i = 0; i < platoon->num_of_men(); i++)
			platoon->findnum(i)->place(P_MAP)->build_items_stats(tmp, len2);
			
		if (len2 > 0) {
			g_console->printf(xcom1_color(36), "Items on the ground aren't allowed (you have: %d, including unselected soldiers).", len2);
			return false;
		}
	}

	return true;
}

bool Scenario::platoon_escape (Platoon *platoon, PanPos pos, char *first_soldier)
{
	if (!options[SC_ESCAPE][0]->value && pos == POS_LEFT) {
    	char buf[10000]; memset(buf, 0, sizeof(buf));
		int len = 0;
		extern int weapon[];

		platoon->findman(first_soldier)->build_items_stats (buf, len);
    	
		for (int w = 0; w < 40; w++) {
			int num = 0;
			for (int i = 0; i < len; i++) {
				if (weapon[w] == buf[i])
					num++;
			}
			if ((Item::obdata_twoHanded(weapon[w]) > 0) && (num > 0)) {
				g_console->printf(xcom1_color(36), "Soldier #1 can't have two-handed weapons!");
				return false;
			}
		}
	}

	return true;
}

bool Scenario::platoon_sabotage (PanPos pos, char buf[10000], int len)
{
	if (pos == POS_LEFT) {
		int he_num = 0;
		
		for (int i = 0; i < len; i++) {
			if (buf[i] == HIGH_EXPLOSIVE)
				he_num++;
		}

		if (he_num < 2) {
		    g_console->printf(xcom1_color(36), "You must have at least 2 high explosives.");
			return false;
		}
	}
	
	return true;
}

bool Scenario::platoon_assassin (Platoon *platoon, PanPos pos, char *first_soldier)
{
	if (!options[SC_ASSASSIN][0]->value && pos == POS_RIGHT) {
    	char buf[10000]; memset(buf, 0, sizeof(buf));
		int len = 0;
		extern int weapon[];

		platoon->findman(first_soldier)->build_items_stats (buf, len);

		for (int w = 0; w < 40; w++) {
			int num = 0;
			for (int i = 0; i < len; i++) {
				if (weapon[w] == buf[i])
					num++;
			}
			if ((Item::obdata_twoHanded(weapon[w]) > 0) && (num > 0)) {
				g_console->printf(xcom1_color(36), "Soldier #1 can't have two-handed weapons!");
				return false;
			}
		}
	}

	return true;
}

bool Scenario::platoon_hold (PanPos pos, int num_of_men_sel)
{
	if (pos == POS_LEFT) {
	    options[SC_HOLD][2]->value = num_of_men_sel;
	    net->send_options(SC_HOLD, 2, num_of_men_sel);
	}

	return true;
}

bool Scenario::platoon_break (PanPos pos, int num_of_men_sel)
{
	if (pos == POS_LEFT) {
	    options[SC_BREAK][1]->value = num_of_men_sel;
	    net->send_options(SC_BREAK, 1, num_of_men_sel);
	}

	return true;
}

bool Scenario::platoon_capture (Platoon *platoon, char *first_soldier, PanPos pos, char buf[10000], int len)
{
	if (pos == POS_LEFT) {
		bool stun_rod = false, stun_gun = false, stun_bomb = false;
		
		for (int i = 0; i < len; i++) {
			if (buf[i] == STUN_ROD)
				stun_rod = true;
			if (buf[i] == SMALL_LAUNCHER)
				stun_gun = true;
			if (buf[i] == STUN_MISSILE)
				stun_bomb = true;
		}

		if (!stun_rod && (!stun_gun || !stun_bomb)) {
		    g_console->printf(xcom1_color(36), "You must have at least one stun rod or one loaded stun launcher.");
			return false;
		}
	} else {
		if (!options[SC_CAPTURE][0]->value) {
	    	char buf2[10000]; memset(buf2, 0, sizeof(buf2));
			int len2 = 0;
			extern int weapon[];

			platoon->findman(first_soldier)->build_items_stats (buf2, len2);
   	
			for (int w = 0; w < 40; w++) {
				int num = 0;
				for (int i = 0; i < len2; i++) {
					if (weapon[w] == buf2[i])
						num++;
				}
				if ((Item::obdata_twoHanded(weapon[w]) > 0) && (num > 0)) {
					g_console->printf(xcom1_color(36), "Soldier #1 can't have two-handed weapons!");
					return false;
				}
			}
		}
	}
	
	return true;
}

bool Scenario::is_correct_place (PanPos pos, int x, int y)
{
	switch (pos == POS_LEFT ? deploy_type[0] : deploy_type[1]) {
		case DEP_LEFT:
		return x < 10;

		case DEP_RIGHT:
		return x >= (mapdata.x_size - 1) * 10;

		case DEP_CENTER:
		return x >= (mapdata.x_size - 2) * 10 / 2 && x < (mapdata.x_size - 2) * 10 / 2 + 20 && y >= (mapdata.y_size - 2) * 10 / 2 && y < (mapdata.y_size - 2) * 10 / 2 + 20;

		case DEP_SURROUND:
		return x < 5 || x >= mapdata.x_size * 10 - 5 || y < 5 || y >= mapdata.y_size * 10 - 5;
	}

	return false;
}

void Scenario::draw_deploy_zone (PanPos pos, int x, int y, int color)
{
	switch (pos == POS_LEFT ? deploy_type[0] : deploy_type[1]) {
		case DEP_LEFT:
		rect(screen2, x, y, x + 10 * 4, y + mapdata.y_size * 10 * 4 - 1, color);
		break;

		case DEP_RIGHT:
		rect(screen2, x + (mapdata.x_size - 1) * 10 * 4, y, x + mapdata.x_size * 10 * 4 - 1, y + mapdata.y_size * 10 * 4 - 1, color);
		break;

		case DEP_CENTER:
		rect(screen2, x + (mapdata.x_size - 2) * 10 / 2 * 4, y + (mapdata.y_size - 2) * 10 / 2 * 4, x + (mapdata.x_size - 2) * 10 / 2 * 4 + 20 * 4, y + (mapdata.y_size - 2) * 10 / 2 * 4 + 20 * 4, color);
		break;

		case DEP_SURROUND:
		rect(screen2, x, y, x + mapdata.x_size * 10 * 4 - 1, y + mapdata.y_size * 10 * 4 - 1, color);
		rect(screen2, x + 5 * 4, y + 5 * 4, x + mapdata.x_size * 10 * 4 - 5 * 4, y + mapdata.y_size * 10 * 4 - 5 * 4, color);
		break;
	}
}

void Scenario::update_deploy_type ()
{
	switch (type) {
	    case SC_DEATHMATCH:
		deploy_type[0] = DEP_LEFT;
		deploy_type[1] = DEP_RIGHT;
	    break;

	    case SC_ESCAPE:
		deploy_type[0] = DEP_LEFT;
		deploy_type[1] = DEP_RIGHT;
	    break;

	    case SC_SABOTAGE:
		deploy_type[0] = DEP_LEFT;
		deploy_type[1] = DEP_RIGHT;
	    break;

	    case SC_CONTROL:
		deploy_type[0] = DEP_LEFT;
		deploy_type[1] = DEP_RIGHT;
	    break;

	    case SC_ASSASSIN:
		deploy_type[0] = DEP_SURROUND;
		deploy_type[1] = DEP_CENTER;
	    break;
	    
	    case SC_HOLD:
		if (options[SC_HOLD][1]->value) {
			deploy_type[0] = DEP_CENTER;
			deploy_type[1] = DEP_SURROUND;
		} else {
			deploy_type[0] = DEP_LEFT;
			deploy_type[1] = DEP_RIGHT;
		}
		break;
		
		case SC_BREAK:
		if (options[SC_BREAK][0]->value) {
			deploy_type[0] = DEP_CENTER;
			deploy_type[1] = DEP_SURROUND;
		} else {
			deploy_type[0] = DEP_LEFT;
			deploy_type[1] = DEP_RIGHT;
		}
		break;
		
		case SC_CAPTURE:
		deploy_type[0] = DEP_LEFT;
		deploy_type[1] = DEP_RIGHT;
		break;
	}
}

bool Scenario::can_use (Soldier *sld, Item *it)
{
	switch (type) {
	    case SC_DEATHMATCH:
	    break;

	    case SC_ESCAPE:
	    return use_escape(sld, it);
	    break;

	    case SC_SABOTAGE:
	    break;

	    case SC_CONTROL:
	    break;

	    case SC_ASSASSIN:
	    return use_assassin(sld, it);
	    break;
	    
	    case SC_HOLD:
		break;
		
		case SC_BREAK:
		break;
		
		case SC_CAPTURE:
		break;
	}

    return true;
}

bool Scenario::use_escape (Soldier *sld, Item *it)
{
	if (!options[SC_ESCAPE][0]->value) {
		if (sld->get_NID() == 1000) {
			if (it->obdata_twoHanded()) {
				g_console->printf(xcom1_color(36), "Leader can't use two-handed weapons.");
				return false;
			}
		}
	}
	
	return true;
}

bool Scenario::use_assassin (Soldier *sld, Item *it)
{
	if (!options[SC_ASSASSIN][0]->value) {
		if (sld->get_NID() == 2000) {
			if (it->obdata_twoHanded()) {
				g_console->printf(xcom1_color(36), "Leader can't use two-handed weapons.");
				return false;
			}
		}
	}
	
	return true;
}
