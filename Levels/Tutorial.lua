Tutorial_Level = Level.new("Tutorial")

function Tutorial_Level:Load()
	
end

function Tutorial_Level:Draw()
	LevelScreen.Window.back:put(function()
		
	end)
	
	LevelScreen.Window.mid:put(function()
		
	end)
	
	LevelScreen.Window.fore:put(function()
		
	end)
end

function Tutorial_Level:Update(dt)
	
end

function Tutorial_Level:Keypressed(key)
	
end

Game.Levels[1] = Tutorial_Level