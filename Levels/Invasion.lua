Invasion_Level = Level.new("Invasion")

function Invasion_Level:Load()
	LevelScreen.vars.sx = 0
	LevelScreen.vars.sy = 0
	LevelScreen.vars.lx = 0
	LevelScreen.vars.ly = 0
	
	LevelScreen.vars.selected = false
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
		love.graphics.setColor(1,0,0)
		love.graphics.rectangle("line",
			50 + ((LevelScreen.vars.sx-1)*TileSize),50 + ((LevelScreen.vars.sy-1)*TileSize),
			TileSize,TileSize
		)
		love.graphics.setColor(1,1,1)
	end)
	
	LevelScreen.Window.fore:put(function()
		if LevelScreen.vars.selected then
			love.graphics.rectangle("fill",250,250,500,300)
		end
	end)
end

function Invasion_Level:Update(dt)
	local x, y = love.mouse.getPosition()
	
	if not LevelScreen.vars.selected then
		LevelScreen.vars.sx = math.min(math.max(1,math.floor((700/TileSize)*(x/700)) - 1),(700/TileSize))
		LevelScreen.vars.sy = math.min(math.max(1,math.floor((500/TileSize)*(y/500)) - 1),(500/TileSize))
	end
	
	print("Tile:\n\tx: "..(LevelScreen.vars.sx).."\n\ty: "..(LevelScreen.vars.sy))
	
	LevelScreen.vars.lx, LevelScreen.vars.ly = x, y
	
	if love.mouse.isDown(1) then
		LevelScreen.vars.selected = true
	end
	
	if love.mouse.isDown(2) then
		LevelScreen.vars.selected = false
	end
end

function Invasion_Level:Keypressed(key)
	if LevelScreen.vars.selected then
		-- Tile options
	end
end

Game.Levels[2] = Invasion_Level