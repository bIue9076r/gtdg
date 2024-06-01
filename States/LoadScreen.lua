-- Load Screen State
title_img = files.assets.Textures.getImage("title")
title_bgs = files.assets.Audio.getSound("title")
LS_ticker = files.ticker.new()

function LS_back_1()
	love.graphics.draw(
		files.assets.Textures.getImage("back-d")
	,0,0)
	love.graphics.draw(title_img,50,50)
	love.graphics.print("A Generic Tower Defence Game",170,160)
	
	local t = LS_ticker:get()
	love.graphics.print("Created By bIue9076r",(-100*(1-(t/100))) + (200*(t/100)),200)
	love.graphics.print("Press Enter to continue",(900*(1-(t/100))) + (250*(t/100)),300)
	if t <= 100 then
		LS_ticker()
	end
end

function LoadScreen:Load()
	LS_ticker:reset()
	title_bgs:seek(0)
	title_bgs:play()
end

function LoadScreen:Draw()
	if Game.muted then
		title_bgs:pause()
	end
	LoadScreen.Window.back:put(LS_back_1)
	LoadScreen.Window:draw()
end

function LoadScreen:Update(dt)
	
end

function LoadScreen:Keypressed(key)
	if key == "return" then
		HomeScreen:Load()
		Game.State = HomeScreen
	end
end