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

#ifndef LOCATION_H
#define LOCATION_H

#include <sstream>
#include <string>

// I didn't see anything else that gives this simple functionality
class Location { 
public:
    int x, y, z;

    std::string to_s() {
        std::stringstream ss;
        ss << x << ", " << y << ", " << z;
        return ss.str();
    }

    void set(int *x, int *y, int *z) {
        this->x = (int)x;
        this->y = (int)y;
        this->z = (int)z;
    }

    void set(int x, int y, int z) {
        this->x = x;
        this->y = y;
        this->z = z;
    }
};

#endif
