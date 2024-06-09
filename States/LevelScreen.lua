-- Level Screen State

function LevelScreen:Load(l)
	print(l)
	LevelScreen.vars.Bsound = files.assets.Audio.getSound("level")
	LevelScreen.vars.ntos = {
		[1] = "d",
		[2] = "d",
		[3] = "e",
		[4] = "n",
	}
	
	LevelScreen.vars.s = LevelScreen.vars.ntos[l]
end

function LevelScreen:Draw()
	LevelScreen.Window.back:put(function()
		love.graphics.draw(
			files.assets.Textures.getImage("back-"..LevelScreen.vars.s)
		,0,0)
	end)
	
	LevelScreen.Window.mid:put(function()
		
	end)
	
	LevelScreen.Window.fore:put(function()
		
	end)
	
	if not Game.muted then
		LevelScreen.vars.Bsound:play()
	else
		LevelScreen.vars.Bsound:pause()
	end
	LevelScreen.Window:draw()
end

function LevelScreen:Update(dt)
	
end

function LevelScreen:Keypressed(key)
	if key == "return" then
		LevelScreen.vars.Bsound:seek(0)
		LevelScreen.vars.Bsound:pause()
		Game.State = LoadScreen
		Game.State:Load()
	end
end