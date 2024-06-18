-- Level Screen State

function LevelScreen:Load(l)
	LevelScreen.vars.Bsound = files.assets.Audio.getSound("level")
	LevelScreen.vars.ntos = {
		[1] = "d",
		[2] = "d",
		[3] = "e",
		[4] = "n",
	}
	
	l = l or 1
	LevelScreen.vars.s = LevelScreen.vars.ntos[l]
	LevelScreen.vars.level = Game.Levels[l]
	LevelScreen.vars.level:Load()
end

function LevelScreen:Draw()
	LevelScreen.vars.level:Draw()
	
	LevelScreen.Window.back:put(function()
		love.graphics.draw(
			files.assets.Textures.getImage("back-"..LevelScreen.vars.s)
		,0,0)
	end)
	
	if not Game.muted then
		LevelScreen.vars.Bsound:play()
	else
		LevelScreen.vars.Bsound:pause()
	end
	LevelScreen.Window:draw()
end

function LevelScreen:Update(dt)
	LevelScreen.vars.level:Update(dt)
end

function LevelScreen:Keypressed(key)
	LevelScreen.vars.level:Keypressed(key)
	if key == "return" then
		LevelScreen.vars.Bsound:seek(0)
		LevelScreen.vars.Bsound:pause()
		Game.State = LoadScreen
		Game.State:Load()
	end
end