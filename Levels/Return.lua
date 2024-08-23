Return_Level = Level.new("Return")

function Return_Level:Load()
	Return_Level.Tiles = TileTable.new(Tile_X,Tile_Y)
	Return_Level.Objects = ObjectTable.new()
	Return_Level.Path = PathTable.new()
	
	for i = 1,Tile_Y do
		for j = 1,Tile_X do
			Return_Level.Tiles(false,14)
		end
	end
	
	-- Cue the Level Design
	-- y = (y1 - y2)/(x1 - x2)(x - x1) + y1
	for x = 1, 5, 0.1 do
		local y = ((-2.5 - 26)/(1 - 5)) * (x - 1) - 2.5
		y = math.floor(y)
		local fx = math.floor(x)
		local cx = math.ceil(x)
		Return_Level.Tiles:Set(fx,y,true,1)
		Return_Level.Tiles:Set(cx,y,true,1)
	end
	
	for x = 11, 21, 0.1 do
		local y = ((26 - 1)/(11 - 21)) * (x - 11) + 26
		y = math.floor(y)
		local fx = math.floor(x)
		local cx = math.ceil(x)
		Return_Level.Tiles:Set(fx,y,true,1)
		Return_Level.Tiles:Set(cx,y,true,1)
	end
	
	for x = 27, 36, 0.1 do
		local y = ((1 - 12)/(27 - 36)) * (x - 27) + 1
		y = math.floor(y)
		local fx = math.floor(x)
		local cx = math.ceil(x)
		Return_Level.Tiles:Set(fx,y,true,1)
		Return_Level.Tiles:Set(cx,y,true,1)
	end
	
	for i = 5,11 do
		Return_Level.Tiles:Set(1,i,true,2)
	end
	
	for i = 13,18 do
		Return_Level.Tiles:Set(2,i,true,2)
	end
	
	for i = 20,25 do
		Return_Level.Tiles:Set(3,i,true,2)
	end
	
	for i = 1,2 do
		Return_Level.Tiles:Set(3,i,true,3)
	end
	
	for i = 4,9 do
		Return_Level.Tiles:Set(4,i,true,3)
	end
	
	for i = 11,16 do
		Return_Level.Tiles:Set(5,i,true,3)
	end
	
	for i = 18,25 do
		Return_Level.Tiles:Set(6,i,true,3)
	end
	
	Return_Level.Tiles:Set(1,4,true,6)
	Return_Level.Tiles:Set(1,12,true,10)
	Return_Level.Tiles:Set(2,12,true,6)
	Return_Level.Tiles:Set(2,19,true,10)
	Return_Level.Tiles:Set(3,19,true,6)
	
	Return_Level.Tiles:Set(3,3,true,9)
	Return_Level.Tiles:Set(4,10,true,9)
	Return_Level.Tiles:Set(5,17,true,9)
	Return_Level.Tiles:Set(4,3,true,13)
	Return_Level.Tiles:Set(5,10,true,13)
	Return_Level.Tiles:Set(6,17,true,13)

	Return_Level.Tiles:Set(10,25,true,TileName["SH__L"])
	Return_Level.Tiles:Set(10,24,true,TileName["SH__L"])
	Return_Level.Tiles:Set(10,25,true,TileName["SH__L"])
	Return_Level.Tiles:Set(10,23,true,TileName["SH__L"])
	Return_Level.Tiles:Set(11,22,true,TileName["SH__L"])
	Return_Level.Tiles:Set(11,21,true,TileName["SH__L"])
	Return_Level.Tiles:Set(12,20,true,TileName["SH__L"])
	Return_Level.Tiles:Set(12,19,true,TileName["SH__L"])
	Return_Level.Tiles:Set(12,18,true,TileName["SH__L"])
	Return_Level.Tiles:Set(13,17,true,TileName["SH__L"])
	Return_Level.Tiles:Set(13,16,true,TileName["SH__L"])
	Return_Level.Tiles:Set(14,15,true,TileName["SH__L"])
	Return_Level.Tiles:Set(14,14,true,TileName["SH__L"])
	Return_Level.Tiles:Set(14,13,true,TileName["SH__L"])
	Return_Level.Tiles:Set(15,12,true,TileName["SH__L"])
	Return_Level.Tiles:Set(15,11,true,TileName["SH__L"])
	Return_Level.Tiles:Set(16,10,true,TileName["SH__L"])
	Return_Level.Tiles:Set(16,9,true,TileName["SH__L"])
	Return_Level.Tiles:Set(16,8,true,TileName["SH__L"])
	Return_Level.Tiles:Set(17,7,true,TileName["SH__L"])
	Return_Level.Tiles:Set(17,6,true,TileName["SH__L"])
	Return_Level.Tiles:Set(18,5,true,TileName["SH__L"])
	Return_Level.Tiles:Set(18,4,true,TileName["SH__L"])
	Return_Level.Tiles:Set(18,3,true,TileName["SH__L"])
	Return_Level.Tiles:Set(19,2,true,TileName["SH__L"])
	Return_Level.Tiles:Set(19,1,true,TileName["SH__L"])

	Return_Level.Tiles:Set(13,25,true,TileName["SH__R"])
	Return_Level.Tiles:Set(13,24,true,TileName["SH__R"])
	Return_Level.Tiles:Set(14,23,true,TileName["SH__R"])
	Return_Level.Tiles:Set(14,22,true,TileName["SH__R"])
	Return_Level.Tiles:Set(14,21,true,TileName["SH__R"])
	Return_Level.Tiles:Set(15,20,true,TileName["SH__R"])
	Return_Level.Tiles:Set(15,19,true,TileName["SH__R"])
	Return_Level.Tiles:Set(16,18,true,TileName["SH__R"])
	Return_Level.Tiles:Set(16,17,true,TileName["SH__R"])
	Return_Level.Tiles:Set(16,16,true,TileName["SH__R"])
	Return_Level.Tiles:Set(17,15,true,TileName["SH__R"])
	Return_Level.Tiles:Set(17,14,true,TileName["SH__R"])
	Return_Level.Tiles:Set(18,13,true,TileName["SH__R"])
	Return_Level.Tiles:Set(18,12,true,TileName["SH__R"])
	Return_Level.Tiles:Set(18,11,true,TileName["SH__R"])
	Return_Level.Tiles:Set(19,10,true,TileName["SH__R"])
	Return_Level.Tiles:Set(19,9,true,TileName["SH__R"])
	Return_Level.Tiles:Set(20,8,true,TileName["SH__R"])
	Return_Level.Tiles:Set(20,7,true,TileName["SH__R"])
	Return_Level.Tiles:Set(20,6,true,TileName["SH__R"])
	Return_Level.Tiles:Set(21,5,true,TileName["SH__R"])
	Return_Level.Tiles:Set(21,4,true,TileName["SH__R"])
	Return_Level.Tiles:Set(22,3,true,TileName["SH__R"])
	Return_Level.Tiles:Set(22,2,true,TileName["SH__R"])
	Return_Level.Tiles:Set(22,1,true,TileName["SH__R"])
	
	Return_Level.Tiles:Set(10,22,true,TileName["SHCTL"])
	Return_Level.Tiles:Set(11,22,true,TileName["SH_TL"])
	
	Return_Level.Tiles:Set(11,20,true,TileName["SHCTL"])
	Return_Level.Tiles:Set(12,20,true,TileName["SH_TL"])
	
	Return_Level.Tiles:Set(12,17,true,TileName["SHCTL"])
	Return_Level.Tiles:Set(13,17,true,TileName["SH_TL"])
	
	Return_Level.Tiles:Set(13,15,true,TileName["SHCTL"])
	Return_Level.Tiles:Set(14,15,true,TileName["SH_TL"])
	
	Return_Level.Tiles:Set(14,12,true,TileName["SHCTL"])
	Return_Level.Tiles:Set(15,12,true,TileName["SH_TL"])
	
	Return_Level.Tiles:Set(15,10,true,TileName["SHCTL"])
	Return_Level.Tiles:Set(16,10,true,TileName["SH_TL"])
	
	Return_Level.Tiles:Set(16,7,true,TileName["SHCTL"])
	Return_Level.Tiles:Set(17,7,true,TileName["SH_TL"])
	
	Return_Level.Tiles:Set(17,5,true,TileName["SHCTL"])
	Return_Level.Tiles:Set(18,5,true,TileName["SH_TL"])
	
	Return_Level.Tiles:Set(18,2,true,TileName["SHCTL"])
	Return_Level.Tiles:Set(19,2,true,TileName["SH_TL"])
	
	
	Return_Level.Tiles:Set(13,24,true,TileName["SH_BR"])
	Return_Level.Tiles:Set(14,24,true,TileName["SHCBR"])
	
	Return_Level.Tiles:Set(14,21,true,TileName["SH_BR"])
	Return_Level.Tiles:Set(15,21,true,TileName["SHCBR"])
	
	Return_Level.Tiles:Set(15,19,true,TileName["SH_BR"])
	Return_Level.Tiles:Set(16,19,true,TileName["SHCBR"])
	
	Return_Level.Tiles:Set(16,16,true,TileName["SH_BR"])
	Return_Level.Tiles:Set(17,16,true,TileName["SHCBR"])
	
	Return_Level.Tiles:Set(17,14,true,TileName["SH_BR"])
	Return_Level.Tiles:Set(18,14,true,TileName["SHCBR"])
	
	Return_Level.Tiles:Set(18,11,true,TileName["SH_BR"])
	Return_Level.Tiles:Set(19,11,true,TileName["SHCBR"])
	
	Return_Level.Tiles:Set(19,9,true,TileName["SH_BR"])
	Return_Level.Tiles:Set(20,9,true,TileName["SHCBR"])
	
	Return_Level.Tiles:Set(20,6,true,TileName["SH_BR"])
	Return_Level.Tiles:Set(21,6,true,TileName["SHCBR"])
	
	Return_Level.Tiles:Set(21,4,true,TileName["SH_BR"])
	Return_Level.Tiles:Set(22,4,true,TileName["SHCBR"])
	
	--Return_Level.Tiles:Set(13,15,true,TileName["SH_TR"])
	--Return_Level.Tiles:Set(14,15,true,TileName["SHCTR"])
	
	
	
	Return_Level.Path:Insert(1,5.5,-2.5,26,500)
	--Return_Level.Path:Insert(5.5,11.5,26,26,1)
	Return_Level.Path:Insert(11.5,21.5,26,1,500)
	--Return_Level.Path:Insert(21.5,27.5,1,1,1)
	Return_Level.Path:Insert(27.5,36,1,12,500)
	
	Return_Level.Objects:InsertObj(Enemies.new(10,"Coconut",-(0 + (100 * 1))))
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
	
	Return_Level.Damage = 0
	Return_Level.MaxDamage = 10
	LevelScreen.vars.selected = false
	LevelScreen.vars.building = false
	LevelScreen.vars.poor = false
	LevelScreen.vars.poort = ticker.new()
	LevelScreen.vars.destroying = false
end

function Return_Level:Draw()
	LevelScreen.Window.back:put(function()
		love.graphics.rectangle("fill",380,10,135,30)
		love.graphics.print({{0,0.8,0},"Cash: $"..(Player.Money)},390,20)
		love.graphics.rectangle("fill",515,10,185,30)
		love.graphics.print({{0,0,0},"Damage: "..math.floor(Return_Level.Damage).."/"..(Return_Level.MaxDamage)},525,20)
		
		love.graphics.rectangle("line",50,50,700,500)
		
		for y = 1,Tile_Y do
			for x = 1,Tile_X do
				local t = Return_Level.Tiles:Get(x,y)
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
				LevelTiles[(Return_Level.Tiles:Get(
					LevelScreen.vars.sx,LevelScreen.vars.sy
				).obj)]:sub(1,-4)
			)},35,55)
			
			love.graphics.print({{0,0,0},"Path: "..(
				tostring(Return_Level.Tiles:Get(
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
			for i,v in pairs(Return_Level.Path.tbl) do
				love.graphics.setColor(1,1,0)
				love.graphics.line(
					(v.x1 + 1.5)*TileSize,(v.y1 + 1.5)*TileSize,
					(v.x2 + 1.5)*TileSize,(v.y2 + 1.5)*TileSize
				)
				love.graphics.setColor(1,1,1)
			end
		end
		
		if Game.ShowHitBoxes then
			for i,v in pairs(Return_Level.Objects.tbl) do
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
		Return_Level.Objects:DrawAll()
	end)
end

function Return_Level:Update(dt)
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
		local tile = Return_Level.Tiles:Get(LevelScreen.vars.sx, LevelScreen.vars.sy)
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
				local t = Return_Level.Tiles:Get(x,y)
				if t.tower then
					t.tower:Act(Return_Level.Objects)
				end
			end
		end
		
		Return_Level.Objects:ActAll(Return_Level)
		Return_Level.Objects:CleanAll()
	end
end

function Return_Level:Keypressed(key)
	if not LevelScreen.vars.selected then
		if isKeyUp(key) then
			LevelScreen.vars.sy = math.max(math.floor(LevelScreen.vars.sy - 1),1)
		elseif isKeyDown(key) then
			LevelScreen.vars.sy = math.min(math.floor(LevelScreen.vars.sy + 1),Tile_Y)
		elseif isKeyLeft(key) then
			LevelScreen.vars.sx = math.max(math.floor(LevelScreen.vars.sx - 1),1)
		elseif isKeyRight(key) then
			LevelScreen.vars.sx = math.min(math.floor(LevelScreen.vars.sx + 1),Tile_X)
		elseif key == "return" then
			playSFX("tile_selected")
			LevelScreen.vars.selected = true
			Game.Paused = true
		end
	end
	
	if LevelScreen.vars.selected then
		-- Tile options
		if key == "a" then
			if (not LevelScreen.vars.destroying) then
				LevelScreen.vars.building = true
			end
		elseif key == "d" then
			if (not LevelScreen.vars.building) then
				LevelScreen.vars.destroying = true
			end
		elseif iskeyBack(key) then
			playSFX("tile_deselected")
			if (not LevelScreen.vars.building) and (not LevelScreen.vars.destroying) then
				LevelScreen.vars.selected = false
				Game.Paused = false
			else
				LevelScreen.vars.building = false
				LevelScreen.vars.destroying = false
				LevelScreen.vars.poor = false
				LevelScreen.vars.poort:set(0)
			end
		end
	end
	
	if LevelScreen.vars.building then
		local n = tonumber(key)
		if n and (n >= 1) and (n <= 4) then
			local t = Return_Level.Tiles:Get(LevelScreen.vars.sx,LevelScreen.vars.sy)
			
			if Player.Money >= LevelScreen.vars.costs[n] then
				if not t.tower then
					if not (n == 4) then
						t.tower = Towers.new(LevelScreen.vars.sx + Towers.Offset, LevelScreen.vars.sy + Towers.Offset, n)
						t.tower:Act(Return_Level.Path)
						t.tower:Act(Return_Level.Objects)
						Player.Money = Player.Money - LevelScreen.vars.costs[n]
						playSFX("cash_spend")
					else
						t.tower = Bombs.new(LevelScreen.vars.sx + Bombs.Offset, LevelScreen.vars.sy + Bombs.Offset)
						t.tower.parent = t
						t.tower.index = "tower"
						t.tower:Act(Return_Level.Path)
						t.tower:Act(Return_Level.Objects)
						Player.Money = Player.Money - LevelScreen.vars.costs[n]
						playSFX("cash_spend")
					end
				end
				LevelScreen.vars.selected = false
				LevelScreen.vars.building = false
				Game.Paused = false
			else
				LevelScreen.vars.poor = true
				playSFX("cash_denied")
			end
		end
	end
	
	if LevelScreen.vars.destroying then
		if key == "return" then
			local t = Return_Level.Tiles:Get(LevelScreen.vars.sx,LevelScreen.vars.sy)
			if t.tower then
				local n = tonumber(t.tower.id:sub(-1)) or 1
				Player.Money = Player.Money + LevelScreen.vars.costs[n]
				t.tower = nil
				LevelScreen.vars.selected = false
				LevelScreen.vars.destroying = false
				Game.Paused = false
				playSFX("cash_get")
			end
		end
	end
	
	if Game.Debug and key == "0" then
		Return_Level.Objects:InsertObj(
			Enemies.new(100 * (math.random()),"Coconut")
		)
	end
end

Game.Levels[3] = Return_Level
