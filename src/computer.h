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

#ifndef COMPUTER_H
#define COMPUTER_H

#include <iostream>
#include <fstream>
#include <time.h>
#include <vector>

#include "location.h"

#define MAX_UNITS 32

/**
 * A class which defines the computer player.
 */
class Computer : public persist::BaseObject
{
    DECLARE_PERSISTENCE(Computer);
private:
    bool initialized;
    bool started_turn;
    bool done_with_turn;
    bool quitting;
    std::ofstream logfile;
    std::vector <Location> enemy_locations;  
    bool enemies_visible;

    void initialize();
    void start_new_turn();
    void end_turn();
    void perform(Soldier *, int, Action, Location);
    void locate_enemies();
    Action shoot(Soldier *, Location);
    bool reload(Soldier *);
    bool known_enemy(int, int, int);
    bool known_enemy(Location);
    int can_shoot_target(Location, Location);
    Soldier * find_optimal_shooter(Location);
    Location select_target();
    bool needs_reload(Soldier *);
    void shot_matrix_for(int [][60], Location);
    void calculate_known_enemy_visibility(int [][60]);
public:
    Computer();
    ~Computer();
    void evaluate();
};

#endif

