Return_Level = Level.new("Return")

function Return_Level:Load()
	
end

function Return_Level:Draw()
	LevelScreen.Window.back:put(function()
		
	end)
	
	LevelScreen.Window.mid:put(function()
		
	end)
	
	LevelScreen.Window.fore:put(function()
		
	end)
end

function Return_Level:Update(dt)
	
end

function Return_Level:Keypressed(key)
	
end

Game.Levels[3] = Return_Level