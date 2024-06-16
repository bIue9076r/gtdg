-- Definitions
Game = {}
Game.State = {}
Game.Levels = {}
Game.Muted = false
Game.Volume = 0.5
Game.FirstTime = true

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