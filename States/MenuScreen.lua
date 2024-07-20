-- Menu Screen State

function MenuScreen:Load()
	MenuScreen.vars.Bsound = files.assets.Audio.getSound("home")
end

function MenuScreen:Draw()
	MenuScreen.Window.back:put(function()
		love.graphics.draw(
			files.assets.Textures.getImage("back-d")
		,0,0)
		
		love.graphics.setLineWidth(10)
		love.graphics.rectangle("fill",55,55,690,490)
		love.graphics.setColor(0,0,0)
		love.graphics.rectangle("line",55,55,690,490)
		love.graphics.setColor(1,1,1)
		
		love.graphics.print({{0,0,0},"Menu:"},100,100)
	end)
	
	MenuScreen.Window.mid:put(function()
		
	end)
	
	MenuScreen.Window.fore:put(function()
		love.graphics.setLineWidth(1)
	end)
	
	if not Game.muted then
		MenuScreen.vars.Bsound:play()
	else
		MenuScreen.vars.Bsound:pause()
	end
	MenuScreen.Window:draw()
end

function MenuScreen:Update(dt)
	
end

function MenuScreen:Keypressed(key)
	if not Game.Ctrl and key == "m" then
		MenuScreen.vars.Bsound:seek(0)
		MenuScreen.vars.Bsound:pause()
		Game.State = ShopScreen
		Game.State:Load()
	elseif key == "n" then
		MenuScreen.vars.Bsound:seek(0)
		MenuScreen.vars.Bsound:pause()
		Game.State = SaveScreen
		Game.State:Load()
	elseif iskeyBack(key) then
		MenuScreen.vars.Bsound:seek(0)
		MenuScreen.vars.Bsound:pause()
		Game.State = HomeScreen
		Game.State:Load()
	end
end