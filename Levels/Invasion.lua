Invasion_Level = Level.new("Invasion")
Invasion_Level.Tiles = TileTable.new((700/TileSize),(500/TileSize))
Invasion_Level.Objects = ObjectTable.new()
Invasion_Level.Path = PathTable.new()

for i = 1,(500/TileSize) do
	for j = 1,(700/TileSize) do
		Invasion_Level.Tiles(false,14)
	end
end

-- Cue the Level Design
for i = 1,(500/TileSize) do
	Invasion_Level.Tiles:Set(1,i,true,1)
	Invasion_Level.Tiles:Set(2,i,true,1)
	Invasion_Level.Tiles:Set(3,i,true,1)
	Invasion_Level.Tiles:Set(4,i,true,3)
end

for j = 5,(700/TileSize) do
	Invasion_Level.Tiles:Set(j,17,true,5)
	Invasion_Level.Tiles:Set(j,18,true,1)
	Invasion_Level.Tiles:Set(j,19,true,4)
end

Invasion_Level.Tiles:Set(4,17,true,9)
Invasion_Level.Tiles:Set(4,18,true,1)
Invasion_Level.Tiles:Set(4,19,true,7)

Invasion_Level.Tiles:Set(27,19,true,1)
Invasion_Level.Tiles:Set(27,20,true,1)
Invasion_Level.Tiles:Set(27,21,true,1)
Invasion_Level.Tiles:Set(27,22,true,1)
Invasion_Level.Tiles:Set(27,23,true,1)
Invasion_Level.Tiles:Set(27,24,true,1)
Invasion_Level.Tiles:Set(27,25,true,1)

Invasion_Level.Tiles:Set(26,19,true,6)
Invasion_Level.Tiles:Set(28,19,true,7)

Invasion_Level.Tiles:Set(26,20,true,2)
Invasion_Level.Tiles:Set(26,21,true,2)
Invasion_Level.Tiles:Set(26,22,true,2)
Invasion_Level.Tiles:Set(26,23,true,2)
Invasion_Level.Tiles:Set(26,24,true,2)
Invasion_Level.Tiles:Set(26,25,true,2)

Invasion_Level.Tiles:Set(28,20,true,3)
Invasion_Level.Tiles:Set(28,21,true,3)
Invasion_Level.Tiles:Set(28,22,true,3)
Invasion_Level.Tiles:Set(28,23,true,3)
Invasion_Level.Tiles:Set(28,24,true,3)
Invasion_Level.Tiles:Set(28,25,true,3)

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
					files.assets.Textures.getImage(
						LevelTiles[Invasion_Level.Tiles:Get(x,y).obj] or "tile_20" 
					)
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
			love.graphics.rectangle("fill",25,25,200,250)
			love.graphics.print({{0,0,0},"Tile: "..
				(LevelScreen.vars.sx)..", "..
				(LevelScreen.vars.sy)
			},35,35)
		end
	end)
end

function Invasion_Level:Update(dt)
	local x, y = love.mouse.getPosition()
	
	if not LevelScreen.vars.selected then
		LevelScreen.vars.sx = math.min(math.max(1,math.floor((700/TileSize)*(x/700)) - 1),(700/TileSize))
		LevelScreen.vars.sy = math.min(math.max(1,math.floor((500/TileSize)*(y/500)) - 1),(500/TileSize))
	end
	
	LevelScreen.vars.lx, LevelScreen.vars.ly = x, y
	
	if love.mouse.isDown(1) then
		local tile = Invasion_Level.Tiles:Get(LevelScreen.vars.sx, LevelScreen.vars.sy)
		if tile and not tile.path then
			-- play a sound (Tile selected)
			LevelScreen.vars.selected = true
		else
			-- play a sound (No tile)
		end
	end
	
	if love.mouse.isDown(2) then
		-- play a sound (Tile deselected)
		LevelScreen.vars.selected = false
	end
end

function Invasion_Level:Keypressed(key)
	if LevelScreen.vars.selected then
		-- Tile options
		if iskeyBack(key) then
			-- play a sound (Tile deselected)
			LevelScreen.vars.selected = false
		end
	end
end

Game.Levels[2] = Invasion_Level