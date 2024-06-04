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
end

HomeScreen.vars.LevelFuncs[2] = function()
	love.graphics.setColor(1,0,1)
	love.graphics.rectangle("fill",300,70,190,190)
	love.graphics.setColor(1,1,1)
end

HomeScreen.vars.LevelFuncs[3] = function()
	love.graphics.setColor(1,0,1)
	love.graphics.rectangle("fill",300,70,190,190)
	love.graphics.setColor(1,1,1)
end

HomeScreen.vars.LevelFuncs[4] = function()
	love.graphics.setColor(1,0,1)
	love.graphics.rectangle("fill",300,70,190,190)
	love.graphics.setColor(1,1,1)
end

HomeScreen.vars.Pick = false
HomeScreen.vars.Select = 1
HomeScreen.vars.Bsound = files.assets.Audio.getSound("level")

function HomeScreen:Load()
	
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
	end)
	
	HomeScreen.Window.mid:put(function()
		if HomeScreen.vars.Pick then
			love.graphics.rectangle("fill",285,55,490,490)
			love.graphics.setColor(0,0,0)
			love.graphics.rectangle("line",285,55,490,490)
			love.graphics.setColor(1,1,1)
			HomeScreen.Window.mid:put(HomeScreen.vars.LevelFuncs[HomeScreen.vars.Select])
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
	if isKeyUp(key) and not HomeScreen.vars.Pick then
		if HomeScreen.vars.Select - 1 >= 1 then
			HomeScreen.vars.Select = HomeScreen.vars.Select - 1
		else
			HomeScreen.vars.Select = #HomeScreen.vars.Levels
		end
	elseif isKeyDown(key) and not HomeScreen.vars.Pick then
		if HomeScreen.vars.Select + 1 <= #HomeScreen.vars.Levels then
			HomeScreen.vars.Select = HomeScreen.vars.Select + 1
		else
			HomeScreen.vars.Select = 1
		end
	elseif key == "return" then
		if HomeScreen.vars.Pick then
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
	end
end
