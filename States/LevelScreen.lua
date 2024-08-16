-- Level Screen State

function LevelScreen:Load(l)
	LevelScreen.vars.Bsoundn = math.random(1,3)
	LevelScreen.vars.Bsoundl = LevelScreen.vars.Bsoundn
	LevelScreen.vars.Bsounds = {
		[1] = "",
		[2] = "2",
		[3] = "3",
	}
	
	LevelScreen.vars.Bsound = files.assets.Audio.getSound(
		"level"..LevelScreen.vars.Bsounds[LevelScreen.vars.Bsoundn]
	)
	LevelScreen.vars.ntos = {
		[1] = "d",
		[2] = "d",
		[3] = "e",
		[4] = "n",
	}
	
	l = l or 1
	-- Other levels soon
	if not((l == 2) or (l == 3) or (l == 4)) then
		LevelScreen.vars.Bsound:seek(0)
		LevelScreen.vars.Bsound:pause()
		Game.State = HomeScreen
		Game.State:Load()
	else
		LevelScreen.vars.s = LevelScreen.vars.ntos[l]
		LevelScreen.vars.level = Game.Levels[l]
		LevelScreen.vars.level:Load()
	end
end

function LevelScreen:Draw()
	LevelScreen.vars.level:Draw()
	
	LevelScreen.Window.back:put(function()
		love.graphics.draw(
			files.assets.Textures.getImage("back-"..LevelScreen.vars.s)
		,0,0)
	end)
	
	if not Game.muted then
		if not LevelScreen.vars.Bsound:isPlaying() then
			repeat
				LevelScreen.vars.Bsoundn = math.random(1,3)
			until not(LevelScreen.vars.Bsoundn == LevelScreen.vars.Bsoundl)
			
			LevelScreen.vars.Bsoundl = LevelScreen.vars.Bsoundn
			LevelScreen.vars.Bsound = files.assets.Audio.getSound(
				"level"..LevelScreen.vars.Bsounds[LevelScreen.vars.Bsoundn]
			)
		end
		
		LevelScreen.vars.Bsound:play()
	else
		LevelScreen.vars.Bsound:pause()
	end
	LevelScreen.Window:draw()
end

function LevelScreen:Update(dt)
	LevelScreen.vars.level:Update(dt)
	
	if LevelScreen.vars.level.Damage >= LevelScreen.vars.level.MaxDamage then
		Game.Over = true
	end
	
	if Game.Over then
		LevelScreen.vars.Bsound:seek(0)
		LevelScreen.vars.Bsound:pause()
		Game.State = LoadScreen
		Game.Over = false
		if Game.Victory then
			print("Win")
			Game.State:Load(2)
		else
			print("Loss")
			Game.State:Load(3)
		end
	end
end

function LevelScreen:Keypressed(key)
	LevelScreen.vars.level:Keypressed(key)
	if key == "q" then
		LevelScreen.vars.shouldQuit1 = true
	end
	
	if LevelScreen.vars.shouldQuit1 and key == "p" then
		LevelScreen.vars.shouldQuit2 = true
	end
	
	if LevelScreen.vars.shouldQuit2 and key == "q" then
		LevelScreen.vars.shouldQuit1 = false
		LevelScreen.vars.shouldQuit2 = false
		Game.Victory = false
		Game.Over = true
	end
end