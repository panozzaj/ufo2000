------------------------------------------------------------------------------
-- Main file with the definitions of all the service functions used by      --
-- other scripts.                                                           --
--                                                                          --
-- DO NOT EDIT THIS FILE UNLESS YOU KNOW WHAT YOU ARE DOING!                --
------------------------------------------------------------------------------

-- global table with the information about all the available terrain types
-- used from ufo2000 executable
TerrainTable = {}
-- global table with the information about all items and weapons
-- used from ufo2000 executable
ItemsTable = {}
-- global table with the information about all available weaponsets
EquipmentTable = {}

-- Workaround for a problem when running the game in valgrind.
-- Appears that get_executable_name() function can't get correct
-- path and returns something starting with 'valgrind' in this case.
-- The following line forces the game to use current directory as
-- a path to data files in this case
if string.find(ufo2000_dir, "^valgrind") then ufo2000_dir, home_dir = nil, nil end

-- directories for data files from the original x-com and ufo2000
ufo2000_dir  = ufo2000_dir or "."
xcomdemo_dir = xcomdemo_dir or (ufo2000_dir .. "/XCOMDEMO")
xcom_dir     = xcom_dir or (ufo2000_dir .. "/XCOM")
tftddemo_dir = tftddemo_dir or (ufo2000_dir .. "/TFTDDEMO")
tftd_dir     = tftd_dir or (ufo2000_dir .. "/TFTD")
home_dir     = home_dir or "."

-- Functions for writing debug information to init-scripts.log 
local io_open_unrestricted = io.open
local fh = io_open_unrestricted(home_dir .. "/init-scripts.log", "wt") fh:close()

function Message(...)
	local msg = string.format(unpack(arg))
	local fh = io_open_unrestricted(home_dir .. "/init-scripts.log", "at")
	if fh then
		fh:write(msg, "\n")
		fh:close()
	end
end

function Error(...)
	Message(unpack(arg))
	error(string.format(unpack(arg)))
end

function Warning(...)
	Message(unpack(arg))
	print(string.format(unpack(arg)))
end

-- reads the whole file content into a string
function ReadFile(filename)
	local f = io.open(filename, "rb")
	if f == nil then return nil end
	local data = f:read("*a")
	f:close()
	return data
end

------------------------------------------------------------------------------
-- finds path to the required file performing prefixes expansion
-- and using different file name case if needed
------------------------------------------------------------------------------
function LocateFile(filename)

	local function SearchFile(filename)
		local count = 1
		while count == 1 do
			fh = io.open(filename, "rb")
			if fh then fh:close() return filename end
			filename, count = string.gsub(filename, "[a-z]+[^a-z]*$",
				function (a) 
					return string.upper(a) 
				end)
		end
		return nil
	end

	if string.find(filename, "^%$%(xcom%)") then
		local fname = SearchFile(string.gsub(filename, "^%$%(xcom%)", xcomdemo_dir))
		if fname then return fname end
		local fname = SearchFile(string.gsub(filename, "^%$%(xcom%)", xcom_dir))
		if fname then return fname end
		return string.gsub(filename, "^%$%(xcom%)", xcomdemo_dir)
	end

	if string.find(filename, "^%$%(tftd%)") then
		local fname = SearchFile(string.gsub(filename, "^%$%(tftd%)", tftddemo_dir))
		if fname then return fname end
		local fname = SearchFile(string.gsub(filename, "^%$%(tftd%)", tftd_dir))
		if fname then return fname end
		return string.gsub(filename, "^%$%(tftd%)", tftddemo_dir)
	end

	filename = string.gsub(filename, "^%$%(ufo2000%)", ufo2000_dir)
	filename = string.gsub(filename, "^%$%(home%)", home_dir)

	local fname = SearchFile(filename)
	if fname then return fname end

	return filename
end

-- adds a new map file to a terrain record
local function AddXcomMap(ti, map_filename)
	local _, _, map_id = string.find(string.lower(map_filename), "(%d+)%.map$")
	if not map_id then
		return string.format("invalid map file name '%s'", map_filename)
	end

	map_id = tonumber(map_id)

	local map_data = ReadFile(map_filename)
	if map_data == nil then
		return string.format("can't open '%s'", map_filename)
	end
	local size_x = string.byte(map_data, 1)
	local size_y = string.byte(map_data, 2)
	local size_z = string.byte(map_data, 3)
	if 3 + size_x * size_y * size_z * 4 ~= string.len(map_data) then
		return string.format("invalid data format in '%s'", map_filename)
	end
	ti.Crc32 = UpdateCrc32(ti.Crc32, map_id)
	ti.Crc32 = UpdateCrc32(ti.Crc32, map_data)
	ti.Maps[map_id] = map_filename

	return nil
end

tftd_palette = 1
xcom_palette = 0

-- adds new terrain
function AddXcomTerrain(terrain)
	if TerrainTable[terrain.Name] then
		Warning("AddXcomTerrain: duplicate terrain name detected '%s'", terrain.Name)
		return nil
	end

	if terrain.Index then
		Warning("AddXcomTerrain: deprecated 'Index' field detected in terrain '%s'", terrain.Name)
	end

	local tmp    = {}
	tmp.Name     = terrain.Name
	tmp.MapGenerator = terrain.MapGenerator
	tmp.Tiles    = {}
	tmp.Palettes = {}
	tmp.Maps     = {}
	tmp.Crc32    = UpdateCrc32(0, tmp.Name)

	for k, v in ipairs(terrain.Tiles) do
		local pck_fname = LocateFile(string.gsub(v, "%.[^%.]*$", ".pck"))
		local mcd_fname = LocateFile(string.gsub(v, "%.[^%.]*$", ".mcd"))
		local tab_fname = LocateFile(string.gsub(v, "%.[^%.]*$", ".tab"))
		local pck_data = ReadFile(pck_fname)
		local mcd_data = ReadFile(mcd_fname)
		local tab_data = ReadFile(tab_fname)

		if pck_data and mcd_data and tab_data then
			tmp.Crc32 = UpdateCrc32(tmp.Crc32, pck_data)
			tmp.Crc32 = UpdateCrc32(tmp.Crc32, mcd_data)
			tmp.Crc32 = UpdateCrc32(tmp.Crc32, tab_data)
			tmp.Tiles[k] = pck_fname;
			if string.find(v, "^%$%(tftd%)") then
				tmp.Palettes[k] = tftd_palette
			else
				tmp.Palettes[k] = xcom_palette
			end
		else
			Message("AddXcomTerrain: '%s' terrain - FAILED (can't locate '%s', '%s' or '%s')",
				terrain.Name, pck_fname, mcd_fname, tab_fname) 
			return nil
		end
	end

	local number_of_maps = 0
	local errmsg = nil
	for k, v in ipairs(terrain.Maps) do
		errmsg = AddXcomMap(tmp, LocateFile(v))
		if errmsg then
			number_of_maps = 0
			break
		else
			number_of_maps = number_of_maps + 1
		end
	end

	if number_of_maps > 0 then
		TerrainTable[tmp.Name] = tmp
		Message("AddXcomTerrain: '%s' terrain - OK, %d maps, crc32 = %08X",
			tmp.Name, number_of_maps, tmp.Crc32) 
	else
		Message("AddXcomTerrain: '%s' terrain - FAILED (%s)", tmp.Name, errmsg) 
	end

	return 1
end

-- adds new item
function AddXcomItem(item)
	ItemsTable[item.index] = item
	ItemsTable[item.name] = item
end

------------------------------------------------------------------------------
-- adds new equipment set
-- unique crc32 value is calculated for each equipment set, so we can 
-- compare equipment sets crc32 values of players to check if they have 
-- compatible equipment sets
------------------------------------------------------------------------------
function AddEquipment(x)
	local function UpdateTableCrc32(initcrc, tbl)
		local sorted_tbl = {}
		for k, v in tbl do table.insert(sorted_tbl, {k, v}) end
		table.sort(sorted_tbl, function(a, b) return a[1] < b[1] end)
		for _, v in ipairs(sorted_tbl) do
			initcrc = UpdateCrc32(initcrc, tostring(v[1]))
			initcrc = UpdateCrc32(initcrc, "=")
			if type(v[2]) == "table" then
				initcrc = UpdateTableCrc32(initcrc, v[2])
			elseif type(v[2]) == "string" or type(v[2]) == "number" then
				initcrc = UpdateCrc32(initcrc, tostring(v[2]))
			else
				-- userdata, function or other types are currently ignored
			end
			initcrc = UpdateCrc32(initcrc, "\n")
		end
		return initcrc
	end

	local sorted_tbl = {}
	for k, v in x.Layout do table.insert(sorted_tbl, {v[3], ItemsTable[v[3]]}) end
	table.sort(sorted_tbl, function(a, b) return a[1] < b[1] end)
	x.Crc32 = 0
	for _, v in ipairs(sorted_tbl) do x.Crc32 = UpdateTableCrc32(x.Crc32, v[2]) end
	EquipmentTable[x.Name] = x
	Message("AddEquipment: '%s', crc32 = %08X", x.Name, x.Crc32)
end

local CurrentEquipmentTable
local CurrentEquipmentName

-- fill armoury with the specified equipment set
function SetEquipment(name)
	CurrentEquipmentTable = {}
	Armoury:destroy_all_items()
	if EquipmentTable[name] and EquipmentTable[name].enabled then
		for k, v in EquipmentTable[name].Layout do
			Armoury:add_item(v[1], v[2], v[3])
			CurrentEquipmentTable[v[3]] = true
		end
		CurrentEquipmentName = name
	end
end

-- check if the item is in current equipment set
function IsItemAllowed(item)
	return CurrentEquipmentTable[item]
end

-------------------------------------------------------------------------------
-- Get a string with all the information about equipment sets on local       --
-- computer                                                                  --
-------------------------------------------------------------------------------

function QueryEquipmentInfo()
	local tmp = ""
	for name, data in EquipmentTable do
		tmp = tmp .. "'" .. name .. "'=" .. data.Crc32 .. ";"
	end
	return tmp
end

function SyncEquipmentInfo(remote_equipment)
	-- parse information about equipment sets available on remote computer
	local tmp = {}
	for name, crc32 in string.gfind(remote_equipment, "%'(.-)%'%=(%d+)%;") do 
		crc32 = tonumber(crc32)
		tmp[name] = crc32
	end
	-- walk through local equipment table and mark equipment sets that are allowed
	for name, v in EquipmentTable do
		if tmp[name] == v.Crc32 then
			v.enabled = true
		else
			v.enabled = false
		end
	end
	-- reset armoury (to ensure that we use a valid equipment set)
	SetEquipment(CurrentEquipmentName or "")
end

-- return random element from a table 
function random(a)
	if type(a) ~= "table" or table.getn(a) < 1 then 
		Error("Invalid argument to random() function") 
	end
	return a[math.random(1, table.getn(a))]
end

------------------------------------------------------------------------------
-- Read data for quick-setup of soldiers, to be used for the configuration 
-- of the keys F5..F8 in the Mission-planner/Equipment-screen.
-- See also: standard-soldiersetup.lua
------------------------------------------------------------------------------
-- global table with the information for quick-setup:
SoldierSetupTable = {}

function AddSoldierSetup(x)
    SoldierSetupTable[x.Desc] = x
    Message("AddSoldierSetup: '%s'", x.Desc )
end

-- global map generator function
function MapGenerator(name, size_x, size_y)
	-- check if this particular map has custom map generator function
	if not (TerrainTable[name] and TerrainTable[name].MapGenerator) then 
		return nil 
	end
	-- map template initialization function
	local function CreateMapTemplate(size_x, size_y)
		local tmp = {
			Name = name, 
			SizeX = size_x, SizeY = size_y, 
			Mapdata = {}
		}
		for i = 1, size_y do
			tmp.Mapdata[i] = {}
			for j = 1, size_x do
				tmp.Mapdata[i][j] = -1
			end
		end
		return tmp
	end
	-- pass map template to appropriate map generator function
	return TerrainTable[name].MapGenerator(CreateMapTemplate(size_x, size_y))
end

------------------------------------------------------------------------------
-- Loads translated messages from po-file into a table 
-- of the form "English message" -> "Translated message"
------------------------------------------------------------------------------

-- global table which stores messages translated to current language
TranslatedMessages = {}

-- Each translation in the po-file consists of two entries on separate lines,
-- msgid with the original text, and msgstr with the translated text.  E.g.:
--   msgid "CANCEL"
--   msgstr "ABBRUCH"
local function load_translated_messages(tbl, filename)
	local mode
	local key
	local str

	-- process a single translation message: key -> str
	local function add_translation_string(key, str)
		if mode == "msgstr" and key ~= "" and str ~= "" then 
			-- validate c-string format for translation and original message
			-- (primitive and not quite correct for all cases, but should catch 
			-- some errors)
			local function get_c_string_format_digest(msg)
				local result = ""
				for x in string.gfind(msg, "%%[%.%-%d]*[l]?([suidxfc])") do 
					result = result .. x
				end
				return result
			end

			if get_c_string_format_digest(key) ~= get_c_string_format_digest(str) then
				Error("Invalid translation for '%s' in the language file", key)
			end

			key = string.gsub(key, "\\n", "\n")
			str = string.gsub(str, "\\n", "\n")
			key = string.gsub(key, "\\\"", "\"")
			str = string.gsub(str, "\\\"", "\"")

			tbl[key] = str 
		end
	end

	for l in io.lines(filename) do
		if string.find(l, "^%s*msgid") then
			assert(mode == nil or mode == "msgstr")
			add_translation_string(key, str)
			mode = "msgid"
			str = ""
		elseif string.find(l, "^%s*msgstr") then
			assert(mode == "msgid")
			mode = "msgstr"
			key = str
			str = ""
		end
	
		local _, _, string_data = string.find(l, "^[^#\"]*\"(.*)\"")
		if string_data then str = str .. string_data end
	end

	add_translation_string(key, str)

	return tbl
end

------------------------------------------------------------------------------
-- Loads textfile with tips (one per line) into a table.
-- The text for the tips is taken directly from the wiki-page at 
-- http://ufo2000.lxnt.info/pmwiki/index.php/Main/TipOfTheDay,
-- formatted as an unnumbered list, e.g.: "* Text of Tip"
------------------------------------------------------------------------------

-- global table for tips:
TipsOfTheDay = {}

local function load_tips(tbl, filename)
    local str
    local n = 0

    for l in io.lines(filename) do
        if string.find(l, "^%*") then  -- ignore lines without "*"
            n = n + 1
            local _, _, str = string.find(l, "^[%*%s]+(.*)")
            tbl[n] = str 
          --Message("Tip %3d: '%s'", n, str)
        end
    end
    tbl[0] = n 

    return tbl
end

------------------------------------------------------------------------------
-- Test if file exists and can be read:
------------------------------------------------------------------------------
function FileExists(filename)
    local fh = io.open(filename, "rb")
    if fh then
        fh:close() return true 
    end
    Message("!! File not found: %s", filename)
    return nil 
end

------------------------------------------------------------------------------
-- Try to set language-file for game messages and tips-of-the-day:
------------------------------------------------------------------------------
function SetLanguage(lng)
    local fn = ufo2000_dir .. "/translations/ufo2000-" .. lng .. ".po";
    if lng and lng ~= "en" and string.find(lng, "^[a-z][a-z]$") and FileExists(fn) then
        load_translated_messages(TranslatedMessages, fn)
        Message("Language set to: %s", lng)
    end

    fn = ufo2000_dir .. "/translations/tips-" .. lng .. ".txt";
    if FileExists(fn) then
        load_tips(TipsOfTheDay, fn)
    else
        TipsOfTheDay[1] = "Visit http://ufo2000.sourceforge.net !"
        TipsOfTheDay[2] = "Have Fun !"
        TipsOfTheDay[0] = 2
    end
    Message("Tips-of-the-day: %s %d", lng, TipsOfTheDay[0] )
end

Message("#\n# UFO2000 started: %s\n#", os.date("%Y-%m-%d %H:%M:%S"))

-- Perform data files integrity check 
-- before applying security restrictions
dofile(ufo2000_dir .. "/init-scripts/filecheck.lua")

-- For security reasons, we do not want lua scripts to have write access 
-- to the filesystem. The code below enforces this restriction:
io.open = function(fname, mode)
	if mode and (string.find(mode, "r%+") or string.find(mode, "[aw]")) then
		Error("Sandbox violation: attempt to open '%s' for write", fname)
		return nil
	end
	return io_open_unrestricted(fname, mode)
end

io.popen  = nil
io.input  = nil
io.output = nil

--EOF.
