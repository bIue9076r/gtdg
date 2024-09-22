Tutorial_Level = Level.new("Tutorial")

function Tutorial_Level:Load()
	Tutorial_Level.Tiles = TileTable.new(Tile_X,Tile_Y)
	Tutorial_Level.Objects = ObjectTable.new()
	Tutorial_Level.Path = PathTable.new()
	
	for i = 1,Tile_Y do
		for j = 1,Tile_X do
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
		love.graphics.setColor(1,0,0)
		love.graphics.rectangle("line",
			50 + ((LevelScreen.vars.sx-1)*TileSize),50 + ((LevelScreen.vars.sy-1)*TileSize),
			TileSize,TileSize
		)
		love.graphics.setColor(1,1,1)
	end)
	
	LevelScreen.Window.fore:put(function()
		
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
				local t = Tutorial_Level.Tiles:Get(x,y)
				if t.tower then
					t.tower:Act(Tutorial_Level.Objects)
				end
			end
		end
		
		Tutorial_Level.Objects:ActAll(Tutorial_Level)
		Tutorial_Level.Objects:CleanAll()
	end
end

function Tutorial_Level:Keypressed(key)
	
end

Game.Levels[1] = Tutorial_Level