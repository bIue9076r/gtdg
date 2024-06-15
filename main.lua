jit.off()
love.graphics.setDefaultFilter("nearest", "nearest")
math.randomseed(os.time())
require("/Engine/filesConfig")
require("/Modules/file")
require("/Modules/window")
require("/Modules/state")
require("/Modules/path")
require("/Modules/object")
require("/Modules/level")
require("/defs")

files.assets.Fonts.newFont("hex-sans-serif","/Assets/hex-sans-serif.ttf",13)
files.assets.Fonts.newFont("hex-sans-serif-26","/Assets/hex-sans-serif.ttf",26)
files.assets.Textures.newImage("title","/Assets/title.png")
files.assets.Textures.newImage("back-d","/Assets/background_day.png")
files.assets.Textures.newImage("back-e","/Assets/background_evening.png")
files.assets.Textures.newImage("back-n","/Assets/background_night.png")

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

function saveGame(file)
	
end

function loadGame(file)
	
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
end

function love.load()
	-- Save File Handling
	if love.filesystem.getInfo(
		"/TESTFILE.sav" -- replace this
	) then
		Game.FirstTime = false
	end
	
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
