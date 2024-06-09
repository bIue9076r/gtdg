-- Level Screen State

function LevelScreen:Load(l)
	print(l)
	LevelScreen.vars.Bsound = files.assets.Audio.getSound("level")
end

function LevelScreen:Draw()
	LevelScreen.Window.back:put(function()
		love.graphics.draw(
			files.assets.Textures.getImage("back-d")
		,0,0)
		love.graphics.setLineWidth(10)
		love.graphics.rectangle("fill",5,5,240,590)
		love.graphics.setColor(0,0,0)
		love.graphics.rectangle("line",5,5,240,590)
		love.graphics.setColor(1,1,1)
		
		love.graphics.rectangle("fill",285,405,490,140)
		love.graphics.setColor(0,0,0)
		love.graphics.rectangle("line",285,405,490,140)
		love.graphics.setColor(1,1,1)
		
		love.graphics.print({{0,0,0},"Controls:"},300,420)
		love.graphics.print({{0,0,0},"Up: [w]  Down: [s]  Select: [enter]  Return: [b]  Options [m]"},300,440)
		
		love.graphics.print({{0,0,0},"Stats:"},300,480)
		love.graphics.print({{0,0,0},"Money: $"..tostring(Player.Money)},300,500)
	end)
	
	LevelScreen.Window.mid:put(function()
		if LevelScreen.vars.Pick then
			love.graphics.rectangle("fill",285,55,490,290)
			love.graphics.setColor(0,0,0)
			love.graphics.rectangle("line",285,55,490,290)
			love.graphics.setColor(1,1,1)
		end
		
		if LevelScreen.vars.Option then
			love.graphics.rectangle("fill",285,405,490,140)
			love.graphics.setColor(0,0,0)
			love.graphics.rectangle("line",285,405,490,140)
			love.graphics.setColor(1,1,1)
			
			love.graphics.print({{0,0,0},"Options:"},300,420)
			love.graphics.print({{0,0,0},"Shop: [m]  Menu: [,]  Back [n]"},300,440)
		end
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
		Game.State = LoadScreen
		Game.State:Load()
	end
end