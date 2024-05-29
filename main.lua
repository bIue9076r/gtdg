jit.off()
love.graphics.setDefaultFilter("nearest", "nearest")
require("/Engine/filesConfig")
require("defs")
require("window")

Game.State = LoadScreen

STATE_KEYPRESSED = {
	[LoadScreen] = LoadScreen_Keypressed,
	[HomeScreen] = HomeScreen_Keypressed,
	[LevelScreen] = LevelScreen_Keypressed,
	[MenuScreen] = MenuScreen_Keypressed,
	[ShopScreen] = ShopScreen_Keypressed,
}

STATE_UPDATE = {
	[LoadScreen] = LoadScreen_Update,
	[HomeScreen] = HomeScreen_Update,
	[LevelScreen] = LevelScreen_Update,
	[MenuScreen] = MenuScreen_Update,
	[ShopScreen] = ShopScreen_Update,
}

STATE_DRAW = {
	[LoadScreen] = LoadScreen_Draw,
	[HomeScreen] = HomeScreen_Draw,
	[LevelScreen] = LevelScreen_Draw,
	[MenuScreen] = MenuScreen_Draw,
	[ShopScreen] = ShopScreen_Draw,
}

function kerror(key)
	if key == "t" then
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
	local f = STATE_KEYPRESSED[Game.State] or kerror
	if f then f(key) end
end

function love.update(dt)
	local f = STATE_UPDATE[Game.State]
	if f then f(dt) end
	files.update(dt)
end

function love.draw()
	if Game.muted then
		-- play sound
	end
	local f = STATE_DRAW[Game.State] or derror
	if f then f() end
	files.draw()
end