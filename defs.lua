-- Definitions
Game = {}
Game.State = State.new(0)
Game.Muted = false
Game.Volume = 0.5
Game.FirstTime = true

LoadScreen = State.new(1)
HomeScreen = State.new(2)
LevelScreen = State.new(3)
MenuScreen = State.new(4)
ShopScreen = State.new(5)
SaveScreen = State.new(6)

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