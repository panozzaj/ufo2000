/*
This file is part of UFO2000 (http://ufo2000.sourceforge.net)

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
#ifndef WIND_H
#define WIND_H

#include "global.h"
#include "video.h"
#include "colors.h"

/**
 * Base class for objects that are displayed on screen
 * with dirty rectangles support
 *
 * @ingroup gui
 */
class VisualObject
{
	int m_switch_in_counter;
protected:
	int m_width, m_height;
public:
	VisualObject() : m_switch_in_counter(-1), m_width(0), m_height(0) { }
	virtual ~VisualObject()	{ }

//!	Draws complete object image
	virtual void redraw_full(BITMAP *bmp, int x, int y) = 0;
//!	Draws only changes since last draw (default implementation just calls draw_full)
	virtual void redraw_fast(BITMAP *bmp, int x, int y) { }
//!	Gets the width of object
	virtual int get_width() const { return m_width; }
//!	Gets the height of object
	virtual int get_height() const { return m_height; }
//!	Changes object size if possible, returns true if anything has changed
	virtual bool resize(int width, int height) { return false; }

//!	Sets internal variable so that the next redraw will be full redraw
	void set_full_redraw() { m_switch_in_counter = -1; }
//!	Function that determines whether full redraw is needed and calls proper function
	void redraw(BITMAP *bmp, int x, int y)
	{
		if (m_switch_in_counter != g_switch_in_counter) {
			m_switch_in_counter = g_switch_in_counter;
			redraw_full(bmp, x, y);
		} else {
			redraw_fast(bmp, x, y);
		}
	}
};

/**
 * Visual object for console status line - bottom line in which the new
 * text is entered. Contains code for keyboard input and displaying.
 *
 * @ingroup gui
 */
class ConsoleStatusLine : public VisualObject
{
	std::string m_text;
	FONT *m_font;
	int m_color;
	bool m_hide_when_empty;

	bool backspace();

public:
	ConsoleStatusLine(int width, FONT *font = g_console_font, int color = COLOR_WHITE);
	virtual ~ConsoleStatusLine();

	virtual void redraw_full(BITMAP *bmp, int x, int y);
	virtual bool resize(int width, int height);
	virtual int get_height() const
	{
	    return m_hide_when_empty && m_text.empty() ? 0 : m_height;
	}

	void hide_when_empty() { m_hide_when_empty = true; }
	void show_when_empty() { m_hide_when_empty = false; }
	bool process_keyboard_input(int keycode, int scancode);

	const std::string &get_text() const { return m_text; }
	void set_text(const std::string & text) { m_text = text; }
};

/**
 * Visual object for rectangular area with chat console. 
 * It provides log window for previous text messages and 
 * also incorporates status line for editing new text.
 *
 * @ingroup gui
 */
class ConsoleWindow : public VisualObject
{
	std::vector<std::string>  m_lines_text;
	std::vector<int>          m_lines_color;
	ConsoleStatusLine        *m_status_line;
	FONT                     *m_font;
	BITMAP                   *m_background_bmp;
	bool                      m_need_redraw;
public:
	ConsoleWindow(int width, int height, BITMAP *bg = NULL,
                  FONT *font = g_console_font);
	virtual ~ConsoleWindow();

	virtual void redraw_full(BITMAP *bmp, int x, int y);
	virtual void redraw_fast(BITMAP *bmp, int x, int y);

	void print(const char *text, int color = COLOR_GREEN00);
/*
gcc undocumented feature: 'this' pointer is counted in the
__attribute__ __format__ for non-static member functions.
*/
	void vprintf(int color, const char *fmt, va_list arglist)
#if defined(__GNUC__)
        __attribute__((__format__(__printf__,3,0)))
#endif
    ;
	void printf(int color, const char *fmt, ...)
#if defined(__GNUC__)
        __attribute__((__format__(__printf__,3,4)))
#endif
    ;
	void printf(const char *fmt, ...)
#if defined(__GNUC__)
        __attribute__((__format__(__printf__,2,3)))
#endif
    ;

	void hide_empty_status_line() { m_status_line->hide_when_empty(); }
	void show_empty_status_line() { m_status_line->show_when_empty(); }
	bool process_keyboard_input(int keycode, int scancode);

	const char *get_text();
	virtual bool resize(int width, int height);
};

#endif
