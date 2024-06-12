-- Shop Screen State

function ShopScreen:Load()
	ShopScreen.vars.Bsound = files.assets.Audio.getSound("shop")
end

function ShopScreen:Draw()
	ShopScreen.Window.back:put(function()
		love.graphics.draw(
			files.assets.Textures.getImage("back-d")
		,0,0)
		
		love.graphics.setLineWidth(10)
		love.graphics.rectangle("fill",5,5,240,590)
		love.graphics.setColor(0,0,0)
		love.graphics.rectangle("line",5,5,240,590)
		love.graphics.setColor(1,1,1)
	end)
	
	ShopScreen.Window.mid:put(function()
		
	end)
	
	ShopScreen.Window.fore:put(function()
		love.graphics.setLineWidth(1)
	end)
	
	if not Game.muted then
		ShopScreen.vars.Bsound:play()
	else
		ShopScreen.vars.Bsound:pause()
	end
	ShopScreen.Window:draw()
end

function ShopScreen:Update(dt)
	
end

function ShopScreen:Keypressed(key)
	if key == "n" then
		
	elseif key == "b" then
		ShopScreen.vars.Bsound:seek(0)
		ShopScreen.vars.Bsound:pause()
		Game.State = HomeScreen
		Game.State:Load()
	end
end