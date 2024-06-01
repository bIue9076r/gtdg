jit.off()
love.graphics.setDefaultFilter("nearest", "nearest")
require("/Engine/filesConfig")
require("/Modules/file")
require("/Modules/window")
require("/Modules/state")
require("/defs")

files.assets.Fonts.newFont("hex-sans-serif","/Assets/hex-sans-serif.ttf",12)
files.assets.Textures.newImage("title","/Assets/title.png")

love.graphics.setFont(
	files.assets.Fonts.getFont("hex-sans-serif")
)

require("/States/LoadScreen")
require("/States/HomeScreen")

Game.State = LoadScreen

function kerror(key)
	if key == "t" then
		LoadScreen:Load()
		Game.State = LoadScreen
	end
end

function derror()
	love.graphics.print("What?\n\n\n\nPress [t] to go back to the title",50,50)
end

function love.load()
	-- Save File Handling
end

function love.keypressed(key)
	if Game.State.Keypressed then Game.State:Keypressed(key) end
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