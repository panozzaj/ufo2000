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

-- currently dummy stub
function pck_image(filename, index)
	return index
end

-- adds new item
function AddXcomItem(item)
	ItemsTable[item.index] = item
	ItemsTable[item.name] = item
end

-- perform data files integrity check before applying security
-- restrictions
dofile(ufo2000_dir .. "/init-scripts/filecheck.lua")

-- for security reasons we do not want lua scripts to have write
-- access to filesystem, the code below enforces this restriction
io.open = function(fname, mode)
	if mode and (string.find(mode, "r%+") or string.find(mode, "[aw]")) then
		Error("Sandbox violation: attempt to open '%s' for write", fname)
		return nil
	end
	return io_open_unrestricted(fname, mode)
end

io.popen = nil
io.input = nil
io.output = nil
