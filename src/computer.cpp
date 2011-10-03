/*
This file is part of "UFO 2000" aka "X-COM: Gladiators"
                    http://ufo2000.sourceforge.net/
Copyright (C) 2000-2001  Alexander Ivanov aka Sanami
Copyright (C) 2002-2003  ufo2000 development team

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

// Methods marked with General are of general use (utility functions.)
// They could easily be used by another AI.
// Might extract this out at some point.

// Computer placement strategy is in Connect::do_computer_plan()
// Will probably move a portion of this in here at some point

// global includes
#include "stdafx.h"
#include "global.h"

#include <iostream>
#include <fstream>
#include <time.h>
#include <vector>

using namespace std;

// local includes
#include "computer.h"
#include "platoon.h"
#include "map.h"
#include "multiplay.h"

IMPLEMENT_PERSISTENCE(Computer, "Computer");


Computer::Computer() {
    logfile.open("computer.log");
    time_t rawtime;
    time(&rawtime);
    logfile << "=================================================================" << endl;
    logfile << "The current local time is: " << ctime (&rawtime) << endl;

    initialized = false;
    started_turn = false;
    done_with_turn = false;
    vector <Location> enemy_locations;
}


Computer::~Computer() {
    logfile.close();
}


// Assuming that this is the computer player's turn, it will
// continually evaluate what its next move will be and will send that move
// out over the 'wire' (queue.) When the computer determines that no more
// advantageous moves can be made, it signals that it is done with the turn.
void Computer::evaluate()
{
    if (!started_turn)             // do basic setup for turn
        start_new_turn();

    if (!done_with_turn) {         // main computer action 
        locate_enemies();
        int known_enemy_visibility[60][60];
        calculate_known_enemy_visibility(known_enemy_visibility);
        //if (!in_danger(shooter) && needs_reload(shooter)) {
        //    reload(shooter);
        //}
        if (enemies_visible) {
            Location target = select_target();
            Soldier *man = find_optimal_shooter(target);

            logfile << "Acquiring: " << target.to_s() << endl;
            if (man->lhand_item() != NULL && man->lhand_item()->is_grenade()) {
                int delay = man->lhand_item()->delay_time();
                int time_required = man->lhand_item()->obdata_primeTime();
                if (time_required == 0) time_required = man->required(50); 
                if (delay == 0) {
                    logfile << "Priming grenade" << endl;
                    man->prime_grenade(P_ARM_LEFT, 1, time_required);
                } else {
                    logfile << "Throwing" << endl;
                    perform(man, P_ARM_LEFT, THROW, target);
                    done_with_turn = true;
                }
            } else {
                int hit_matrix[60][60];
                shot_matrix_for(hit_matrix, target);
                if (hit_matrix[man->x][man->y] > 0) {
                    Action result = shoot(man, target);
                    if (result == NONE) {
                        done_with_turn = true;
                    }
                } else {
                    logfile << "Cannot hit from this soldier's position" << endl;
                    done_with_turn = true;
                }
            }
        } else {
            logfile << "Attempting to move to 35, 45" << endl;
            platoon_local->findnum(0)->wayto(0, 35, 45);
            done_with_turn = true;
        }
    } else {                       // send turn information and reset state 
        end_turn();
    }
}


/* Given a target, find the man in the computer's squad that would best be
 * able to hit the target, based on TUs, a matrix of places where the enemy
 * can be hit from, and a matrix of enemy visibility to minimize return fire.
 *
 * @return - optimal shooter of target
 */
Soldier * Computer::find_optimal_shooter(Location target)
{
    // TODO: add additional functionality
    return platoon_local->findnum(0);
}


/* Based on the enemies that have been seen this turn and are still believed
 * to be alive, select the optimal enemy to try to eliminate.
 *
 * @return - Location of optimal target
 */
Location Computer::select_target()
{
    // TODO: add additional functionality
    return enemy_locations[0];
}


// Sets up the computer player's instance variables.
void Computer::initialize()
{
    logfile << "Initializing" << endl;
    initialized = true;
}


// Perform basic setup for playing one turn.
void Computer::start_new_turn()
{
    if (!initialized)
        initialize();
    logfile << "Starting turn: " << turn << endl;
    started_turn = true;
    done_with_turn = false;
    enemies_visible = false;
}


// Cleans up after a turn and sends the end of turn message.
void Computer::end_turn()
{
    logfile << "Ending turn: " << turn << endl << endl;
    started_turn = false;
    send_turn();
}


/* There appears to be no easy way to do this, so implementing
 * it here for convenience.
 *
 * @param performer - Soldier to perform action
 * @param hand - hand with which to perform this action
 * @param action - action to perform
 * @param target - Location to direct this action to
 *
 * General.
 */
void Computer::perform(Soldier *performer, int hand, Action action, Location target)
{
    if (performer->assign_target(action, hand) == OK) {
        map->sel_col = target.x;
        map->sel_row = target.y;
        map->sel_lev = target.z;
        performer->try_shoot();
    }
}


/* Given the platoon's currently visible enemies, create a vector of enemy
 * locations that will be used for further analysis.
 *
 * General.
 */
void Computer::locate_enemies()
{
    int32 visible_enemies = platoon_local->get_visible_enemies();
    enemies_visible = (visible_enemies != 0);
    enemy_locations.clear(); // should only get cleared at beginning of turn

    for (int soldier = 0; soldier < MAX_UNITS; soldier++) { // Iterate through bit array
        if (visible_enemies & (0x00000001 << soldier)) {
            Soldier *enemy = platoon_remote->findman(1000 + soldier); // wish there was a better way
            Location location;
            logfile << "I see an enemy soldier at: " <<
                    enemy->x << ", " <<
                    enemy->y << ", " <<
                    enemy->z << endl; 
            location.set(enemy->x, enemy->y, enemy->z);
            enemy_locations.push_back(location); // need more intelligent check (remove killed enemies, remember enemies out of line of sight)
            logfile << "Recording an enemy soldier at: " << location.to_s() << endl; 
        }
    }
}


/* Attempts to use Soldier 'shooter' to shoot a target location using the best
 * means possible (starting with AUTO, next with AIMED, and finally with SNAP)
 *
 * @return - Action performed, or NONE if nothing done
 */
Action Computer::shoot(Soldier *shooter, Location target)
{
    Item *it = shooter->rhand_item();
    Action action = NONE;

    logfile << "Attempting to shoot: " << target.to_s() << endl;

    if (!(it->obdata_isGun() || it->is_laser())) {
        logfile << "Tried to shoot with something that isn't a laser or gun!" << endl;
    } else if(needs_reload(shooter)) {
        logfile << "No clip loaded!" << endl;
        reload(shooter);
    }
    
    if (!needs_reload(shooter)) {
        if (it->obdata_accuracy(AUTO)) {
            int time_required = shooter->required(it->obdata_time(AUTO));
            if (shooter->havetime(time_required * it->obdata_autoShots()) == OK) {
               action = AUTOSHOT;
            }
        }
        if (action == NONE && it->obdata_accuracy(AIMED)) {
            int time_required = shooter->required(it->obdata_time(AIMED));
            if (shooter->havetime(time_required) == OK) {
                action = AIMEDSHOT;
            }
        }
        if (action == NONE && it->obdata_accuracy(SNAP)) {
            int time_required = shooter->required(it->obdata_time(SNAP));
            if (shooter->havetime(time_required) == OK) {
                action = SNAPSHOT;
            }
        }
    }

    if (action == NONE) {
        logfile << "Not shooting" << endl;
    } else {
        logfile << "Shooting type: " << action << endl;
        perform(shooter, P_ARM_RIGHT, action, target);
    }

    return action;
}


/* Given a Soldier 'shooter', try to find a clip on the soldier that can reload
 * his/her weapon.
 *
 * @return - true if successful reloaded
 * @return - false if no clip found or insufficent TU left
 * 
 * General.
 */
bool Computer::reload(Soldier *shooter) {
    if (shooter->rhand_item()->haveclip()) {
        return false;
    }
    logfile << "Attempting to reload" << endl;

    // Determine types of items that the soldier's gun takes for ammunition
    std::string gun_name = shooter->rhand_item()->name();
    std::vector <std::string> acceptable_ammos;
    shooter->rhand_item()->get_ammo_list(gun_name, acceptable_ammos);
    logfile << "Ammo that this soldier has that the weapon \"" << gun_name << "\" takes:" << endl;
    for (unsigned int i = 0; i < acceptable_ammos.size(); i++) {
        logfile << acceptable_ammos[i] << endl;
    }

    // Seeing if the soldier has any ammo in his/her inventory 
    std::vector <Item *> inventory; 
    shooter->get_inventory_list(inventory);
    Item *acceptable_ammo = NULL;
    logfile << "Soldier's inventory:" << endl;
    for (unsigned int inventory_index = 0; inventory_index < inventory.size() && acceptable_ammo == NULL; inventory_index++) {
        logfile << inventory[inventory_index]->name() << endl;
        for (unsigned int ammo_index = 0; ammo_index < acceptable_ammos.size(); ammo_index++) {
            if (inventory[inventory_index]->name() == acceptable_ammos[ammo_index]) {
                logfile << "Found acceptable ammo in inventory: " << acceptable_ammos[ammo_index] << endl;
                acceptable_ammo = inventory[inventory_index];

                // After the ammo is loaded, it will no longer really exist,
                // so remember the info for logging
                int old_place = shooter->place(acceptable_ammo->get_place());
                std::string name = acceptable_ammo->name();
                //int time = acceptable_ammo->obdata_reloadTime() + shooter->calctime(P_ARM_RIGHT, old_place);
                // We only want to try to reload if we have enough time to do this
                // TODO: for some reason, havetime is not working as I would expect.
                //if (shooter->havetime(time, 0) == OK) {
                    net->send_select_item(shooter->NID, old_place, acceptable_ammo->m_x, acceptable_ammo->m_y);
                    if (shooter->load_ammo(P_ARM_RIGHT, shooter->place(acceptable_ammo->get_place()), acceptable_ammo)) {
                        logfile << "Reloaded with \"" << name << "\"" << " from "
                            << old_place << endl;
                        return true;
                    } else {
                        logfile << "Something went wrong with reloading \"" << name <<
                            "\" from " << old_place << endl;
                    }
//                } else {
//                    logfile << "Insufficient time to reload from " << old_place << endl;
//                }
            }
        }
    }

    if (acceptable_ammo == NULL) {
        logfile << "Could not find a clip on this soldier that fits in the gun" << endl;
    }
    return false;
}


/* Determine if a shot fired from a source will hit the target.
 * This function is basically Bullet::showline with some things changed.
 * 
 * General.
 */
int Computer::can_shoot_target(Location source, Location target)
{
    if (source.z == target.z && source.x == target.x && source.y == target.y)
        return 0;

    int xd, yd, zd;

    // modifed from Soldier::calc_bullet_start
    int dir = platoon_local->findnum(0)->dirto(source.x, source.y, target.x, target.y); // hack
    int z0 = source.z * 12 + 8;
    //         dirs   0  1  2   3   4   5  6  7
    int dir2ofs[8] = {1, 1, 0, -1, -1, -1, 0, 1};
    int x0 = source.x * 16 + 8 + DIR_DELTA_X(dir) * 4;
    int y0 = source.y * 16 + 8 + DIR_DELTA_Y(dir) * 4;
    // target the center mini-cell of the target location
    xd = target.x * 16 + 8;
    yd = target.y * 16 + 8;
    zd = target.z * 12 + 8;

    REAL ro = sqrt((double)((xd - x0) * (xd - x0) + (yd - y0) * (yd - y0) + (zd - z0) * (zd - z0)));
    REAL fi = acos((REAL)(zd - z0) / ro);
    REAL te = atan2((REAL)(yd - y0), (REAL)(xd - x0));

    int i;
    for (i = 3; i < 100000; i++) {
        zd = (int)(z0 + i * cos(fi));
        xd = (int)(x0 + i * cos(te) * sin(fi));
        yd = (int)(y0 + i * sin(te) * sin(fi));

        // hit obstacle or fly out of map borders
        if ((!map->inside(zd, xd, yd)) || (!map->pass_lof_cell(zd, xd, yd)))
            return 0;

        // hit enemy soldier, only known soldiers are taken into account in 
        // order to prevent cheating
        if (platoon_remote->check_for_hit(zd, xd, yd) &&
            (platoon_local->is_visible(zd / 12, xd / 16, yd / 16) ||
             known_enemy(xd / 12, yd / 12, zd / 12))) {
            return (target.x == (xd / 16) && target.y == (yd / 16) && target.z == (zd / 12)) ? 1 : 0;
        }
        
        // hit local soldier
        if (platoon_local->check_for_hit(zd, xd, yd)) 
            return -1;
    }

    ASSERT(false); // should never get to this point
    return -1;
}


/* Returns whether an enemy is known to be at a certain location
 * (not necessarily visible due to visibility impairments)
 * 
 * General.
 */
bool Computer::known_enemy(int x, int y, int z)
{
    for (unsigned int i = 0; i < enemy_locations.size(); i++) {
        Location e = enemy_locations[i];
        if (e.x == x && e.y == y && e.z == z)
            return true;
    }
    return false;
}
bool Computer::known_enemy(Location location)
{
    return known_enemy(location.x, location.y, location.z);
}


/* Returns whether the soldier needs a reload. Assumes that the gun is held in
 * the right hand. Also returns false if the gun carries no ammo.
 * 
 * General.
 */
bool Computer::needs_reload(Soldier *shooter) {
    Item *it = shooter->rhand_item();
    if (it == NULL)
        return false;
    return it->obdata_isGun() && !it->haveclip();
}


/* Inserts into an array the values of whether a target is shootable from
 * each (x, y, 0) position.
 * 
 * General.
 */
void Computer::shot_matrix_for(int hit_matrix[][60], Location target)
{
    Location attempt;
    //logfile << "Shot matrix for: " << target.to_s() << endl;
    for (int x = 0; x < map->width * 10; x++) {
        for (int y = 0; y < map->height * 10; y++) {
            attempt.set(x, y, 0);
            int result = can_shoot_target(attempt, target);
            hit_matrix[x][y] = result; 
            //logfile << result << " ";
        }
        //logfile << endl;
    }
}


/* Calculates the locations that the known enemies can see. Only calculates
 * for ground level.
 * 
 * General.
 */
void Computer::calculate_known_enemy_visibility(int visibility_matrix[][60])
{
    for (int x = 0; x < map->width * 10; x++) {
        for (int y = 0; y < map->height * 10; y++) {
            logfile << platoon_remote->is_visible(0, x, y); // x & y right?
            visibility_matrix[x][y] = platoon_remote->is_visible(0, x, y);
        }
        logfile << endl;
    }
}
