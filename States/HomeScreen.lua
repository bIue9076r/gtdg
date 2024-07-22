-- Home Screen State
ra = ticker.new()

function HomeScreen:Load()
	HomeScreen.vars.Levels = {
		"Getting Started (Tutorial)",
		"Tropical Abnormalities",
		"Sunset Daydream",
		"Midnight Madness",
	}
	
	HomeScreen.vars.LevelImg = ""
	HomeScreen.vars.LevelStr1 = ""
	HomeScreen.vars.LevelStr2 = sticker.new("")
	HomeScreen.vars.LevelStr3 = sticker.new("")
	HomeScreen.vars.LevelStr4 = sticker.new("")
	HomeScreen.vars.LevelStr5 = sticker.new("")
	HomeScreen.vars.LevelStr6 = sticker.new("")
	
	HomeScreen.vars.LevelFuncs = {}
	HomeScreen.vars.LevelFuncs[1] = function()
		HomeScreen.vars.LevelImg = ""
		HomeScreen.vars.LevelStr1 = HomeScreen.vars.Levels[1]..":"
		HomeScreen.vars.LevelStr2 = sticker.new("The Coconuts have declared")
		HomeScreen.vars.LevelStr3 = sticker.new("war!")
		HomeScreen.vars.LevelStr4 = sticker.new("Learn how to stop them in this")
		HomeScreen.vars.LevelStr5 = sticker.new("simulation.")
		HomeScreen.vars.LevelStr6 = sticker.new("Difficulty: None (-/3) [Unavaliable]")
	end
	
	HomeScreen.vars.LevelFuncs[2] = function()
		HomeScreen.vars.LevelImg = ""
		HomeScreen.vars.LevelStr1 = HomeScreen.vars.Levels[2]..":"
		HomeScreen.vars.LevelStr2 = sticker.new("The Coconuts are invading")
		HomeScreen.vars.LevelStr3 = sticker.new("the beach!")
		HomeScreen.vars.LevelStr4 = sticker.new("You must stop them before")
		HomeScreen.vars.LevelStr5 = sticker.new("its too late.")
		HomeScreen.vars.LevelStr6 = sticker.new("Difficulty: Easy (1/3)")
	end
	
	HomeScreen.vars.LevelFuncs[3] = function()
		HomeScreen.vars.LevelImg = ""
		HomeScreen.vars.LevelStr1 = HomeScreen.vars.Levels[3]..":"
		HomeScreen.vars.LevelStr2 = sticker.new("The Coconuts have returned")
		HomeScreen.vars.LevelStr3 = sticker.new("after their initial retreat!")
		HomeScreen.vars.LevelStr4 = sticker.new("You must stop them yet")
		HomeScreen.vars.LevelStr5 = sticker.new("again.")
		HomeScreen.vars.LevelStr6 = sticker.new("Difficulty: Medium (2/3) [Unavaliable]")
	end
	
	HomeScreen.vars.LevelFuncs[4] = function()
		HomeScreen.vars.LevelImg = ""
		HomeScreen.vars.LevelStr1 = HomeScreen.vars.Levels[4]..":"
		HomeScreen.vars.LevelStr2 = sticker.new("The Coconuts are retreating")
		HomeScreen.vars.LevelStr3 = sticker.new("to their ship!")
		HomeScreen.vars.LevelStr4 = sticker.new("You must stop them from")
		HomeScreen.vars.LevelStr5 = sticker.new("leaving.")
		HomeScreen.vars.LevelStr6 = sticker.new("Difficulty: Hard (3/3) [Unavaliable]")
	end
	
	HomeScreen.vars.Pick = false
	HomeScreen.vars.Option = false
	HomeScreen.vars.Select = 1
	HomeScreen.vars.SelectLast = 0
	HomeScreen.vars.Inside = false
	HomeScreen.vars.lx = 0
	HomeScreen.vars.ly = 0
	HomeScreen.vars.Bsound = files.assets.Audio.getSound("menu")
	HomeScreen.Window:draw() -- should be a clear
end

function HomeScreen:Draw()
	HomeScreen.Window.back:put(function()
		love.graphics.draw(
			files.assets.Textures.getImage("back-d")
		,0,0)
		love.graphics.setLineWidth(10)
		love.graphics.rectangle("fill",5,5,240,590)
		love.graphics.setColor(0,0,0)
		love.graphics.rectangle("line",5,5,240,590)
		love.graphics.setColor(1,1,1)
		for i = 1,#HomeScreen.vars.Levels do
			love.graphics.print({{0,0,0},HomeScreen.vars.Levels[i]},25,50+(100*(i-1)))
		end
		
		love.graphics.setColor(1,0,0)
		love.graphics.rectangle("line",15,15+(100*(HomeScreen.vars.Select-1)),220,85)
		love.graphics.setColor(1,1,1)
		
		love.graphics.rectangle("fill",285,405,490,140)
		love.graphics.setColor(0,0,0)
		love.graphics.rectangle("line",285,405,490,140)
		love.graphics.setColor(1,1,1)
		
		love.graphics.print({{0,0,0},"Controls:"},300,420)
		love.graphics.print({{0,0,0},"Up: [w]  Down: [s]  Select: [enter]  Return: [b]  Options [n]"},300,440)
		
		love.graphics.print({{0,0,0},"Stats:"},300,480)
		love.graphics.print({{0,0,0},"Money: $"..tostring(Player.Money)},300,500)
	end)
	
	HomeScreen.Window.mid:put(function()
		if HomeScreen.vars.Pick then
			love.graphics.rectangle("fill",285,55,490,290)
			love.graphics.setColor(0,0,0)
			love.graphics.rectangle("line",285,55,490,290)
			love.graphics.setColor(1,1,1)
			
			love.graphics.setColor(1,0,1)
			love.graphics.rectangle("fill",300,70,190,190)
			love.graphics.setColor(1,1,1)
			
			love.graphics.print({{0,0,0},HomeScreen.vars.LevelStr1},510,80)
			love.graphics.print({{0,0,0},HomeScreen.vars.LevelStr2()},510,120)
			love.graphics.print({{0,0,0},HomeScreen.vars.LevelStr3()},510,140)
			
			love.graphics.print({{0,0,0},HomeScreen.vars.LevelStr4()},510,180)
			love.graphics.print({{0,0,0},HomeScreen.vars.LevelStr5()},510,200)
			
			love.graphics.print({{0,0,0},HomeScreen.vars.LevelStr6()},300,280)
		end
		
		if HomeScreen.vars.Option then
			love.graphics.rectangle("fill",285,405,490,140)
			love.graphics.setColor(0,0,0)
			love.graphics.rectangle("line",285,405,490,140)
			love.graphics.setColor(1,1,1)
			
			love.graphics.print({{0,0,0},"Options:"},300,420)
			love.graphics.print({{0,0,0},"Shop: [m]  Back [n]"},300,440)
			--love.graphics.print({{0,0,0},"Shop: [m]  Menu: [,]  Back [n]"},300,440)
		end
	end)
	
	HomeScreen.Window.fore:put(function()
		love.graphics.setLineWidth(1)
	end)
	
	if not Game.muted then
		HomeScreen.vars.Bsound:play()
	else
		HomeScreen.vars.Bsound:pause()
	end
	HomeScreen.Window:draw()
end

function HomeScreen:Update(dt)
	local x,y = love.mouse.getPosition()
	
	if not(HomeScreen.vars.ly == y) and not(HomeScreen.vars.lx == x) then
		if (x >= 15) and (x <= 235) then
			if (y >= 15) and (y <= 400) then
				HomeScreen.vars.Select = math.max(1,math.min(4,math.floor(((y-15)/(385))*4)+1))
				if not (HomeScreen.vars.SelectLast == HomeScreen.vars.Select) then
					HomeScreen.vars.LevelFuncs[HomeScreen.vars.Select]()
				end
				HomeScreen.vars.Inside = true
			else
				HomeScreen.vars.Inside = false
			end
		else
			HomeScreen.vars.Inside = false
		end
	end
	
	if HomeScreen.vars.Inside and love.mouse.isDown(1) then
		--playSFX("level_selected")
		HomeScreen.vars.Pick = true
	end
	
	if love.mouse.isDown(2) and HomeScreen.vars.Pick then
		--playSFX("level_deselected")
		HomeScreen.vars.Pick = false
	end
	
	HomeScreen.vars.lx, HomeScreen.vars.ly = x, y
	HomeScreen.vars.SelectLast = HomeScreen.vars.Select
end

function HomeScreen:Keypressed(key)
	if isKeyUp(key) then
		if HomeScreen.vars.Select - 1 >= 1 then
			HomeScreen.vars.Select = HomeScreen.vars.Select - 1
		else
			HomeScreen.vars.Select = #HomeScreen.vars.Levels
		end
		if not (HomeScreen.vars.SelectLast == HomeScreen.vars.Select) then
			HomeScreen.vars.LevelFuncs[HomeScreen.vars.Select]()
		end
		HomeScreen.vars.SelectLast = HomeScreen.vars.Select
		playSFX("option_moved")
	elseif isKeyDown(key) then
		if HomeScreen.vars.Select + 1 <= #HomeScreen.vars.Levels then
			HomeScreen.vars.Select = HomeScreen.vars.Select + 1
		else
			HomeScreen.vars.Select = 1
		end
		if not (HomeScreen.vars.SelectLast == HomeScreen.vars.Select) then
			HomeScreen.vars.LevelFuncs[HomeScreen.vars.Select]()
		end
		HomeScreen.vars.SelectLast = HomeScreen.vars.Select
		playSFX("option_moved")
	elseif key == "return" then
		if HomeScreen.vars.Pick then
			HomeScreen.vars.Pick = false
			HomeScreen.vars.Bsound:seek(0)
			HomeScreen.vars.Bsound:pause()
			Game.State = LevelScreen
			Game.State:Load(HomeScreen.vars.Select)
		else
			if not (HomeScreen.vars.SelectLast == 0) then
				HomeScreen.vars.LevelFuncs[HomeScreen.vars.Select]()
			end
			HomeScreen.vars.Pick = true
			playSFX("level_selected")
		end
	elseif iskeyBack(key) and HomeScreen.vars.Pick then
		HomeScreen.vars.Pick = false
		playSFX("level_deselected")
	elseif key == "t" and not HomeScreen.vars.Pick then
		HomeScreen.vars.Bsound:seek(0)
		HomeScreen.vars.Bsound:pause()
		Game.State = LoadScreen
		Game.State:Load()
	elseif key == "n" then
		HomeScreen.vars.Option = not HomeScreen.vars.Option
		playSFX("option_moved")
	elseif not Game.Ctrl and key == "m" then
		HomeScreen.vars.Bsound:seek(0)
		HomeScreen.vars.Bsound:pause()
		Game.State = ShopScreen
		Game.State:Load()
	elseif key == "," then
		HomeScreen.vars.Bsound:seek(0)
		HomeScreen.vars.Bsound:pause()
		Game.State = MenuScreen
		Game.State:Load()
	end
end
