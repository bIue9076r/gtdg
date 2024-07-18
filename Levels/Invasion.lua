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

Invasion_Level.Objects:Insert(0,0,10,"Coconut")

-- ^ ^ ^ Clean this up later ^ ^ ^ ---

function Invasion_Level:Load()
	LevelScreen.vars.sx = 0
	LevelScreen.vars.sy = 0
	LevelScreen.vars.lx = 0
	LevelScreen.vars.ly = 0
	
	LevelScreen.vars.selected = false
	LevelScreen.vars.building = false
	LevelScreen.vars.poor = false
	LevelScreen.vars.poort = ticker.new()
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
				local t = Invasion_Level.Tiles:Get(x,y)
				love.graphics.draw(
					files.assets.Textures.getImage(
						LevelTiles[t.obj] or "tile_20" 
					)
				,50 + ((x-1)*TileSize),50 + ((y-1)*TileSize)
				)
				
				if t.tower then
					love.graphics.rectangle("fill",
						50 + ((t.tower.x - (1 + Towers.Offset)) * TileSize),
						50 + ((t.tower.y - (1 + Towers.Offset)) * TileSize),
						TileSize, TileSize
					)
				end
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
		if LevelScreen.vars.moving then
			love.graphics.setColor(0,1,1)
			love.graphics.rectangle("line",
				50 + ((LevelScreen.vars.mx-1)*TileSize),50 + ((LevelScreen.vars.my-1)*TileSize),
				TileSize,TileSize
			)
			love.graphics.setColor(1,1,1)
		end
		if LevelScreen.vars.building then
			-- show building options
			love.graphics.rectangle("fill",250,25,200,250)
			love.graphics.print({{0,0,0},"Towers:"},260,35)
			love.graphics.print({{0,0,0},"[1] $50: Basic"},260,75)
			love.graphics.print({{0,0,0},"[2] $200: Bomb"},260,95)
			love.graphics.print({{0,0,0},"[3] $1000: Mega"},260,115)
			
			if LevelScreen.vars.poor then
				love.graphics.rectangle("fill",250,25,200,250)
				love.graphics.print({{0,0,0},"Not enough money!"},260,35)
				LevelScreen.vars.poort()
				if LevelScreen.vars.poort:get() >= 100 then
					LevelScreen.vars.poor = false
					LevelScreen.vars.poort:set(0)
				end
			end
		end
		if LevelScreen.vars.destroying then
			-- show options
			love.graphics.rectangle("fill",250,25,200,250)
			love.graphics.print({{0,0,0},"Are you sure you want"},260,55)
			love.graphics.print({{0,0,0},"to destroy this tile?"},260,75)
			love.graphics.print({{0,0,0},"No? - [back]"},260,175)
			love.graphics.print({{0,0,0},"Yes? - [enter]"},260,215)
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
				if v.hp > 0 then
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
		end
	end)
	
	LevelScreen.Window.fore:put(function()
		for i,v in pairs(Invasion_Level.Objects.tbl) do
			if v.hp > 0 then
				love.graphics.rectangle("fill",
					(v.x + 1)*TileSize,
					(v.y + 1)*TileSize,
					20,
					20
				)
			end
		end
	end)
end

function Invasion_Level:Update(dt)
	local x, y = love.mouse.getPosition()
	
	if not LevelScreen.vars.selected then
		LevelScreen.vars.sx = math.min(math.max(1,math.floor((700/TileSize)*(x/700)) - 1),(700/TileSize))
		LevelScreen.vars.sy = math.min(math.max(1,math.floor((500/TileSize)*(y/500)) - 1),(500/TileSize))
	end
	
	if LevelScreen.vars.selected and LevelScreen.vars.moving then
		LevelScreen.vars.mx = math.min(math.max(1,math.floor((700/TileSize)*(x/700)) - 1),(700/TileSize))
		LevelScreen.vars.my = math.min(math.max(1,math.floor((500/TileSize)*(y/500)) - 1),(500/TileSize))
	end
	
	LevelScreen.vars.lx, LevelScreen.vars.ly = x, y
	
	if love.mouse.isDown(1) then
		local tile = Invasion_Level.Tiles:Get(LevelScreen.vars.sx, LevelScreen.vars.sy)
		if tile and not tile.path then
			--playSFX("tile_selected")
			LevelScreen.vars.selected = true
			Game.Paused = true
		else
			--playSFX("tile_none")
		end
	end
	
	if love.mouse.isDown(2) then
		--playSFX("tile_deselected")
		LevelScreen.vars.selected = false
		Game.Paused = false
	end
	
	if not Game.Paused then
		Invasion_Level.Objects:Lerp(Invasion_Level.Path)
		
		for y = 1,(500/TileSize) do
			for x = 1,(700/TileSize) do
				local t = Invasion_Level.Tiles:Get(x,y)
				if t.tower then
					t.tower:Act(Invasion_Level.Objects)
				end
			end
		end
		
		Invasion_Level.Objects:Clean()
	end
end

function Invasion_Level:Keypressed(key)
	if LevelScreen.vars.selected then
		-- Tile options
		if key == "a" then
			if (not LevelScreen.vars.moving) and (not LevelScreen.vars.destroying) then
				LevelScreen.vars.building = true
			end
		elseif key == "s" then
			if (not LevelScreen.vars.building) and (not LevelScreen.vars.destroying) then
				LevelScreen.vars.moving = true
			end
		elseif key == "d" then
			if (not LevelScreen.vars.building) and (not LevelScreen.vars.moving) then
				LevelScreen.vars.destroying = true
			end
		elseif iskeyBack(key) then
			playSFX("tile_deselected")
			if (not LevelScreen.vars.building) and (not LevelScreen.vars.moving) and (not LevelScreen.vars.destroying) then
				LevelScreen.vars.selected = false
				Game.Paused = false
			else
				LevelScreen.vars.building = false
				LevelScreen.vars.moving = false
				LevelScreen.vars.destroying = false
			end
		end
	end
	
	if LevelScreen.vars.building then
		local n = tonumber(key)
		if n and (n >= 1) and (n <= 3) then
			local t = Invasion_Level.Tiles:Get(LevelScreen.vars.sx,LevelScreen.vars.sy)
			print(n,
				t.obj,
				t.tower
			)
			
			local costs = {
				[1] = 50,
				[2] = 200,
				[3] = 1000,
			}
			
			if Player.Money >= costs then
				if not t.tower then
					t.tower = Towers.new(LevelScreen.vars.sx + Towers.Offset, LevelScreen.vars.sy + Towers.Offset, n)
					t.tower:Act(Invasion_Level.Path)
					t.tower:Act(Invasion_Level.Objects)
				end
			else
				LevelScreen.vars.poor = true
			end
		end
	end
	
	if LevelScreen.vars.moving then
		if key == "return" then
			
		end
	end
	
	if LevelScreen.vars.destroying then
		if key == "return" then
			
		end
	end
	
	if key == "=" then
		Invasion_Level.Objects:Insert(0,0,10,"none")
	end
end

Game.Levels[2] = Invasion_Level
