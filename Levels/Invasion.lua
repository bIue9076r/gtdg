Invasion_Level = Level.new("Invasion")

function Invasion_Level:Load()
	Invasion_Level.Tiles = TileTable.new(Tile_X,Tile_Y)
	Invasion_Level.Objects = ObjectTable.new()
	Invasion_Level.Path = PathTable.new()
	
	for i = 1,Tile_Y do
		for j = 1,Tile_X do
			Invasion_Level.Tiles(false,14)
		end
	end
	
	-- Cue the Level Design
	for i = 1,Tile_Y do
		Invasion_Level.Tiles:Set(1,i,true,1)
		Invasion_Level.Tiles:Set(2,i,true,1)
		Invasion_Level.Tiles:Set(3,i,true,1)
		Invasion_Level.Tiles:Set(4,i,true,3)
	end
	
	for j = 5,Tile_X do
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
	Invasion_Level.Tiles:Set(4,21,false,17)
	Invasion_Level.Tiles:Set(4,22,false,14)
	Invasion_Level.Tiles:Set(4,23,false,14)
	Invasion_Level.Tiles:Set(4,24,false,14)
	Invasion_Level.Tiles:Set(4,25,false,14)
	
	for j = 1,Tile_X do
		Invasion_Level.Tiles:Set(j,21,false,17)
		Invasion_Level.Tiles:Set(j,22,false,27)
		Invasion_Level.Tiles:Set(j,23,false,27)
		Invasion_Level.Tiles:Set(j,24,false,27)
		Invasion_Level.Tiles:Set(j,25,false,27)
	end
	
	Invasion_Level.Tiles:Set(9,15,true,22)
	
	for i = 1,14 do
		Invasion_Level.Tiles:Set(9,i,true,16)
	end
	
	for j = 10,Tile_X do
		Invasion_Level.Tiles:Set(j,15,false,18)
	end
	 
	for i = 1,14 do
		for j = 10,Tile_X do
			Invasion_Level.Tiles:Set(j,i,false,27)
		end
	end
	
	for i = 1, 11, 2 do
		for j = 12, Tile_X, 2 do
			Invasion_Level.Tiles:Set(j,i,false,32)
			Invasion_Level.Tiles:Set(j+1,i,false,33)
			Invasion_Level.Tiles:Set(j,i+1,false,34)
			Invasion_Level.Tiles:Set(j+1,i+1,false,35)
		end
	end
	
	for i = 1, 12, 2 do
		Invasion_Level.Tiles:Set(11,i,false,30)
		Invasion_Level.Tiles:Set(11,i+1,false,28)
	end
	
	Invasion_Level.Tiles:Set(11,13,false,30)
	
	for j = 13, Tile_X, 2 do
		Invasion_Level.Tiles:Set(j,13,false,30)
	end
	
	for j = 1, Tile_X, 2 do
		Invasion_Level.Tiles:Set(j,23,false,29)
		Invasion_Level.Tiles:Set(j+1,23,false,28)
		Invasion_Level.Tiles:Set(j,24,false,32)
		Invasion_Level.Tiles:Set(j+1,24,false,33)
		Invasion_Level.Tiles:Set(j,25,false,34)
		Invasion_Level.Tiles:Set(j+1,25,false,35)
	end
	
	Invasion_Level.Path:Insert(2.5,2.5,-2.5,18.5,1000)
	Invasion_Level.Path:Insert(2.5,36,18.5,18.5,1000)
	
	Invasion_Level.Objects:InsertObj(Enemies.new(60,"Coconut",-(0 + 100)))
	Invasion_Level.Objects:InsertObj(Enemies.new(60,"Coconut",-(0 + 200)))
	Invasion_Level.Objects:InsertObj(Enemies.new(60,"Coconut",-(0 + 300)))
	Invasion_Level.Objects:InsertObj(Enemies.new(60,"Coconut",-(0 + 400)))
	Invasion_Level.Objects:InsertObj(Enemies.new(60,"Coconut",-(0 + 500)))
	Invasion_Level.Objects:InsertObj(Enemies.new(60,"Coconut",-(0 + 600)))
	Invasion_Level.Objects:InsertObj(Enemies.new(60,"Coconut",-(0 + 700)))
	Invasion_Level.Objects:InsertObj(Enemies.new(60,"Coconut",-(0 + 800)))
	Invasion_Level.Objects:InsertObj(Enemies.new(60,"Coconut",-(0 + 900)))
	
	Invasion_Level.Objects:InsertObj(Enemies.new(120,"Coconut",-(2000 + 100)))
	Invasion_Level.Objects:InsertObj(Enemies.new(120,"Coconut",-(2000 + 200)))
	Invasion_Level.Objects:InsertObj(Enemies.new(120,"Coconut",-(2000 + 300)))
	Invasion_Level.Objects:InsertObj(Enemies.new(120,"Coconut",-(2000 + 400)))
	Invasion_Level.Objects:InsertObj(Enemies.new(120,"Coconut",-(2000 + 500)))
	Invasion_Level.Objects:InsertObj(Enemies.new(120,"Coconut",-(2000 + 600)))
	Invasion_Level.Objects:InsertObj(Enemies.new(120,"Coconut",-(2000 + 700)))
	Invasion_Level.Objects:InsertObj(Enemies.new(120,"Coconut",-(2000 + 800)))
	Invasion_Level.Objects:InsertObj(Enemies.new(120,"Coconut",-(2000 + 900)))
	
	Invasion_Level.Objects:InsertObj(Enemies.new(240,"Coconut",-(4000 + 100)))
	Invasion_Level.Objects:InsertObj(Enemies.new(240,"Coconut",-(4000 + 200)))
	Invasion_Level.Objects:InsertObj(Enemies.new(240,"Coconut",-(4000 + 300)))
	Invasion_Level.Objects:InsertObj(Enemies.new(240,"Coconut",-(4000 + 400)))
	Invasion_Level.Objects:InsertObj(Enemies.new(240,"Coconut",-(4000 + 500)))
	Invasion_Level.Objects:InsertObj(Enemies.new(240,"Coconut",-(4000 + 600)))
	Invasion_Level.Objects:InsertObj(Enemies.new(240,"Coconut",-(4000 + 700)))
	Invasion_Level.Objects:InsertObj(Enemies.new(240,"Coconut",-(4000 + 800)))
	Invasion_Level.Objects:InsertObj(Enemies.new(240,"Coconut",-(4000 + 900)))
	
	Invasion_Level.Objects:InsertObj(Enemies.new(1,"Victory",-5000))
	-- ^ ^ ^ Clean this up later ^ ^ ^ ---

	LevelScreen.vars.sx = 1
	LevelScreen.vars.sy = 1
	LevelScreen.vars.lx = 0
	LevelScreen.vars.ly = 0
	
	LevelScreen.vars.costs = {
		[1] = 100,
		[2] = 400,
		[3] = 2000,
		[4] = 500,
	}
	
	if Player.Money < LevelScreen.vars.costs[1] then
		Player.Money = LevelScreen.vars.costs[1]
	end
	
	Invasion_Level.Damage = 0
	LevelScreen.vars.selected = false
	LevelScreen.vars.building = false
	LevelScreen.vars.poor = false
	LevelScreen.vars.poort = ticker.new()
	LevelScreen.vars.moving = false
	LevelScreen.vars.destroying = false
end

function Invasion_Level:Draw()
	LevelScreen.Window.back:put(function()
		love.graphics.rectangle("fill",380,10,135,30)
		love.graphics.print({{0,0.8,0},"Cash: $"..(Player.Money)},390,20)
		love.graphics.rectangle("fill",515,10,185,30)
		love.graphics.print({{0,0,0},"Damage: "..math.floor(Invasion_Level.Damage).."/"..(Invasion_Level.MaxDamage)},525,20)
		
		love.graphics.rectangle("line",50,50,700,500)
		
		for y = 1,Tile_Y do
			for x = 1,Tile_X do
				local t = Invasion_Level.Tiles:Get(x,y)
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
			love.graphics.print({{0,0,0},"Destroy - [d]"},35,175)
			love.graphics.print({{0,0,0},"Deselect - [b]"},35,195)
		end
		if LevelScreen.vars.building then
			-- show building options
			love.graphics.rectangle("fill",250,25,200,250)
			love.graphics.print({{0,0,0},"Towers:"},260,35)
			love.graphics.print({{0,0,0},"[1] $"..(LevelScreen.vars.costs[1])..": Wood Tower"},260,75)
			love.graphics.print({{0,0,0},"[2] $"..(LevelScreen.vars.costs[2])..": Iron Tower"},260,95)
			love.graphics.print({{0,0,0},"[3] $"..(LevelScreen.vars.costs[3])..": Gold Tower"},260,115)
			love.graphics.print({{0,0,0},"[4] $"..(LevelScreen.vars.costs[4])..": Bomb"},260,135)
			
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
						v.s,v.s
					)
					love.graphics.setColor(1,1,1)
				end
			end
		end
	end)
	
	LevelScreen.Window.fore:put(function()
		Invasion_Level.Objects:DrawAll()
	end)
end

function Invasion_Level:Update(dt)
	local x, y = love.mouse.getPosition()
	
	local dx, dy = LevelScreen.vars.lx - x, LevelScreen.vars.ly - y
	if not LevelScreen.vars.selected then
		if not(dx == 0) or not(dy == 0) then
			LevelScreen.vars.sx = math.min(math.max(1,math.floor(Tile_X*(x/700)) - 1),Tile_X)
			LevelScreen.vars.sy = math.min(math.max(1,math.floor(Tile_Y*(y/500)) - 1),Tile_Y)
		end
	end
	
	LevelScreen.vars.lx, LevelScreen.vars.ly = x, y
	
	if love.mouse.isDown(1) then
		local tile = Invasion_Level.Tiles:Get(LevelScreen.vars.sx, LevelScreen.vars.sy)
		if tile and not tile.path then
			playSFX("tile_selected")
			LevelScreen.vars.selected = true
			Game.Paused = true
		else
			playSFX("tile_none")
		end
	end
	
	if love.mouse.isDown(2) then
		playSFX("tile_deselected")
		LevelScreen.vars.selected = false
		Game.Paused = false
	end
	
	if not Game.Paused then
		for y = 1,Tile_Y do
			for x = 1,Tile_X do
				local t = Invasion_Level.Tiles:Get(x,y)
				if t.tower then
					t.tower:Act(Invasion_Level.Objects)
				end
			end
		end
		
		Invasion_Level.Objects:ActAll(Invasion_Level)
		Invasion_Level.Objects:CleanAll()
	end
end

function Invasion_Level:Keypressed(key)
	if not LevelScreen.vars.selected then
		if isKeyUp(key) then
			LevelScreen.vars.sy = math.min(math.max(1,math.floor(LevelScreen.vars.sy - 1,Tile_Y)))
		elseif isKeyDown(key) then
			LevelScreen.vars.sy = math.min(math.max(1,math.floor(LevelScreen.vars.sy + 1,Tile_Y)))
		elseif isKeyLeft(key) then
			LevelScreen.vars.sx = math.min(math.max(1,math.floor(LevelScreen.vars.sx - 1,Tile_X)))
		elseif isKeyRight(key) then
			LevelScreen.vars.sx = math.min(math.max(1,math.floor(LevelScreen.vars.sx + 1,Tile_X)))
		elseif key == "return" then
			playSFX("tile_selected")
			LevelScreen.vars.selected = true
			Game.Paused = true
		end
	end
	
	if LevelScreen.vars.selected then
		-- Tile options
		if key == "a" then
			if (not LevelScreen.vars.moving) and (not LevelScreen.vars.destroying) then
				LevelScreen.vars.building = true
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
				LevelScreen.vars.poor = false
				LevelScreen.vars.poort:set(0)
			end
		end
	end
	
	if LevelScreen.vars.building then
		local n = tonumber(key)
		if n and (n >= 1) and (n <= 4) then
			local t = Invasion_Level.Tiles:Get(LevelScreen.vars.sx,LevelScreen.vars.sy)
			
			if Player.Money >= LevelScreen.vars.costs[n] then
				if not t.tower then
					if not (n == 4) then
						t.tower = Towers.new(LevelScreen.vars.sx + Towers.Offset, LevelScreen.vars.sy + Towers.Offset, n)
						t.tower:Act(Invasion_Level.Path)
						t.tower:Act(Invasion_Level.Objects)
						Player.Money = Player.Money - LevelScreen.vars.costs[n]
						playSFX("cash_spend")
					else
						t.tower = Bombs.new(LevelScreen.vars.sx + Bombs.Offset, LevelScreen.vars.sy + Bombs.Offset)
						t.tower.parent = t
						t.tower.index = "tower"
						t.tower:Act(Invasion_Level.Path)
						t.tower:Act(Invasion_Level.Objects)
						Player.Money = Player.Money - LevelScreen.vars.costs[n]
						playSFX("cash_spend")
					end
				end
			else
				LevelScreen.vars.poor = true
				playSFX("cash_denied")
			end
		end
	end
	
	if LevelScreen.vars.destroying then
		if key == "return" then
			local t = Invasion_Level.Tiles:Get(LevelScreen.vars.sx,LevelScreen.vars.sy)
			if t.tower then
				local n = tonumber(t.tower.id:sub(-1)) or 1
				Player.Money = Player.Money + LevelScreen.vars.costs[n]
				t.tower = nil
				LevelScreen.vars.destroying = false
				playSFX("cash_get")
			end
		end
	end
	
	if Game.Debug and key == "0" then
		Invasion_Level.Objects:InsertObj(
			Enemies.new(100 * (math.random()),"Coconut")
		)
	end
end

Game.Levels[2] = Invasion_Level
