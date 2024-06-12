-- Load Screen State

function LoadScreen:Load()
	LoadScreen.vars.img = files.assets.Textures.getImage("title")
	LoadScreen.vars.bgs = files.assets.Audio.getSound("title")
	LoadScreen.vars.ticker = files.ticker.new()
	LoadScreen.vars.backlist = {'d','e','n'}
	LoadScreen.vars.backlistn = math.random(1,#LoadScreen.vars.backlist)
	LoadScreen.vars.buttonColor = {1,1,1}
	LoadScreen.vars.buttonInside = false
	LoadScreen.vars.lx = 0
	LoadScreen.vars.ly = 0
	LoadScreen.vars.bx = 890
	LoadScreen.vars.ticker:reset()
	LoadScreen.vars.bgs:seek(0)
	LoadScreen.vars.bgs:play()
end

function LoadScreen:Draw()
	if Game.muted then
		LoadScreen.vars.bgs:pause()
	end
	LoadScreen.Window.back:put(function()
		love.graphics.draw(
			files.assets.Textures.getImage("back-"..LoadScreen.vars.backlist[LoadScreen.vars.backlistn])
		,0,0)
		love.graphics.draw(LoadScreen.vars.img,50,50)
		love.graphics.print({{1,1,1},"A Generic Tower Defence Game"},170,160)
		
		local t = LoadScreen.vars.ticker:get()
		love.graphics.print({{1,1,1},"Created By bIue9076r"},(-100*(1-(t/100))) + (400*(t/100)),200)
		
		love.graphics.setColor(
			LoadScreen.vars.buttonColor[1],
			LoadScreen.vars.buttonColor[2],
			LoadScreen.vars.buttonColor[3]
		)
		LoadScreen.vars.bx = (890*(1-(t/100))) + (240*(t/100))
		love.graphics.rectangle("fill",LoadScreen.vars.bx,285,200,45)
		love.graphics.setColor(1,1,1)
		love.graphics.print({{0,0,0},"Press Enter to continue"},(900*(1-(t/100))) + (250*(t/100)),300)
		if t < 100 then
			LoadScreen.vars.ticker()
		end
		love.graphics.setLineWidth(1)
	end)
	LoadScreen.Window:draw()
end

function LoadScreen:Update(dt)
	local x,y = love.mouse.getPosition()
	
	if not(LoadScreen.vars.ly == y) and not(LoadScreen.vars.lx == x) then
		if (x >= LoadScreen.vars.bx) and (x <= LoadScreen.vars.bx + 200) then
			if (y >= 285) and (y <= 330) then
				LoadScreen.vars.buttonInside = true
				LoadScreen.vars.buttonColor = {0.9,0.9,0.9}
			else
				LoadScreen.vars.buttonInside = false
				LoadScreen.vars.buttonColor = {1,1,1}
			end
		else
			LoadScreen.vars.buttonInside = false
			LoadScreen.vars.buttonColor = {1,1,1}
		end
	end
	
	if LoadScreen.vars.buttonInside and love.mouse.isDown(1) then
		LoadScreen.vars.bgs:pause()
		Game.State = HomeScreen
		Game.State:Load()
	end
	
	LoadScreen.vars.lx, LoadScreen.vars.ly = x, y
end

function LoadScreen:Keypressed(key)
	if key == "return" then
		LoadScreen.vars.bgs:pause()
		Game.State = HomeScreen
		Game.State:Load()
	elseif key == "p" then
		LoadScreen.vars.flag = true
	end
	
	if LoadScreen.vars.flag and key == "o" then
		LoadScreen.vars.bgs:pause()
		Game.State = State
	end
end