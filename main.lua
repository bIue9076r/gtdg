jit.off()
love.graphics.setDefaultFilter("nearest", "nearest")
require("/Engine/filesConfig")
require("/Modules/file")
require("/Modules/window")
require("/Modules/state")
require("/defs")

files.assets.Fonts.newFont("hex-sans-serif","/Assets/hex-sans-serif.ttf",13)
files.assets.Textures.newImage("title","/Assets/title.png")
files.assets.Textures.newImage("back-d","/Assets/background_day.png")
files.assets.Textures.newImage("back-e","/Assets/background_evening.png")
files.assets.Textures.newImage("back-n","/Assets/background_night.png")

files.assets.Audio.new("title","/Assets/intro.mp3","stream")
files.assets.Audio.new("level","/Assets/level.mp3","stream")
files.assets.Audio.new("menu","/Assets/menu.mp3","stream")

love.graphics.setFont(
	files.assets.Fonts.getFont("hex-sans-serif")
)

Player = {}
Player.Money = 0

require("/States/LoadScreen")
require("/States/HomeScreen")
require("/States/LevelScreen")
require("/States/MenuScreen")
require("/States/ShopScreen")

Game.State = LoadScreen
Game.State:Load()

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
	if Game.muted then
		-- play sound
	end
	if Game.State.Draw then Game.State:Draw(dt) end
	files.draw()
end
