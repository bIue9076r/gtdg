-- Load Screen State
title_img = files.assets.Textures.getImage("title")
LS_ticker = files.ticker.new()

function LS_back_1()
	love.graphics.draw(title_img,50,50)
	love.graphics.print("A Generic Tower Defence Game",170,160)
	
	local t = LS_ticker:get()
	love.graphics.print("Created By bIue9076r",(-100*(1-(t/100))) + (200*(t/100)),200)
	if t <= 100 then
		LS_ticker()
	end
end

function LoadScreen:Load()
	LS_ticker:reset()
end

function LoadScreen:Draw()
	LoadScreen.Window.back:put(LS_back_1)
	LoadScreen.Window:draw()
end

function LoadScreen:Update(dt)
	
end

function LoadScreen:Keypressed(key)
	
end