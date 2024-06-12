Retreat_Level = Level.new("Retreat")

function Retreat_Level:Load()
	
end

function Retreat_Level:Draw()
	LevelScreen.Window.back:put(function()
		
	end)
	
	LevelScreen.Window.mid:put(function()
		
	end)
	
	LevelScreen.Window.fore:put(function()
		
	end)
end

function Retreat_Level:Update(dt)
	
end

function Retreat_Level:Keypressed(key)
	
end

Game.Levels[4] = Retreat_Level