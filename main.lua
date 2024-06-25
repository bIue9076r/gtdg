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
require("/Modules/level")
require("/defs")

files.assets.Fonts.newFont("hex-sans-serif","/Assets/hex-sans-serif.ttf",13)
files.assets.Fonts.newFont("hex-sans-serif-26","/Assets/hex-sans-serif.ttf",26)
files.assets.Textures.newImage("title","/Assets/title.png")
files.assets.Textures.newImage("back-d","/Assets/background_day.png")
files.assets.Textures.newImage("back-e","/Assets/background_evening.png")
files.assets.Textures.newImage("back-n","/Assets/background_night.png")

files.assets.Textures.newImage("yesav","/Assets/yesav.png")
files.assets.Textures.newImage("nosav","/Assets/nosav.png")
files.assets.Textures.newImage("ersav","/Assets/ersav.png")

files.assets.Textures.newImage("tile_20","/Assets/tile_20.png")
files.assets.Textures.newImage("tile_25","/Assets/tile_25.png")

files.assets.Audio.new("title","/Assets/intro.mp3","stream")
files.assets.Audio.new("level","/Assets/level.mp3","stream")
files.assets.Audio.new("menu","/Assets/menu.mp3","stream")
files.assets.Audio.new("shop","/Assets/shop.mp3","stream")
files.assets.Audio.new("save","/Assets/save.mp3","stream")

love.graphics.setFont(
	files.assets.Fonts.getFont("hex-sans-serif")
)

Player = {}
Player.Money = 0
Player.Kills = 0

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
	file:NewField("state",tostring(Game.State.Id))
	file:NewField("money",tostring(Player.Money))
	file:NewField("kills",tostring(Player.Kills))
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
		
		Player.Money = tbl["money"] or Player.Money
		Player.Kills = tbl["kills"] or Player.Kills
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
