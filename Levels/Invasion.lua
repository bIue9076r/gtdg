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

Invasion_Level.Tiles:Set(3,19,true,4)
Invasion_Level.Tiles:Set(2,19,true,4)
Invasion_Level.Tiles:Set(1,19,true,4)

Invasion_Level.Tiles:Set(2,18,true,1)
Invasion_Level.Tiles:Set(4,19,true,4)

Invasion_Level.Tiles:Set(1,20,false,14)
Invasion_Level.Tiles:Set(1,21,false,14)
Invasion_Level.Tiles:Set(1,22,false,14)
Invasion_Level.Tiles:Set(1,23,false,14)
Invasion_Level.Tiles:Set(1,24,false,14)
Invasion_Level.Tiles:Set(1,25,false,14)

Invasion_Level.Tiles:Set(2,20,false,14)
Invasion_Level.Tiles:Set(2,21,false,14)
Invasion_Level.Tiles:Set(2,22,false,14)
Invasion_Level.Tiles:Set(2,23,false,14)
Invasion_Level.Tiles:Set(2,24,false,14)
Invasion_Level.Tiles:Set(2,25,false,14)

Invasion_Level.Tiles:Set(3,20,false,14)
Invasion_Level.Tiles:Set(3,21,false,14)
Invasion_Level.Tiles:Set(3,22,false,14)
Invasion_Level.Tiles:Set(3,23,false,14)
Invasion_Level.Tiles:Set(3,24,false,14)
Invasion_Level.Tiles:Set(3,25,false,14)

Invasion_Level.Tiles:Set(4,20,false,14)
Invasion_Level.Tiles:Set(4,21,false,14)
Invasion_Level.Tiles:Set(4,22,false,14)
Invasion_Level.Tiles:Set(4,23,false,14)
Invasion_Level.Tiles:Set(4,24,false,14)
Invasion_Level.Tiles:Set(4,25,false,14)

Invasion_Level.Path:Insert(2.5,2.5,0,18.5,1000)
Invasion_Level.Path:Insert(2.5,36,18.5,18.5,1000)

Invasion_Level.Objects:Insert(0,0,10,"none")

-- ^ ^ ^ Clean this up later ^ ^ ^ ---

function Invasion_Level:Load()
	LevelScreen.vars.sx = 0
	LevelScreen.vars.sy = 0
	LevelScreen.vars.lx = 0
	LevelScreen.vars.ly = 0
	
	LevelScreen.vars.selected = false
	LevelScreen.vars.building = false
	LevelScreen.vars.moving = false
	LevelScreen.vars.destroying = false
end

function Invasion_Level:Draw()
	LevelScreen.Window.back:put(function()
		love.graphics.rectangle("fill",650,10,135,30)
		love.graphics.print({{0,0.8,0},"Cash: $"..(Player.Money)},660,20)
		
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
			
			love.graphics.print({{0,0,0},"Type: "..(
				LevelTiles[(Invasion_Level.Tiles:Get(
					LevelScreen.vars.sx,LevelScreen.vars.sy
				).obj)]:sub(1,-4)
			)},35,55)
			
			love.graphics.print({{0,0,0},"Path: "..(
				tostring(Invasion_Level.Tiles:Get(
					LevelScreen.vars.sx,LevelScreen.vars.sy
				).path)
			)},35,75)
			
			love.graphics.print({{0,0,0},"Options: "},35,115)
			love.graphics.print({{0,0,0},"Build - [a]"},35,155)
			love.graphics.print({{0,0,0},"Move - [s]"},35,175)
			love.graphics.print({{0,0,0},"Destroy - [d]"},35,195)
			love.graphics.print({{0,0,0},"Deselect - [b]"},35,215)
		end
		if LevelScreen.vars.building then
			-- show building options
			love.graphics.rectangle("fill",250,25,200,250)
			love.graphics.print({{0,0,0},"Slot #1"},260,55)
			love.graphics.print({{0,0,0},"Slot #2"},260,75)
			love.graphics.print({{0,0,0},"Slot #3"},260,95)
			love.graphics.print({{0,0,0},"Slot #4"},260,115)
			love.graphics.print({{0,0,0},"Slot #5"},260,135)
			love.graphics.print({{0,0,0},"Slot #6"},260,155)
			love.graphics.print({{0,0,0},"Slot #7"},260,175)
			love.graphics.print({{0,0,0},"Slot #8"},260,195)
			love.graphics.print({{0,0,0},"Slot #9"},260,215)
			love.graphics.print({{0,0,0},"Slot #10"},260,235)
		end
	end)
	
	LevelScreen.Window.fore:put(function()
		if Game.ShowPath then
			for i,v in pairs(Invasion_Level.Path.tbl) do
				love.graphics.setColor(1,1,0)
				love.graphics.line(
					(v.x1 + 1.5)*TileSize,(v.y1 + 1.5)*TileSize,
					(v.x2 + 1.5)*TileSize,(v.y2 + 1.5)*TileSize
				)
				love.graphics.setColor(1,1,1)
			end
		end
		
		if Game.ShowHitBoxes then
			for i,v in pairs(Invasion_Level.Objects.tbl) do
				love.graphics.setColor(1,0,1)
				love.graphics.rectangle("line",
					(v.x + 1)*TileSize,
					(v.y + 1)*TileSize,
					20,
					20
				)
				love.graphics.setColor(1,1,1)
			end
		end
	end)
	
	LevelScreen.Window.fore:put(function()
		for i,v in pairs(Invasion_Level.Objects.tbl) do
			love.graphics.rectangle("fill",
				(v.x + 1)*TileSize,
				(v.y + 1)*TileSize,
				20,
				20
			)
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
			Game.Paused = true
		else
			-- play a sound (No tile)
		end
	end
	
	if love.mouse.isDown(2) then
		-- play a sound (Tile deselected)
		LevelScreen.vars.selected = false
		Game.Paused = false
	end
	
	if not Game.Paused then
		Invasion_Level.Objects:Lerp(Invasion_Level.Path)
	end
end

function Invasion_Level:Keypressed(key)
	if LevelScreen.vars.selected then
		-- Tile options
		if key == "a" then
			print("build")
			LevelScreen.vars.building = true
		elseif key == "s" then
			print("move")
			LevelScreen.vars.moving = true
		elseif key == "d" then
			print("destroy")
			LevelScreen.vars.destroying = true
		elseif iskeyBack(key) then
			-- play a sound (Tile deselected)
			LevelScreen.vars.selected = false
			Game.Paused = false
		end
	end
end

Game.Levels[2] = Invasion_Level
