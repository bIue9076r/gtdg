-- Definitions
Game = {}
Game.State = {}
Game.Levels = {}
Game.Muted = false
Game.Volume = 0.5
Game.FirstTime = true
Game.Tutorial = false
Game.Debug = true
Game.Version = "0.1.16"

Game.ShowPath = false
Game.ShowHitBoxes = false
Game.Paused = false
Game.Over = false
Game.Victory = false

TileSize = 20
Tile_Y = (500/TileSize)
Tile_X = (700/TileSize)

LoadScreen = State.new(1)
HomeScreen = State.new(2)
LevelScreen = State.new(3)
MenuScreen = State.new(4)
ShopScreen = State.new(5)
SaveScreen = State.new(6)

States = {
	[0] = State.new(0),
	[LoadScreen.Id] = LoadScreen,
	[HomeScreen.Id] = HomeScreen,
	[LevelScreen.Id] = LevelScreen,
	[MenuScreen.Id] = MenuScreen,
	[ShopScreen.Id] = ShopScreen,
	[SaveScreen.Id] = SaveScreen,
}

LevelTiles = {
	[0] = "tile_20",
	[1] = "water_20",
	[2] = "shore_L_20",
	[3] = "shore_R_20",
	[4] = "shore_B_20",
	[5] = "shore_T_20",
	[6] = "shore_BL_20",
	[7] = "shore_BR_20",
	[8] = "shore_TL_20",
	[9] = "shore_TR_20",
	[10] = "shore_CBL_20",
	[11] = "shore_CBR_20",
	[12] = "shore_CTL_20",
	[13] = "shore_CTR_20",
	[14] = "sand_20",
	[15] = "grass_L_20",
	[16] = "grass_R_20",
	[17] = "grass_B_20",
	[18] = "grass_T_20",
	[19] = "grass_BL_20",
	[20] = "grass_BR_20",
	[21] = "grass_TL_20",
	[22] = "grass_TR_20",
	[23] = "grass_CBL_20",
	[24] = "grass_CBR_20",
	[25] = "grass_CTL_20",
	[26] = "grass_CTR_20",
	[27] = "grass_20",
	[28] = "grass_tree_1_20",
	[29] = "grass_tree_2_20",
	[30] = "grass_tree_3_20",
	[31] = "grass_tree_4_20",
	[32] = "trees_1_20",
	[33] = "trees_2_20",
	[34] = "trees_3_20",
	[35] = "trees_4_20",
}

TileName = {
	["NULL_"] = 0,
	["WATER"] = 1,
	["SH__L"] = 2,
	["SH__R"] = 3,
	["SH__B"] = 4,
	["SH__T"] = 5,
	["SH_BL"] = 6,
	["SH_BR"] = 7,
	["SH_TL"] = 8,
	["SH_TR"] = 9,
	["SHCBL"] = 10,
	["SHCBR"] = 11,
	["SHCTL"] = 12,
	["SHCTR"] = 13,
	["SAND_"] = 14,
	["GR__L"] = 15,
	["GR__R"] = 16,
	["GR__B"] = 17,
	["GR__T"] = 18,
	["GR_BL"] = 19,
	["GR_BR"] = 20,
	["GR_TL"] = 21,
	["GR_TR"] = 22,
	["GRCBL"] = 23,
	["GRCBR"] = 24,
	["GRCTL"] = 25,
	["GRCTR"] = 26,
	["GRASS"] = 27,
	["GTRE1"] = 28,
	["GTRE2"] = 29,
	["GTRE3"] = 30,
	["GTRE4"] = 31,
	["TREE1"] = 32,
	["TREE2"] = 33,
	["TREE3"] = 34,
	["TREE4"] = 35,
}

LUAPRINT = print
LogFile = File.new("/Log.txt")

function Log(...)
	LogFile:Log(...)
end

function Warn(...)
	LogFile:Warn(...)
end

function Error(...)
	LogFile:Error(...)
end

print = Log

function isKeyUp(key)
	return ((key == "up") or (key == "w"))
end

function isKeyDown(key)
	return ((key == "down") or (key == "s"))
end

function isKeyLeft(key)
	return ((key == "left") or (key == "a"))
end

function isKeyRight(key)
	return ((key == "right") or (key == "d"))
end

function iskeyBack(key)
	return ((key == "b") or (key == "escape") or (key == "backspace"))
end

function secondsToTicks(s)
	return (s/love.timer.getAverageDelta())
end

function isInside(x,y)
	return (x >= 1) and (y >= 1) and (x <= Tile_X) and (y <= Tile_Y)
end

function playSFX(n)
	print(n)
	local s = files.assets.Audio.getSound(n)
	if not Game.Muted then
		s:seek(0)
		s:play()
	else
		s:pause()
	end
end

function sortTbl(tbl)
	local rtbl = {}
	local ctbl = tbl
	local lowest = nil
	local index = nil
	
	for l = 1,#tbl do
		for i,v in pairs(ctbl) do
			if not lowest then
				lowest = v
				index = i
			else
				if lowest[2] > v[2] then
					lowest = v
					index = i
				end
			end
		end
		
		table.insert(rtbl,lowest)
		ctbl[index] = nil
		lowest = nil
		index = nil
	end
	
	return rtbl
end
