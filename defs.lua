-- Definitions
Game = {}
Game.State = {}
Game.Levels = {}
Game.Muted = false
Game.Volume = 0.5
Game.FirstTime = true
Game.Version = "0.0.66"

Game.ShowPath = true
Game.ShowHitBoxes = true
Game.Paused = false
Game.Over = false
Game.Victory = false

TileSize = 20

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
}

SoundSFX = {
	[1] = "title"
}

function isKeyUp(key)
	return ((key == "up") or (key == "w"))
end

function isKeyDown(key)
	return ((key == "down") or (key == "s"))
end

function isKeyLeft(key)
	return ((key == "left") or (key == "d"))
end

function isKeyRight(key)
	return ((key == "right") or (key == "a"))
end

function iskeyBack(key)
	return ((key == "b") or (key == "escape") or (key == "backspace"))
end

function playSFX(n)
	print(n) -- TODO: Sfx
	--local s = files.assets.Audio.getSound(SoundSFX[n or 1])
	if not Game.Muted then
	--	s:seek(0)
	--	s:play()
	else
	--	s:pause()
	end
end