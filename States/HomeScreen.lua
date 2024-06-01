-- Home Screen State

function HomeScreen:Load()
	
end

function HomeScreen:Draw()
	HomeScreen.Window.back:put(function()
		love.graphics.draw(
			files.assets.Textures.getImage("back-d")
		,0,0)
		love.graphics.rectangle("fill",0,0,250,600)
	end)
	HomeScreen.Window:draw()
end

function HomeScreen:Update(dt)
	
end

function HomeScreen:Keypressed(key)
	if isKeyUp(key) then
		
	elseif isKeyDown(key) then
		
	elseif key == "return" then
		
	elseif key == "t" then
		LoadScreen:Load()
		Game.State = LoadScreen
	end
end