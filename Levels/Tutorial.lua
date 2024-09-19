Tutorial_Level = Level.new("Tutorial")

function Tutorial_Level:Load()
	Tutorial_Level.Tiles = TileTable.new(Tile_X,Tile_Y)
	Tutorial_Level.Objects = ObjectTable.new()
	Tutorial_Level.Path = PathTable.new()
end

function Tutorial_Level:Draw()
	LevelScreen.Window.back:put(function()
		love.graphics.rectangle("fill",380,10,135,30)
		love.graphics.print({{0,0.8,0},"Cash: $"..(Player.Money)},390,20)
		love.graphics.rectangle("fill",515,10,185,30)
		love.graphics.print({{0,0,0},"Damage: "..math.floor(Tutorial_Level.Damage).."/"..(Tutorial_Level.MaxDamage)},525,20)
		
		love.graphics.rectangle("line",50,50,700,500)
		
		for y = 1,Tile_Y do
			for x = 1,Tile_X do
				local t = Tutorial_Level.Tiles:Get(x,y)
				love.graphics.draw(
					files.assets.Textures.getImage(
						LevelTiles[t.obj] or "tile_20" 
					)
				,50 + ((x-1)*TileSize),50 + ((y-1)*TileSize)
				)
				
				if t.tower then
					t.tower:Draw()
				end
			end
		end
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