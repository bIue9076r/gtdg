-- Definitions
Game = {}
Game.State = State.new(0)
Game.Muted = false
Game.FirstTime = true

LoadScreen = State.new(1)
HomeScreen = State.new(2)
LevelScreen = State.new(3)
MenuScreen = State.new(4)
ShopScreen = State.new(5)