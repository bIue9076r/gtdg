Invasion_Level = Level.new("Invasion")

function Invasion_Level:Load()
	
end

function Invasion_Level:Draw()
	LevelScreen.Window.back:put(function()
		love.graphics.rectangle("line",50,50,700,500)
		
		for y = 1,(500/TileSize) do
			for x = 1,(700/TileSize) do
				love.graphics.draw(
					files.assets.Textures.getImage("tile_"..TileSize)
				,50 + ((x-1)*TileSize),50 + ((y-1)*TileSize))
			end
		end
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