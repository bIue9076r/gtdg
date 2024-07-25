jit.off()
love.graphics.setDefaultFilter("nearest", "nearest")
math.randomseed(os.time())
require("/Engine/filesConfig")
require("/Modules/file")
require("/Modules/window")
require("/Modules/state")
require("/Modules/path")
require("/Modules/object")
require("/Modules/tile")
require("/Modules/enemies")
require("/Modules/bullet")
require("/Modules/towers")
require("/Modules/level")
require("/defs")

files.assets.Fonts.newFont("hex-sans-serif","/Assets/hex-sans-serif.ttf",13)
files.assets.Fonts.newFont("hex-sans-serif-26","/Assets/hex-sans-serif.ttf",26)
files.assets.Textures.newImage(1,"/Assets/blank.png")
files.assets.Textures.newImage("title","/Assets/title.png")
files.assets.Textures.newImage("back-d","/Assets/background_day.png")
files.assets.Textures.newImage("back-e","/Assets/background_evening.png")
files.assets.Textures.newImage("back-n","/Assets/background_night.png")

files.assets.Textures.newImage("yesav","/Assets/yesav.png")
files.assets.Textures.newImage("nosav","/Assets/nosav.png")
files.assets.Textures.newImage("ersav","/Assets/ersav.png")

files.assets.Textures.newImage("tile_20","/Assets/tile_20.png")
files.assets.Textures.newImage("tile_25","/Assets/tile_25.png")

files.assets.Textures.newImage("water_20","/Assets/water_20.png")
files.assets.Textures.newImage("shore_L_20","/Assets/shore_L_20.png")
files.assets.Textures.newImage("shore_R_20","/Assets/shore_R_20.png")
files.assets.Textures.newImage("shore_B_20","/Assets/shore_B_20.png")
files.assets.Textures.newImage("shore_T_20","/Assets/shore_T_20.png")
files.assets.Textures.newImage("shore_BL_20","/Assets/shore_BL_20.png")
files.assets.Textures.newImage("shore_BR_20","/Assets/shore_BR_20.png")
files.assets.Textures.newImage("shore_TL_20","/Assets/shore_TL_20.png")
files.assets.Textures.newImage("shore_TR_20","/Assets/shore_TR_20.png")
files.assets.Textures.newImage("shore_CBL_20","/Assets/shore_CBL_20.png")
files.assets.Textures.newImage("shore_CBR_20","/Assets/shore_CBR_20.png")
files.assets.Textures.newImage("shore_CTL_20","/Assets/shore_CTL_20.png")
files.assets.Textures.newImage("shore_CTR_20","/Assets/shore_CTR_20.png")
files.assets.Textures.newImage("sand_20","/Assets/sand_20.png")

files.assets.Textures.newImage("Coconut","/Assets/Coconut.png")
files.assets.Textures.newImage("bullet","/Assets/bullet.png")
files.assets.Textures.newImage("tower1","/Assets/tower1.png")
files.assets.Textures.newImage("tower2","/Assets/tower2.png")
files.assets.Textures.newImage("tower3","/Assets/tower3.png")

files.assets.Audio.new("title","/Assets/intro.mp3","stream")
files.assets.Audio.new("level","/Assets/level.mp3","stream")
files.assets.Audio.new("level2","/Assets/level2.mp3","stream")
files.assets.Audio.new("menu","/Assets/menu.mp3","stream")
files.assets.Audio.new("shop","/Assets/shop.mp3","stream")
files.assets.Audio.new("save","/Assets/save.mp3","stream")

files.assets.Audio.new(1,"/Assets/sfx1.mp3","static")
files.assets.Audio.new("option_moved","/Assets/sfx1.mp3","static")
files.assets.Audio.new("level_selected","/Assets/sfx1.mp3","static")
files.assets.Audio.new("level_deselected","/Assets/sfx1.mp3","static")
files.assets.Audio.new("tile_selected","/Assets/sfx1.mp3","static")
files.assets.Audio.new("tile_deselected","/Assets/sfx1.mp3","static")
files.assets.Audio.new("item_selected","/Assets/sfx1.mp3","static")
files.assets.Audio.new("item_deselected","/Assets/sfx1.mp3","static")
files.assets.Audio.new("save_selected","/Assets/sfx1.mp3","static")
files.assets.Audio.new("save_deselected","/Assets/sfx1.mp3","static")
files.assets.Audio.new("save_saved","/Assets/sfx1.mp3","static")
files.assets.Audio.new("save_loaded","/Assets/sfx1.mp3","static")
files.assets.Audio.new("save_deleted","/Assets/sfx1.mp3","static")
files.assets.Audio.new("cash_spend","/Assets/sfx2.mp3","static")
files.assets.Audio.new("cash_denied","/Assets/sfx3.mp3","static")
files.assets.Audio.new("cash_get","/Assets/sfx4.mp3","static")

love.graphics.setFont(
	files.assets.Fonts.getFont("hex-sans-serif")
)

Player = {}
Player.Money = 300
Player.Kills = 0

Player.Tower_Timer = 5
Player.Tower_Radius = 5
Player.Bomb_Fuse = 100
Player.Bomb_Radius = 15
Player.Multi_Tower = 2

Player.Tower_Timer_Level = 1
Player.Tower_Radius_Level = 1
Player.Bomb_Fuse_Level = 1
Player.Bomb_Radius_Level = 1
Player.Multi_Tower_Level = 1

Player.Tower_Timer_Base_Cost = 3000
Player.Tower_Radius_Base_Cost = 3000
Player.Bomb_Fuse_Base_Cost = 3000
Player.Bomb_Radius_Base_Cost = 3000
Player.Multi_Tower_Base_Cost = 3000

Player.Tower_Timer_Upgrade_Cost = 1000
Player.Tower_Radius_Upgrade_Cost = 1000
Player.Bomb_Fuse_Upgrade_Cost = 1000
Player.Bomb_Radius_Upgrade_Cost = 1000
Player.Multi_Tower_Upgrade_Cost = 1000

Player.Tower_Timer_Upgrade = -0.5
Player.Tower_Radius_Upgrade = 2.5
Player.Bomb_Fuse_Upgrade = -10
Player.Bomb_Radius_Upgrade = 5
Player.Multi_Tower_Upgrade = 1

function AddCash(n)
	Player.Money = Player.Money + n
	playSFX("cash_get")
end

function SubCash(n)
	if Player.Money - n < 0 then
		Player.Money = Player.Money - n
		playSFX("cash_spend")
		return false
	end
	playSFX("cash_denied")
	return true
end

require("/States/LoadScreen")
require("/States/HomeScreen")
require("/States/LevelScreen")
require("/States/MenuScreen")
require("/States/ShopScreen")
require("/States/SaveScreen")

require("/Levels/Tutorial")
require("/Levels/Invasion")
require("/Levels/Return")
require("/Levels/Retreat")

Game.State = LoadScreen
Game.State:Load()

function dQSave(n)
	if n >= 1 then
		love.graphics.setLineWidth(10)
		love.graphics.rectangle("fill",285,30,490,90)
		love.graphics.setColor(0,0,0)
		love.graphics.rectangle("line",285,30,490,90)
		love.graphics.setColor(1,1,1)
		
		love.graphics.print({{0,0,0},"Game Saved!"},
			files.assets.Fonts.getFont("hex-sans-serif-26")
		,300,55)
		love.graphics.setLineWidth(1)
		
		timer.loadEvent(function()
			Game.State.Window.fore:put(function()
				dQSave(n - 1)
			end)
		end,0,{})
	end
end

function dQLoad(n,e)
	if n >= 1 then
		love.graphics.setLineWidth(10)
		love.graphics.rectangle("fill",285,30,490,90)
		love.graphics.setColor(0,0,0)
		love.graphics.rectangle("line",285,30,490,90)
		love.graphics.setColor(1,1,1)
		
		if not e then
			love.graphics.print({{0,0,0},"Game Loaded!"},
				files.assets.Fonts.getFont("hex-sans-serif-26")
			,300,55)
		else
			love.graphics.print({{0,0,0},e.."!"},
				files.assets.Fonts.getFont("hex-sans-serif-26")
			,300,55)
		end
		love.graphics.setLineWidth(1)
		
		timer.loadEvent(function()
			Game.State.Window.fore:put(function()
				dQLoad(n - 1,e)
			end)
		end,0,{})
	end
end

function saveGame(file)
	-- Save things
	file:SetHeader()
	file:NewField("saved","yes")
	file:NewField("version",tostring(Game.Version))
	file:NewField("state",tostring(Game.State.Id))
	file:NewField("money",tostring(Player.Money))
	file:NewField("kills",tostring(Player.Kills))
	file:NewField("tower_timer",tostring(Player.Tower_Timer))
	file:NewField("tower_radius",tostring(Player.Tower_Radius))
	file:NewField("bomb_fuse",tostring(Player.Bomb_Fuse))
	file:NewField("bomb_radius",tostring(Player.Bomb_Radius))
	file:NewField("multi_tower",tostring(Player.Multi_Tower))
	file:NewField("tower_timer_level",tostring(Player.Tower_Timer_Level))
	file:NewField("tower_radius_level",tostring(Player.Tower_Radius_Level))
	file:NewField("bomb_fuse_level",tostring(Player.Bomb_Fuse_Level))
	file:NewField("bomb_radius_level",tostring(Player.Bomb_Radius_Level))
	file:NewField("multi_tower_level",tostring(Player.Multi_Tower_Level))
	dQSave(50)
end

function loadGame(file)
	-- Load things
	local tbl,e  = file:Read()
	if not e then
		for i,v in pairs(tbl) do
			print("["..tostring(i).."]:",v)
		end
		
		if tbl["state"] then
			local id = tonumber(tbl["state"])
			local lv = tonumber(tbl["level"])
			Game.State = States[id]
			Game.State:Load(lv)
		end
		
		Player.Money = tonumber(tbl["money"]) or Player.Money
		Player.Kills = tonumber(tbl["kills"]) or Player.Kills
		Player.Tower_Timer = tonumber(tbl["tower_timer"]) or Player.Tower_Timer
		Player.Tower_Radius = tonumber(tbl["tower_radius"]) or Player.Tower_Radius
		Player.Bomb_Fuse = tonumber(tbl["bomb_fuse"]) or Player.Bomb_Fuse
		Player.Bomb_Radius = tonumber(tbl["bomb_radius"]) or Player.Bomb_Radius
		Player.Multi_Tower = tonumber(tbl["multi_tower"]) or Player.Multi_Tower
		Player.Tower_Timer_Level = tonumber(tbl["tower_timer_level"]) or Player.Tower_Timer_Level
		Player.Tower_Radius_Level = tonumber(tbl["tower_radius_level"]) or Player.Tower_Radius_Level
		Player.Bomb_Fuse_Level = tonumber(tbl["bomb_fuse_level"]) or Player.Bomb_Fuse_Level
		Player.Bomb_Radius_Level = tonumber(tbl["bomb_radius_level"]) or Player.Bomb_Radius_Level
		Player.Multi_Tower_Level = tonumber(tbl["multi_tower_level"]) or Player.Multi_Tower_Level
	else
		print(e)
	end
	dQLoad(50,e)
end

function kerror(key)
	if key == "t" then
		Game.State = LoadScreen
		Game.State:Load()
	end
end

function derror()
	love.graphics.print({{1,1,1},"What?\n\n\n\nPress [t] to go back to the title"},50,50)
end

function ctrlOps(key)
	if key == "lctrl" or key == "rctrl" then
		Game.Ctrl = true
	end
	
	if key == "lalt" or key == "ralt" then
		Game.Alt = true
	end
	
	if Game.Ctrl then
		if key == "m" then
			Game.muted = not Game.muted
			Game.Ctrl = false
		elseif key == "-" then
			Game.Volume = Game.Volume - 0.1
			if Game.Volume < 0 then Game.Volume = 0 end
			love.audio.setVolume(Game.Volume)
			Game.Ctrl = false
		elseif key == "=" then
			Game.Volume = Game.Volume + 0.1
			if Game.Volume > 1 then Game.Volume = 1 end
			love.audio.setVolume(Game.Volume)
			Game.Ctrl = false
		end
	end
	
	if Game.Alt then
		if key == "6" then
			local s = File.new("/Saves/QuickSave.sav")
			saveGame(s)
			Game.Alt = false
		elseif key == "7" then
			local s = File.new("/Saves/QuickSave.sav")
			loadGame(s)
			Game.Alt = false
		elseif Game.Debug and key == "=" then
			AddCash(100)
		elseif key == "s" then
			Game.ShowPath = not Game.ShowPath
			Game.ShowHitBoxes = not Game.ShowHitBoxes
			Game.Alt = false
		elseif key == "d" then
			Game.Debug = not Game.Debug
			Game.Alt = false
		end
	end
end

function love.load()
	-- Save File Handling
	
	if not love.filesystem.getInfo("/Saves") then
		love.filesystem.createDirectory("/Saves")
	end
	
	for i = 1,5 do
		if not love.filesystem.getInfo("/Saves/SaveSlot_"..i..".sav") then
			file = File.new("/Saves/SaveSlot_"..i..".sav")
			file:SetHeader()
		end
	end
	
	love.audio.setVolume(Game.Volume)
end

function love.keypressed(key)
	if Game.State.Keypressed then Game.State:Keypressed(key) end
	ctrlOps(key)
end

function love.update(dt)
	if Game.State.Update then Game.State:Update(dt) end
	files.update(dt)
end

function love.draw()
	if Game.State.Draw then Game.State:Draw(dt) end
	files.draw()
end
