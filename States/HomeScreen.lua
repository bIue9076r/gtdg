-- Home Screen State

function HomeScreen:Load()
	
end

function HomeScreen:Draw()
	HomeScreen.Window.back:put(function()
		love.graphics.rectangle("fill",0,0,500,500)
	end)
	HomeScreen.Window:draw()
end

function HomeScreen:Update(dt)
	
end

function HomeScreen:Keypressed(key)
	
end