-- Home Screen State

HomeScreen.vars.Levels = {
	"Getting Started (Tutorial)",
	"Tropical Abnormalities",
	"Sunset Daydream",
	"Midnight Madness",
}

HomeScreen.vars.LevelFuncs = {}
HomeScreen.vars.LevelFuncs[1] = function()
	love.graphics.setColor(1,0,1)
	love.graphics.rectangle("fill",300,70,190,190)
	love.graphics.setColor(1,1,1)
	
	love.graphics.print({{0,0,0},HomeScreen.vars.Levels[1]..":"},510,80)
	love.graphics.print({{0,0,0},"The Coconuts have declared"},510,120)
	love.graphics.print({{0,0,0},"war!"},510,140)
	
	love.graphics.print({{0,0,0},"Learn how to stop them in this"},510,180)
	love.graphics.print({{0,0,0},"simulation."},510,200)
	
	love.graphics.print({{0,0,0},"Difficulty: None (-/3)"},300,280)
end

HomeScreen.vars.LevelFuncs[2] = function()
	love.graphics.setColor(1,0,1)
	love.graphics.rectangle("fill",300,70,190,190)
	love.graphics.setColor(1,1,1)
	
	love.graphics.print({{0,0,0},HomeScreen.vars.Levels[2]..":"},510,80)
	love.graphics.print({{0,0,0},"The Coconuts are invading"},510,120)
	love.graphics.print({{0,0,0},"the beach!"},510,140)
	
	love.graphics.print({{0,0,0},"You must stop them before"},510,180)
	love.graphics.print({{0,0,0},"its too late."},510,200)
	
	love.graphics.print({{0,0,0},"Difficulty: Easy (1/3)"},300,280)
end

HomeScreen.vars.LevelFuncs[3] = function()
	love.graphics.setColor(1,0,1)
	love.graphics.rectangle("fill",300,70,190,190)
	love.graphics.setColor(1,1,1)
	
	love.graphics.print({{0,0,0},HomeScreen.vars.Levels[3]..":"},510,80)
	love.graphics.print({{0,0,0},"The Coconuts have returned"},510,120)
	love.graphics.print({{0,0,0},"after their initial retreat!"},510,140)
	
	love.graphics.print({{0,0,0},"You must stop them yet"},510,180)
	love.graphics.print({{0,0,0},"again."},510,200)
	
	love.graphics.print({{0,0,0},"Difficulty: Medium (2/3)"},300,280)
end

HomeScreen.vars.LevelFuncs[4] = function()
	love.graphics.setColor(1,0,1)
	love.graphics.rectangle("fill",300,70,190,190)
	love.graphics.setColor(1,1,1)
	
	love.graphics.print({{0,0,0},HomeScreen.vars.Levels[4]..":"},510,80)
	love.graphics.print({{0,0,0},"The Coconuts are retreating"},510,120)
	love.graphics.print({{0,0,0},"to their ship!"},510,140)
	
	love.graphics.print({{0,0,0},"You must stop them from"},510,180)
	love.graphics.print({{0,0,0},"leaving."},510,200)
	
	love.graphics.print({{0,0,0},"Difficulty: Hard (3/3)"},300,280)
end

HomeScreen.vars.Pick = false
HomeScreen.vars.Option = false
HomeScreen.vars.Select = 1
HomeScreen.vars.Bsound = files.assets.Audio.getSound("level")

function HomeScreen:Load()
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
		love.graphics.print({{0,0,0},"Up: [w]  Down: [s]  Select: [enter]  Return: [b]  Options [m]"},300,440)
		
		love.graphics.print({{0,0,0},"Stats:"},300,480)
		love.graphics.print({{0,0,0},"Money: $"..tostring(Player.Money)},300,500)
	end)
	
	HomeScreen.Window.mid:put(function()
		if HomeScreen.vars.Pick then
			love.graphics.rectangle("fill",285,55,490,290)
			love.graphics.setColor(0,0,0)
			love.graphics.rectangle("line",285,55,490,290)
			love.graphics.setColor(1,1,1)
			HomeScreen.Window.mid:put(HomeScreen.vars.LevelFuncs[HomeScreen.vars.Select])
		end
		
		if HomeScreen.vars.Option then
			love.graphics.rectangle("fill",285,405,490,140)
			love.graphics.setColor(0,0,0)
			love.graphics.rectangle("line",285,405,490,140)
			love.graphics.setColor(1,1,1)
			
			love.graphics.print({{0,0,0},"Options:"},300,420)
			love.graphics.print({{0,0,0},"Shop: [m]  Menu: [,]  Back [n]"},300,440)
		end
	end)
	
	HomeScreen.Window.fore:put(function()
		
	end)
	
	if not Game.muted then
		HomeScreen.vars.Bsound:play()
	else
		HomeScreen.vars.Bsound:pause()
	end
	HomeScreen.Window:draw()
end

function HomeScreen:Update(dt)
	
end

function HomeScreen:Keypressed(key)
	if isKeyUp(key) then
		if HomeScreen.vars.Select - 1 >= 1 then
			HomeScreen.vars.Select = HomeScreen.vars.Select - 1
		else
			HomeScreen.vars.Select = #HomeScreen.vars.Levels
		end
	elseif isKeyDown(key) then
		if HomeScreen.vars.Select + 1 <= #HomeScreen.vars.Levels then
			HomeScreen.vars.Select = HomeScreen.vars.Select + 1
		else
			HomeScreen.vars.Select = 1
		end
	elseif key == "return" then
		if HomeScreen.vars.Pick then
			HomeScreen.vars.Pick = false
			HomeScreen.vars.Bsound:seek(0)
			HomeScreen.vars.Bsound:pause()
			Game.State = LevelScreen
			Game.State:Load(HomeScreen.vars.Select)
		else
			HomeScreen.vars.Pick = true
		end
	elseif key == "b" and HomeScreen.vars.Pick then
		HomeScreen.vars.Pick = false
	elseif key == "t" and not HomeScreen.vars.Pick then
		HomeScreen.vars.Bsound:seek(0)
		HomeScreen.vars.Bsound:pause()
		Game.State = LoadScreen
		Game.State:Load()
	elseif key == "n" then
		HomeScreen.vars.Option = not HomeScreen.vars.Option
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
