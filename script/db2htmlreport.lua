#!/usr/bin/env lua

if arg[1] == nil then
    print("Usage: db2htmlreport.lua [database file]")
    os.exit()
end

db = sqlite3.open(arg[1])

------------------------------------------------------------------------------
-- start making html report
------------------------------------------------------------------------------

io.write([[
<html><head><style type="text/css" media=screen><!--
table {
  border-collapse: collapse;
  empty-cells: show;
  font-family: arial;
  font-size: small;
  white-space: nowrap;
  background: #F0F0F0;
}
--></style><meta http-equiv="content-type" content="text/html; charset=UTF-8">
</head><body>]])

io.write("<br> <b>UFO2000 players rating table</b><br>")
io.write("<table border=1>")
io.write("<tr><td>pos<td>name<td>games played<td>games won<td>ELO score")

local pos = 1

for name, played, won, elo_score in db:cols([[
	select name, played, won, elo_score from 
	( 
	select name, 
	(select count(*) from ufo2000_game_players p,ufo2000_games g 
	where p.player=u.name and p.game=g.id and g.is_finished='Y') played, 
	(select count(*) from ufo2000_game_players p,ufo2000_games g 
	where p.player=u.name and p.game=g.id and g.is_finished='Y' and g.result=p.position) won, 
	elo_score 
	from ufo2000_users u 
	) 
	where won>0 
	order by elo_score desc 
	]]) 
do
    if elo_score then
        io.write("<tr><td>", pos, "<td>", name, "<td>", played ,"<td>", won, "<td>", math.floor(elo_score or 0), "\n")
        pos = pos + 1
    end
end

io.write("</table>")

local get_version_request = db:prepare([[
    SELECT sender, command FROM ufo2000_game_packets 
    WHERE game=? AND (id<10) AND command LIKE "UFO2000 REVISION OF YOUR OPPONENT: %"]])
    
local function get_client_versions(game_id)
    local tmp = {}
    for pid, version in get_version_request:bind(game_id):cols() do tmp[pid] = version end
    
    if type(tmp[1]) ~= "string" or type(tmp[2]) ~= "string" then return end
    local _, _, x = string.find(tmp[1], "(%d+)$")
    local _, _, y = string.find(tmp[2], "(%d+)$")
    
    return x, y
end

    
local get_bugreport_request = db:prepare([[
    SELECT param, value FROM ufo2000_debug_packets 
    WHERE game=? AND (param="crash" or param="assert" or param="crc error")]])

local function get_bugreport(game_id)
    local tmp = {}
    for bug_type, bug_msg in get_bugreport_request:bind(game_id):cols() do 
        tmp["<b>" .. bug_type .. "</b><pre>" .. bug_msg .. "</pre>"] = 1 
    end
    local tmp2 = {}
    for k in tmp do table.insert(tmp2, k) end
    return table.concat(tmp2, "<br>")
end

local get_game_start_time_request = db:prepare([[
    SELECT time FROM ufo2000_game_packets WHERE id=1 AND game=?]])
    
local get_game_end_time_request = db:prepare([[
    SELECT time FROM ufo2000_game_packets WHERE game=? ORDER BY id DESC LIMIT 1]])

local function convert_julian_day(julian_day)
    if not julian_day then return end
    return (julian_day - 2440587.5) * 86400.0 + 0.5
end
    
local function get_game_time(game_id)
    if not get_game_start_time_request:bind(game_id) then return end
    if not get_game_end_time_request:bind(game_id) then return end
    
    local start_time = convert_julian_day(get_game_start_time_request:first_cols())
    local end_time = convert_julian_day(get_game_end_time_request:first_cols())
    if not start_time or not end_time then return end
    local duration = end_time - start_time
    
    return start_time, duration
end
    
-- function that formats time
function timestring(x)
    local hours = math.floor(x / 3600)
    local minutes = math.floor((x - hours * 3600) / 60)
    local seconds = math.floor(x - hours * 3600 - minutes * 60)
    local result = ""
    if hours > 0 then
        result = result .. hours .. "h "
    end
    if hours > 0 or minutes > 0 then
        result = result .. minutes .. "m "
    end

    return result .. seconds .. "s"
end

io.write("<br> <b>UFO2000 recent games statistics</b><br>")
io.write("<table border=1>\n")
io.write("<tr><td>id<td>version<td>date<td>player1<td>player2<td>time<td>result<td>comment<td></tr>\n")
for id, ver, pl1, pl2, result in db:cols([[
	select id, ver, pl1, pl2, result from 
	(select id,ifnull(g.client_version, "") ver,p1.player pl1, p2.player pl2, case when g.result=1 then p1.player||" won" when g.result=2 then p2.player||" won" when g.result=3 then "draw" else "not finished" end result,ifnull(g.errors,"") errors 
	from ufo2000_games g, ufo2000_game_players p1, ufo2000_game_players p2 
	where g.id=p1.game and g.id=p2.game and p1.position=1 and p2.position=2) 
	order by id desc 
	limit 100 
	]]) 
do
    local comment = ""
    
    local v1, v2 = get_client_versions(id)
    if v1 ~= v2 then 
        comment = string.format("version check failed (%d vs %d)", v1, v2)
    else
        comment = get_bugreport(id)
    end
    
    if result == "not finished" then result = "-" end
    
    local start_time, duration = get_game_time(id)
    
    if start_time then
        io.write("<tr>",
            "<td>", id, "<td>", ver, 
            "<td>", os.date("%Y-%m-%d %H:%M:%S", start_time),
            "<td>", pl1, "<td>", pl2,  
            "<td>", timestring(duration), 
            "<td>", result, 
            "<td>", comment,
            "<td><A href=http://ufo2000.lxnt.info/db_report.php?a=", id, ",0,0,>Compare CRC</A>\n")
    end
end
io.write("</table>")

local terain_games_table = {}
local terrain_table = {}

for game, terrain in db:cols([[
    SELECT game, value FROM ufo2000_debug_packets WHERE param="terrain" ORDER BY id DESC]])
do
    if not terain_games_table[game] then 
        terrain_table[terrain] = (terrain_table[terrain] or 0) + 1
        terain_games_table[game] = 1
    end
end

-- display terrain types popularity statistics
io.write("<br>")
io.write("<b>Terrain types statistics table</b><br>")
local count = 0
local tmp = {}
for k, v in terrain_table do
    count = count + v 
    table.insert(tmp, {k, v}) 
end 
terrain_table = tmp
table.sort(terrain_table, function (a, b) return a[2] > b[2] end)
io.write("<table border=1>")
io.write("<tr><td>terrain type<td>number of times used<td>percent share\n") 
for k, v in ipairs(terrain_table) do
    io.write(string.format("<tr><td>%s<td>%d<td>%.1f%%", v[1], v[2], v[2] / count * 100))
end
io.write("</table>")

io.write(string.format("<br>report generated on %s<br>time %.2f seconds", os.date(), os.clock()))
io.write("</body></html>")

db:close()
