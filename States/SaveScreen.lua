-- Save Screen State

function SaveScreen:Load()
	SaveScreen.vars.Bsound = files.assets.Audio.getSound("save")
end

function SaveScreen:Draw()
	SaveScreen.Window.back:put(function()
		love.graphics.draw(
			files.assets.Textures.getImage("back-d")
		,0,0)
		
		love.graphics.setLineWidth(10)
		love.graphics.rectangle("fill",55,55,690,490)
		love.graphics.setColor(0,0,0)
		love.graphics.rectangle("line",55,55,690,490)
		love.graphics.setColor(1,1,1)
	end)
	
	SaveScreen.Window.mid:put(function()
		
	end)
	
	SaveScreen.Window.fore:put(function()
		love.graphics.setLineWidth(1)
	end)
	
	if not Game.muted then
		SaveScreen.vars.Bsound:play()
	else
		SaveScreen.vars.Bsound:pause()
	end
	SaveScreen.Window:draw()
end

function SaveScreen:Update(dt)
	
end

function SaveScreen:Keypressed(key)
	if key == "n" then
		
	elseif key == "b" then
		SaveScreen.vars.Bsound:seek(0)
		SaveScreen.vars.Bsound:pause()
		Game.State = MenuScreen
		Game.State:Load()
	end
end