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

#ifndef SERVER_CONFIG_H
#define SERVER_CONFIG_H

#include <string>
#include <nl.h>

extern int g_server_reload_config_flag;

void load_config();
bool split_loginpass(const std::string &str, std::string &login, std::string &pass);
bool validate_ip(const std::string &ip);
int validate_user(const std::string &username, const std::string &password);
bool add_user(const std::string &username, const std::string &password);
void server_log(const char *fmt, ...);

#endif
