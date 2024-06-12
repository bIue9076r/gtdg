Invasion_Level = Level.new("Invasion")

function Invasion_Level:Load()
	
end

function Invasion_Level:Draw()
	LevelScreen.Window.back:put(function()
		
	end)
	
	LevelScreen.Window.mid:put(function()
		
	end)
	
	LevelScreen.Window.fore:put(function()
		
	end)
end

function Invasion_Level:Update(dt)
	
end

function Invasion_Level:Keypressed(key)
	
end

Game.Levels[2] = Invasion_Level