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
#include "global.h"
#include <stdio.h>
#include "video.h"
#include "inventory.h"
#include "map.h"
#include "multiplay.h"
#include "soldier.h"

Inventory::Inventory()
{
	BITMAP *image = create_bitmap(320, 200); clear(image);
	tac01 = new SPK("ufograph/tac01.scr");
	tac01->show(image, 0, 0);

	//b123 = create_bitmap(83, 22);
	//blit(screen2, b123, 45, 0, 0, 0, 83, 22);
	//b4 = create_bitmap(32, 25);
	//blit(screen2, b4, 224, 21, 0, 0, 32, 25);
	b5 = create_bitmap(32, 15); clear(b5);
	blit(image, b5, 288, 137, 0, 0, 32, 15);

	destroy_bitmap(image);
	sel_item = NULL;
}

Inventory::~Inventory()
{
	destroy_bitmap(b5);
	delete tac01;
}

void Inventory::draw()
{ // handle killing in MAN mode
	tac01->show(screen2, 0, 0);
	//spr_over(screen2, 237, 1, b123);
	//spr_over(screen2, 288, 32, b4);
	//spr_over(screen2, 288, 137, b5);
	draw_sprite_h_flip(screen2, b5, 255, 137);      // b6

	//sel_man->showspk();
	sel_man->draw_inventory();

	//int color = 1;

	if (sel_item != NULL) {
		sel_man->draw_deselect_times(sel_item_place);

		//textprintf(screen2, font, 129, 141, color, "%s", sel_item->data()->name);
		textprintf(screen2, small, 128, 140, 50, "%s", sel_item->data()->name);
		if (sel_item->is_grenade()) {
			if (sel_item->delay_time()) {
				//printsmall(118, 142, 40, sel_item->delay_time()-1);
				textout(screen2, small, "DELAY", 272, 64, 66);
				textout(screen2, small, "TIME:", 272, 72, 66);
				textout(screen2, small, "LEFT=", 272, 80, 66);
				textprintf(screen2, small, 299, 80, 18, "%d", sel_item->delay_time() - 1);
				//textprintf(screen2, font, 272, 80, color, "%d", sel_item->rounds);
				rect(screen2, 272, 88, 303, 135, 8);      //clip
				bigobs->showpck(sel_item->data()->pInv, 272, 88 + 8);
			}
		}

		if (sel_item->haveclip()) {
			textout(screen2, small, "AMMO:", 272, 64, 66);
			textout(screen2, small, "ROUNDS", 272, 72, 66);
			textout(screen2, small, "LEFT=", 272, 80, 66);
			textprintf(screen2, small, 299, 80, 18, "%d", sel_item->roundsremain());
			//textprintf(screen2, font, 272, 80, color, "%d", sel_item->roundsremain());
			rect(screen2, 272, 88, 303, 135, 8);      //clip
			bigobs->showpck(sel_item->clip()->data()->pInv, 272, 88 + 8);
		} else if (sel_item->data()->isAmmo) {
			textout(screen2, small, "AMMO:", 272, 64, 66);
			textout(screen2, small, "ROUNDS", 272, 72, 66);
			textout(screen2, small, "LEFT=", 272, 80, 66);
			textprintf(screen2, small, 299, 80, 18, "%d", sel_item->rounds);
			//textprintf(screen2, font, 272, 80, color, "%d", sel_item->rounds);
			rect(screen2, 272, 88, 303, 135, 8);      //clip
			bigobs->showpck(sel_item->data()->pInv, 272, 88 + 8);
		}

		if (key[KEY_LCONTROL]) {
			sel_item->od_info(mouse_x, mouse_y, 1);
		} else {
			bigobs->showpck(sel_item->data()->pInv,
			                mouse_x - sel_item->data()->width * 16 / 2,
			                mouse_y - sel_item->data()->height * 16 / 2 + 8);
			//textprintf(screen, font, 1, 150, 1, "w=%d h=%d x=%d y=%d ", obdata[sel_item->type]->width, obdata[sel_item->type]->height, sel_item->x, sel_item->y);
		}

	}
}


void Inventory::execute()
{
	if (sel_item == NULL) {
		if (mouse_inside(237, 1, 271, 22)) {  //ok
			MODE = MAP3D;
			//map->place(sel_man->z, sel_man->x, sel_man->y)->viscol=0; //!!reset vis
		} else
			if (mouse_inside(273, 1, 295, 22)) {  // <
				sel_man = sel_man->prevman();
			} else
				if (mouse_inside(297, 1, 319, 22)) {  // >
					sel_man = sel_man->nextman();
				}
	}
	if (mouse_inside(288, 32, 319, 57)) {  // clip
		if (sel_man->unload_ammo(sel_item))
			sel_item = NULL;
	} else
		if (mouse_inside(288, 137, 319, 151)) {  // -->
			map->place(sel_man->z, sel_man->x, sel_man->y)->scroll_right();
		} else
			if (mouse_inside(255, 137, 286, 151)) {  // <--
				map->place(sel_man->z, sel_man->x, sel_man->y)->scroll_left();
			} else {
				if (sel_item == NULL) {
					sel_item = sel_man->select_item(sel_item_place);
					//net_send("_select_item");
					if (sel_item != NULL)
						net->send_select_item(sel_man->NID, sel_item_place, sel_item->x, sel_item->y);
				} else {
					Item *it = sel_man->item_under_mouse(P_ARM_LEFT);
					if ((it != NULL) && sel_man->load_ammo(P_ARM_LEFT, sel_item)) {
						sel_item = NULL;
						return ;
					}

					it = sel_man->item_under_mouse(P_ARM_RIGHT);
					if ((it != NULL) && sel_man->load_ammo(P_ARM_RIGHT, sel_item)) {
						sel_item = NULL;
						return ;
					}

					int req_time;
					int pn = sel_man->deselect_item(sel_item, sel_item_place, req_time);
					if (pn != -1) {
						net->send_deselect_item(sel_man->NID, pn, sel_item->x, sel_item->y, req_time);
						sel_item = NULL;
					}
				}
			}

}


void Inventory::backput()
{
	if (sel_item != NULL) {
		sel_man->putitem(sel_item, sel_item_place, sel_item->x, sel_item->y);
		net->send_deselect_item(sel_man->NID, sel_item_place, sel_item->x, sel_item->y, 0);
		sel_item = NULL;
	}
}


void Inventory::close()
{
	if (sel_item == NULL)
		MODE = MAP3D;
	else
		backput();      //return to orig place
}
