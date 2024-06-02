-- Home Screen State

HomeScreen.vars.Levels = {
	"Getting Started (Tutorial)",
	"Tropical Abnormalities",
	"Sunset Daydream",
	"Midnight Madness",
}

HomeScreen.vars.Select = 1

function HomeScreen:Load()
	
end

function HomeScreen:Draw()
	HomeScreen.Window.back:put(function()
		love.graphics.draw(
			files.assets.Textures.getImage("back-d")
		,0,0)
		love.graphics.setLineWidth(10)
		love.graphics.rectangle("line",5,5,240,590)
	end)
	
	HomeScreen.Window.fore:put(function()
		love.graphics.print("Select: "..HomeScreen.vars.Select,50,50)
	end)
	HomeScreen.Window:draw()
end

function HomeScreen:Update(dt)
	
end

function HomeScreen:Keypressed(key)
	if isKeyUp(key) then
		HomeScreen.vars.Select = HomeScreen.vars.Select - 1
	elseif isKeyDown(key) then
		HomeScreen.vars.Select = HomeScreen.vars.Select + 1
	elseif key == "return" then
		
	elseif key == "t" then
		Game.State = LoadScreen
		Game.State:Load()
	end
end