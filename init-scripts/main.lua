------------------------------------------------------------------------------
-- Main file with the definitions of all the service functions used by      --
-- other scripts.                                                           --
--                                                                          --
-- DO NOT EDIT THIS FILE UNLESS YOU KNOW WHAT YOU ARE DOING!                --
------------------------------------------------------------------------------

-- global table with the information about all the available tilesets
-- used from ufo2000 executable
TilesetsTable = {}
-- global table with the information about all the available terrain types
-- used from ufo2000 executable
TerrainTable = {}
-- global table with the information about all items and weapons
-- used from ufo2000 executable
ItemsTable = {}
-- global table with all the information about all maps
-- used from ufo2000 executable and AddTerrain
MapTable = {}
-- global table with the information about all available weaponsets
EquipmentTable = {}
-- table with images for explosion animation
ExplosionAnimation = {}
-- table with minor images
ImageTable = {}
-- table with information about units
UnitsTable = {}
-- table with GUI information
GuiTable = {}

-- Workaround for a problem when running the game in valgrind.
-- Appears that get_executable_name() function can't get correct
-- path and returns something starting with 'valgrind' in this case.
-- The following line forces the game to use current directory as
-- a path to data files in this case
if string.find(ufo2000_dir, "^%S*valgrind") then ufo2000_dir, home_dir = nil, nil end

-- directories for data files from the original x-com and ufo2000
ufo2000_dir   = ufo2000_dir or "."
xcom_dir      = xcom_dir or (ufo2000_dir .. "/XCOM")
tftd_dir      = tftd_dir or (ufo2000_dir .. "/TFTD")
home_dir      = home_dir or "."

local file_prefixes = {
    ["$(xcom)"] = xcom_dir,
    ["$(tftd)"] = tftd_dir,
    ["$(ufo2000)"] = ufo2000_dir,
    ["$(home)"] = home_dir,
}
    
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

local locate_file_xcom_files_cache = {}

function LocateFile(filename)
    local cached_filename = locate_file_xcom_files_cache[filename]
    if type(cached_filename) == "string" then return cached_filename end
    local initial_filename = filename

    local function SearchMixedCaseFile(filename)
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
    
    local function CheckPrefix(filename, prefix)
        if string.sub(filename, 1, string.len(prefix)) == prefix then
            return true
        end
    end
    
    preprocessed_filename = string.gsub(filename, "^(%$%(.-%))", function(varname)
            if varname == "$(extension)" and extension_dir then return extension_dir end
            return file_prefixes[varname] or varname
        end)
        
    if cached_filename ~= nil then return preprocessed_filename end
        
    -- Check if it is a file from x-com data set, it may have inconsistent file 
    -- name case
    
    if CheckPrefix(preprocessed_filename, xcom_dir) or CheckPrefix(preprocessed_filename, tftd_dir) then
        local fname = SearchMixedCaseFile(preprocessed_filename)
        locate_file_xcom_files_cache[filename] = fname or false
        if fname then return fname end
    end

    return preprocessed_filename
end

local function UpdateTableCrc32(initcrc, tbl, exclude_list)
    local sorted_tbl = {}
    for k, v in tbl do 
        local need_exclude = false
        for _, exclude_property in exclude_list do
            if k == exclude_property then need_exclude = true end
        end
        if not need_exclude then
            table.insert(sorted_tbl, {k, v}) 
        end
    end
    table.sort(sorted_tbl, function(a, b) return a[1] < b[1] end)
    for _, v in ipairs(sorted_tbl) do
        initcrc = UpdateCrc32(initcrc, tostring(v[1]))
        initcrc = UpdateCrc32(initcrc, "=")
        if type(v[2]) == "table" then
            initcrc = UpdateTableCrc32(initcrc, v[2], exclude_list)
        elseif type(v[2]) == "string" or type(v[2]) == "number" then
            initcrc = UpdateCrc32(initcrc, tostring(v[2]))
        else
            -- userdata, function or other types are currently ignored
        end
        initcrc = UpdateCrc32(initcrc, "\n")
    end
    return initcrc
end

-- adds a GUI screen definition
function AddPanel(screen)
    if GuiTable[screen.Name] then
        Warning("AddPanel: duplicate screen GUI definition detected '%s'", screen.Name)
        return nil
    end
    GuiTable[screen.Name] = screen
    Message("AddPanel: added panel '%s'", screen.Name)
end

-- adds new tileset
function AddTileset(tileset)
    if TilesetsTable[tileset.Name] then
        Warning("AddTileset: duplicate tileset name detected '%s'", tileset.Name)
        return nil
    end

    for k, v in ipairs(tileset.Tiles) do
        local tmp = {}
        for pixeldata in string.gfind(v.MinimapImage, "%x%x") do
            table.insert(tmp, tonumber(pixeldata, 16))
        end
        v.MinimapImage = string.char(unpack(tmp))
        if string.len(v.MinimapImage) ~= 16 * 3 then
            Error("string.len(v.MinimapImage) = %d", string.len(v.MinimapImage))
        end
        local tmp = {}
        local counter = 0
        for hi, lo in string.gfind(v.Shape, "(%x%x)(%x%x)") do
            tmp[384 - counter] = tonumber(hi, 16)
            tmp[383 - counter] = tonumber(lo, 16)
            counter = counter + 2
        end
        v.Shape = string.char(unpack(tmp))
        if string.len(v.Shape) ~= 12 * 16 * 16 / 8 then
            Error("string.len(v.Shape) = %d", string.len(v.Shape))
        end
    end

    tileset.NumberOfTiles = table.getn(tileset.Tiles)
    tileset.Crc32 = UpdateTableCrc32(0, tileset, {"IsometricImage", "MinimapImage"})
    TilesetsTable[tileset.Name] = tileset
    Warning("Tileset '%s' initialized, %d tiles, crc32 = %08X", tileset.Name, tileset.NumberOfTiles, tileset.Crc32)
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

-- Adds a map to the global table of available maps
function AddLuaMap(map_data)
	if MapTable[map_data.Name] then
		Warning("AddLuaMap: Duplicate Lua map definition detected '%s'", map_data.Name)
		return nil
	end
	-- Check unique
	-- Check that data is valid
	local datavalid = true
	local strkey = ""
	local size_x = map_data.X
    local size_y = map_data.Y
    local size_z = map_data.Z
	if size_x > 60 or math.mod(size_x, 10) ~= 0 then
		Warning("AddLuaMap: Invalid map dimension (X), must divide by 10, no greater than 60 '%s'", map_data.Name)
		datavalid = false
	end
	if size_y > 60 or math.mod(size_y, 10) ~= 0 then
		Warning("AddLuaMap: Invalid map dimension (Y), must divide by 10, no greater than 60 '%s'", map_data.Name)
		datavalid = false
	end
	-- Make loop statement to check the Cell structure
	if table.getn(map_data.MapData) ~= size_z then
		Warning("AddLuaMap: Invalid mapdata - number of levels do not match '%s'", map_data.Name)
		datavalid = false
	end
	-- Check that the data is valid and make a crc Key based on MapData
	if datavalid then
		for lev = 1, size_z do
			if table.getn(map_data.MapData[lev]) ~= size_x * size_y then
				Warning("AddLuaMap: Invalid mapdata - number of cells do not match map size on level %d '%s'", lev, map_data.Name)
				datavalid = false
				break
			end
			for k = 1, size_x * size_y do
				if table.getn(map_data.MapData[lev][k]) ~= 4 then
					Warning("AddLuaMap: Invalid mapdata - bad tile on level %d position %d '%s'", lev, k, map_data.Name)
					datavalid = false
					break
				end
				strkey = string.format("%s%X", strkey, map_data.MapData[lev][k][1] + map_data.MapData[lev][k][2] + map_data.MapData[lev][k][3] + map_data.MapData[lev][k][4])
			end
		end
	end
	-- Add
	if datavalid then
		MapTable[map_data.Name] = map_data
		MapTable[map_data.Name].key = strkey
		--Message("AddLuaMap: Map '%s' successfully loaded - CrcKey '%s'", map_data.Name, strkey)
	else
		Warning("AddLuaMap: Map ignored '%s'", map_data.Name)
	end
	return nil
end

-- appends a lua map file to a terrain record
local function GetLuaMap(ti, map_name)
    local _, _, map_id = string.find(string.lower(map_name), "(%d+)$")
	if not map_id then
        return string.format("Invalid lua map name '%s'", map_name)
    end

    map_id = tonumber(map_id)
	
	if not MapTable[map_name] then
		return string.format("Lua map not found in MapTable '%s'", map_name)
	end
    ti.Crc32 = UpdateCrc32(ti.Crc32, map_id)
	ti.Crc32 = UpdateCrc32(ti.Crc32, MapTable[map_name].key)
	--Add basic map data to tileset
	ti.Maps[map_id] = MapTable[map_name]
    return nil
end

xcom_palette    = 0
tftd_palette    = 1
ufo2000_palette = 2

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
        if TilesetsTable[v] then
            -- UFO2000 style tileset
            Message("UFO2000 tileset: %s", v)
            tmp.Crc32 = UpdateCrc32(tmp.Crc32, TilesetsTable[v].Crc32)
            tmp.Tiles[k] = v;
            tmp.Palettes[k] = ufo2000_palette;
        else
            -- X-COM style tileset
            local pck_fname = LocateFile(string.gsub(v, "%.[^%.]*$", ".pck"))
            local mcd_fname = LocateFile(string.gsub(v, "%.[^%.]*$", ".mcd"))
            local tab_fname = LocateFile(string.gsub(v, "%.[^%.]*$", ".tab"))
            local loftemps_fname = LocateFile("$(xcom)/geodata/loftemps.dat")
            local mcd_data = ReadFile(mcd_fname)
            local loftemps_data = ReadFile(loftemps_fname)

            if pck_fname and mcd_data and tab_fname and loftemps_data then
                tmp.Crc32 = UpdateCrc32(tmp.Crc32, mcd_data)
                tmp.Crc32 = UpdateCrc32(tmp.Crc32, loftemps_data)
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
    end

    local number_of_maps = 0
    local errmsg = nil
    for k, v in ipairs(terrain.Maps) do
		if string.find(v, "%w") then
			if string.find(v, "%\.map") then
				errmsg = AddXcomMap(tmp, LocateFile(v))
				if errmsg then
					number_of_maps = 0
					break
				else
					--Message("AddXcomMap %s", v)
					number_of_maps = number_of_maps + 1
				end
			else
				errmsg = GetLuaMap(tmp, LocateFile(v))
				if errmsg then
					number_of_maps = 0
					break
				else
					--Message("AddLuaMap %s", v)
					number_of_maps = number_of_maps + 1
				end
			end
		else
			number_of_maps = 0
			break
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

function AddTerrain(terrain)
    AddXcomTerrain(terrain)
end

function AddImage(key, val)
    if not val then return end
    if ImageTable[key] then
        Message("AddImage: replaced image '%s'", key)
    else
        Message("AddImage: added image '%s'", key)
    end
    ImageTable[key] = val
end

local unit_index = 0

function AddUnit(val)
    local key = val.name
    if not key then 
        Message("AddUnit: invalid unit ignored")
        return
    end
    if UnitsTable[key] then
        Message("AddUnit: duplicate unit '%s' ignored", key)
        return
    end
    UnitsTable[key] = val
    UnitsTable[unit_index] = val
    unit_index = unit_index + 1
end

function SetExplosionAnimation(tbl)
    ExplosionAnimation = tbl
end

-- Loads squad information
function LoadSquad(squad_data, squad_object)
    -- sort squad_data by keys
    local tmp = {} for k, v in squad_data do table.insert(tmp, {k, v}) end
    table.sort(tmp, function (a, b) return a[1] < b[1] end)
    squad_data = {} for _, v in ipairs(tmp) do table.insert(squad_data, v[2]) end
    -- 
    for id, soldier_data in ipairs(squad_data) do
        local soldier = squad_object:findnum(id - 1)
        if not soldier then break end
        soldier:reset_stats()
        soldier:set_name(soldier_data.Name)
        soldier:set_skin_info(soldier_data.SkinType, soldier_data.fFemale, soldier_data.Appearance)
        for attribute_id, attribute_value in soldier_data.Attributes do
            soldier:set_attribute(attribute_id, attribute_value)
        end
        for place_id, place_data in soldier_data.Inventory do
            local place = soldier:find_place(place_id)
            place:destroy_all_items()
            for _, v in ipairs(place_data) do
                place:add_item(v[1], v[2], v[3], false)
                if v[4] then place:add_item(v[1], v[2], v[4], false) end
            end
        end
    end
end

-- adds new item
function AddXcomItem(item)
    item.index = UpdateCrc32(0, item.name)
    if ItemsTable[item.index] and ItemsTable[item.index].name ~= item.name then
        Error("AddXcomItem: impossible happened, crc32 collision for items '%s' and '%s'", 
            item.name, ItemsTable[item.index].name)
    end
    if ItemsTable[item.name] then Warning("Duplicate item with name '%s' - ignored", item.name) return end
    if ItemsTable[item.index] then Warning("Duplicate item with index %d - ignored", item.index) return end

    if not item.pInv then Warning("Invalid 'pInv' property for item '%s' - ignored", item.name) return end
    if not item.pMap then Warning("Invalid 'pMap' property for item '%s' - ignored", item.name) return end
    if type(item.pHeld) ~= "table" then Warning("Invalid 'pHeld' property for item '%s' - ignored", item.name) return end
    for i = 1, 8 do
        if not item.pHeld[i] then Warning("Invalid 'pHeld' property for item '%s' - ignored", item.name) return end
    end
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
    local sorted_tbl = {}
    for k, v in x.Layout do 
        local name = v[3]
        if not ItemsTable[name] then 
            Warning("Equipment set '%s' refers to invalid item '%s' - ignored", x.Name, name) 
            return 
        end
        table.insert(sorted_tbl, {name, ItemsTable[name]}) 
    end
    table.sort(sorted_tbl, function(a, b) return a[1] < b[1] end)
    x.Crc32 = 0
    for _, v in ipairs(sorted_tbl) do 
        x.Crc32 = UpdateTableCrc32(x.Crc32, v[2], 
            {"pInv", "pMap", "pHeld", "sound"}) 
    end
    EquipmentTable[x.Name] = x
    Message("AddEquipment: '%s', crc32 = %08X", x.Name, x.Crc32)
end

local CurrentEquipmentTable
local CurrentEquipmentName

-- return current equipment name
function GetCurrentEquipmentName()
    return CurrentEquipmentName
end

-- fill armoury with the specified equipment set
function SetEquipment(name)
    CurrentEquipmentTable = {}
    Armoury:destroy_all_items()
    if EquipmentTable[name] and EquipmentTable[name].enabled then
        for k, v in EquipmentTable[name].Layout do
            Armoury:add_item(v[1], v[2], v[3], true)
            if not EquipmentTable[name].isTrash then
                CurrentEquipmentTable[v[3]] = true
            end
        end
        CurrentEquipmentName = name
        return true
    end
end

-- check if the item is in current equipment set
function IsItemAllowed(item)
    return CurrentEquipmentTable[item]
end

-------------------------------------------------------------------------------
-- Search for lost items (not assigned to any weaponsets), they are collected
-- in a special new weaponset
-------------------------------------------------------------------------------

local function CreateTrashWeaponset(name)
    local armoury_width = 20
    local armoury_height = 11
    local count = 0
    local lost_items = {}
    -- all items are potential candidates to be lost
    for k in ItemsTable do
        if type(k) == "string" then lost_items[k] = 1 end
    end
    -- remove items which are assigned to weaponsets
    for name, data in EquipmentTable do
        for k, v in ipairs(data.Layout) do lost_items[v[3]] = nil end
    end
    local equipment_set = {
        Name = name,
        isTrash = true,
        Layout = {}
    }
    local grid = {}
    for i = 0, armoury_width - 1 do
        grid[i] = {}
        for j = 0, armoury_height - 1 do
            grid[i][j] = false
        end
    end
    local function search_place(width, height)
        local function try(x, y, width, height)
            for i = 0, width - 1 do
                for j = 0, height - 1 do
                    if x + i >= armoury_width or y + j >= armoury_height or grid[x + i][y + j] then 
                        return false 
                    end
                end
            end
            return true
        end
        local function fill(x, y, width, height)
            for i = 0, width - 1 do
                for j = 0, height - 1 do
                    grid[x + i][y + j] = true
                end
            end
        end
        for j = 0, armoury_height - 1 do
            for i = 0, armoury_width - 1 do
                if try(i, j, width, height) then
                    fill(i, j, width, height)
                    return i, j
                end
            end
        end
    end
    for k in lost_items do
        local it = ItemsTable[k]
        local x, y = search_place(it.width, it.height)
        if x then
            count = count + 1
            table.insert(equipment_set.Layout, {x, y, k})
        end
    end
    if count > 0 then
        AddEquipment(equipment_set)
        return count
    end
end

-------------------------------------------------------------------------------
-- Get a string with all the information about equipment sets on local       --
-- computer                                                                  --
-------------------------------------------------------------------------------

local scan_lost_flag = false

function QueryEquipmentInfo()
    -- on the first run collect information about all items not assigned to
    -- any equipment sets, if such items are found, create a special equipment
    -- sets for trash
    if not scan_lost_flag then
        local index = 1
        while CreateTrashWeaponset(string.format("Trash #%d (items do not belong to any valid weapon set)", index)) do
            index = index + 1
        end
        scan_lost_flag = true
    end

    local tmp = ""
    for name, data in EquipmentTable do
        if name == "" then name = "?" end
        tmp = tmp .. "'" .. string.gsub(name, "'", "\\'") .. "'=" .. data.Crc32 .. ";"
    end
    return tmp
end

function SyncEquipmentInfo(remote_equipment)
    -- parse information about equipment sets available on remote computer
    local tmp = {}
    for name, crc32 in string.gfind(remote_equipment, "%'(.-[^\\])%'%=(%d+)%;") do
        crc32 = tonumber(crc32)
        tmp[string.gsub(name, "\\'", "'")] = crc32
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

-- returns a table with a set of pck images
function pck_image_set(filename, start, count)
    if type(start) == "table" then
        local tbl = {}
        for i, num in ipairs(start) do
            tbl[i] = pck_image(filename, num)
            if not tbl[i] then return nil end
        end
        return tbl
    else
        local tbl = {}
        for i = 1, count do
            tbl[i] = pck_image(filename, start + i - 1)
            if not tbl[i] then return nil end
        end
        return tbl
    end
end

-- returns a table with a set of pck images
function pck_image_set_ex(a, b, c, filename, start, count)
    if type(start) == "table" then
        local tbl = {}
        for i, num in ipairs(start) do
            tbl[i] = pck_image_ex(a, b, c, filename, num)
            if not tbl[i] then return nil end
        end
        return tbl
    else
        local tbl = {}
        for i = 1, count do
            tbl[i] = pck_image_ex(a, b, c, filename, start + i - 1)
            if not tbl[i] then return nil end
        end
        return tbl
    end
end

-- returns a table with a set of png images
function png_image_set(filename, start, count)
    local tbl = {}
    for i = 1, count do
        tbl[i] = png_image(filename .. "-" .. tostring(start + i - 1) .. ".png")
    end
    return tbl
end

function png_image_fragment(filename, x, y, w, h)
    local _, _, name, ext = string.find(filename, "(.*)(%.[^%.\\/]+)$")
    if not _ then return end
    local newname = string.format("%s/x=%d,y=%d,w=%d,h=%d%s", name, x, y, w, h, ext)
    return png_image(newname)
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

Message("#\n# UFO2000 started: %s\n#", os.date("%Y-%m-%d %H:%M:%S"))

-- Perform data files integrity check 
-- before applying security restrictions
dofile(ufo2000_dir .. "/init-scripts/filecheck.lua")

-- Initialize external formats importing library
dofile(ufo2000_dir .. "/init-scripts/external-resources.lua")

-- Initialize internationalization support
dofile(ufo2000_dir .. "/init-scripts/internationalization.lua")

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

-- Preparing sandbox for ufo2000 extensions (it contains data and functions that 
-- are allowed to be used from extensions, read only access is granted and
-- extensions are not allowed to create or modify global variables)

plugins_sandbox = {
    string = string,
    table = table,
    math = math,
    random = random,

    AddTileset = AddTileset,
    AddTerrain = AddTerrain,
    
    AddPanel = AddPanel,

    AddXcomTerrain = AddXcomTerrain,

	AddLuaMap = AddLuaMap,
	
    AddXcomItem = AddXcomItem,
    pck_image = pck_image,
    pck_image_ex = pck_image_ex,
    png_image = png_image,
    png_image_ex = png_image,
    png_image_set = png_image_set,
    pck_image_set = pck_image_set,
    pck_image_set_ex = pck_image_set_ex,
    png_image_fragment = png_image_fragment,
    wav_sample = wav_sample,
    cat_sample = cat_sample,

    AddEquipment = AddEquipment,
    
    SetExplosionAnimation = SetExplosionAnimation,
    AddImage = AddImage,
    AddUnit = AddUnit,
}

plugins_sandbox = setmetatable({}, {
    __index = plugins_sandbox,
    __newindex = function(table, key, value) error("Sandbox violation: attempt to modify global variable") end
})

restricted_sandbox = {
    random = random
}

restricted_sandbox = setmetatable({}, {
    __index = restricted_sandbox,
    __newindex = function(table, key, value) error("Sandbox violation: attempt to modify global variable") end
})

--EOF.
