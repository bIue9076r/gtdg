Tutorial_Level = Level.new("Tutorial")

function Tutorial_Level:Load()
	LevelScreen.vars.Tutorial_X = 14
	LevelScreen.vars.Tutorial_Y = 10
	Tutorial_Level.Tiles = TileTable.new(LevelScreen.vars.Tutorial_X,LevelScreen.vars.Tutorial_Y)
	Tutorial_Level.Objects = ObjectTable.new()
	Tutorial_Level.Path = PathTable.new()
	
	for i = 1,LevelScreen.vars.Tutorial_Y do
		for j = 1,LevelScreen.vars.Tutorial_X do
			Tutorial_Level.Tiles(false,14)
		end
	end
	
	LevelScreen.vars.sx = 1
	LevelScreen.vars.sy = 1
	LevelScreen.vars.lx = 0
	LevelScreen.vars.ly = 0
	
	LevelScreen.vars.LastPlayer = Player
	Player = {
		Money = 300,
		Kills = 0,
		Tower_Timer = 5,
		Tower_Radius = 5,
		Bomb_Fuse = 100,
		Bomb_Radius = 10,
		Multi_Tower = 2,
		Tower_Timer_Level = 1,
		Tower_Radius_Level = 1,
		Bomb_Fuse_Level = 1,
		Bomb_Radius_Level = 1,
		Multi_Tower_Level = 1,
		Tower_Timer_Base_Cost = 3000,
		Tower_Radius_Base_Cost = 3000,
		Bomb_Fuse_Base_Cost = 3000,
		Bomb_Radius_Base_Cost = 3000,
		Multi_Tower_Base_Cost = 3000,
		Tower_Timer_Upgrade_Cost = 1000,
		Tower_Radius_Upgrade_Cost = 1000,
		Bomb_Fuse_Upgrade_Cost = 1000,
		Bomb_Radius_Upgrade_Cost = 1000,
		Multi_Tower_Upgrade_Cost = 1000,
		Tower_Timer_Upgrade = -0.5,
		Tower_Radius_Upgrade = 2.5,
		Bomb_Fuse_Upgrade = -10,
		Bomb_Radius_Upgrade = 2.5,
		Multi_Tower_Upgrade = 1,
	}
	
	LevelScreen.vars.dF_index = 1
	LevelScreen.vars.disFuncs = {}
	LevelScreen.vars.disFuncs[1] = function()
		love.graphics.rectangle("fill",50,50,500,100)
		love.graphics.print({{0,0,0},"Welcome to Generic Tower Defense Game!"},60,60)
		love.graphics.print({{0,0,0},"press enter"},80,120)
		love.graphics.draw(files.assets.Textures.getImage("title"),300,100)
		
		LevelScreen.Window.back:put(function()
			for y = 1,LevelScreen.vars.Tutorial_Y do
				for x = 1,LevelScreen.vars.Tutorial_X do
					local t = Tutorial_Level.Tiles:Get(x,y)
					love.graphics.draw(
						files.assets.Textures.getImage(
							LevelTiles[t.obj] or "tile_20" 
						)
					,90 + ((x-1)*TileSize),190 + ((y-1)*TileSize)
					)
					
					if t.tower then
						t.tower:Draw()
					end
				end
			end
		end)
		
		love.graphics.draw(
			files.assets.Textures.getImage(
				LevelTiles[TileName["NULL_"]]
			),
			90 + ((2-1)*TileSize),
			190 + ((2-1)*TileSize)
		)
	end
	
	LevelScreen.vars.disFuncs[2] = function()
		love.graphics.rectangle("fill",50,50,500,100)
		love.graphics.print({{0,0,0},"This Simulation is to help you get a hang of the game"},60,60)
		love.graphics.print({{0,0,0},"press enter"},80,120)
	end
	
	LevelScreen.vars.disFuncs[3] = function()
		love.graphics.rectangle("fill",50,50,500,100)
		love.graphics.print({{0,0,0},"This is a Coconut"},60,60)
		love.graphics.print({{0,0,0},"press enter"},80,120)
		love.graphics.draw(files.assets.Textures.getImage("Coconut"),300,50,0,5)
	end
	
	LevelScreen.vars.disFuncs[4] = function()
		love.graphics.rectangle("fill",50,50,500,100)
		love.graphics.print({{0,0,0},"Kill as many of them as you can before they over run the beach"},60,60)
		love.graphics.print({{0,0,0},"press enter"},80,120)
	end
end

function Tutorial_Level:Draw()
	LevelScreen.Window.back:put(function()
		--[[
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
		]]
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
		local f = LevelScreen.vars.disFuncs[LevelScreen.vars.dF_index]
		if f then f() end
		-- Text box
	end)
end

function Tutorial_Level:Update(dt)
	local x, y = love.mouse.getPosition()
	
	local dx, dy = LevelScreen.vars.lx - x, LevelScreen.vars.ly - y
	if not LevelScreen.vars.selected then
		if not(dx == 0) or not(dy == 0) then
			LevelScreen.vars.sx = math.min(math.max(1,math.floor(Tile_X*(x/700)) - 1),Tile_X)
			LevelScreen.vars.sy = math.min(math.max(1,math.floor(Tile_Y*(y/500)) - 1),Tile_Y)
		end
	end
	
	LevelScreen.vars.lx, LevelScreen.vars.ly = x, y
end

function Tutorial_Level:Keypressed(key)
	
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
			
			if LevelScreen.vars.dF_index >= 1 then
				LevelScreen.vars.dF_index = LevelScreen.vars.dF_index + 1
				if LevelScreen.vars.dF_index >= 5 then
					LevelScreen.vars.dF_index = 1
				end
			end
		end
	end
end

Game.Levels[1] = Tutorial_Level

-- Tutorial:
-- 1: Intro
-- 2: Selecting Tiles
-- 3: Building
-- 4: Upgrades
-- 5: Rewards
-- 6: Lore
-- ......
