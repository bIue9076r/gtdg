-- Load Screen State
function LS_func_1()
	love.graphics.print("Generic Tower Defence Game",50,50)
	
	love.graphics.setColor(0,1,1)
	love.graphics.rectangle("fill",70,70,50,50)
	love.graphics.setColor(1,1,1)
end

function LS_func_2()
	love.graphics.print("Mid Ground",50,175)
	
	love.graphics.setColor(1,0,1)
	love.graphics.rectangle("fill",95,95,50,50)
	love.graphics.setColor(1,1,1)
end

function LS_func_3()
	love.graphics.print("Fore Ground",175,175)
	
	love.graphics.setColor(1,1,0)
	love.graphics.rectangle("fill",120,120,50,50)
	love.graphics.setColor(1,1,1)
end

function LoadScreen:Draw()
	LoadScreen.Window.back:put(LS_func_1)
	LoadScreen.Window.mid:put(LS_func_2)
	LoadScreen.Window.fore:put(LS_func_3)
	LoadScreen.Window:draw()
end

function LoadScreen:Update(dt)
	
end

function LoadScreen:Keypressed(key)
	
end