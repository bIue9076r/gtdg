-- Load Screen State
LoadScreen.vars.img = files.assets.Textures.getImage("title")
LoadScreen.vars.bgs = files.assets.Audio.getSound("title")
LoadScreen.vars.ticker = files.ticker.new()
LoadScreen.vars.backlist = {'d','e','n'}
LoadScreen.vars.backlistn = 1

function LoadScreen.vars.back_1()
	love.graphics.draw(
		files.assets.Textures.getImage("back-"..LoadScreen.vars.backlist[LoadScreen.vars.backlistn])
	,0,0)
	love.graphics.draw(LoadScreen.vars.img,50,50)
	love.graphics.print("A Generic Tower Defence Game",170,160)
	
	local t = LoadScreen.vars.ticker:get()
	love.graphics.print("Created By bIue9076r",(-100*(1-(t/100))) + (200*(t/100)),200)
	love.graphics.print("Press Enter to continue",(900*(1-(t/100))) + (250*(t/100)),300)
	if t <= 100 then
		LoadScreen.vars.ticker()
	end
end

function LoadScreen:Load()
	LoadScreen.vars.img = files.assets.Textures.getImage("title")
	LoadScreen.vars.bgs = files.assets.Audio.getSound("title")
	LoadScreen.vars.ticker = files.ticker.new()
	LoadScreen.vars.backlist = {'d','e','n'}
	LoadScreen.vars.backlistn = 1
	
	function LoadScreen.vars.back_1()
		love.graphics.draw(
			files.assets.Textures.getImage("back-"..LoadScreen.vars.backlist[LoadScreen.vars.backlistn])
		,0,0)
		love.graphics.draw(LoadScreen.vars.img,50,50)
		love.graphics.print("A Generic Tower Defence Game",170,160)
		
		local t = LoadScreen.vars.ticker:get()
		love.graphics.print("Created By bIue9076r",(-100*(1-(t/100))) + (200*(t/100)),200)
		love.graphics.print("Press Enter to continue",(900*(1-(t/100))) + (250*(t/100)),300)
		if t <= 100 then
			LoadScreen.vars.ticker()
		end
	end
	LoadScreen.vars.backlistn = math.random(1,#LoadScreen.vars.backlist)
	LoadScreen.vars.ticker:reset()
	LoadScreen.vars.bgs:seek(0)
	LoadScreen.vars.bgs:play()
end

function LoadScreen:Draw()
	if Game.muted then
		LoadScreen.vars.bgs:pause()
	end
	LoadScreen.Window.back:put(LoadScreen.vars.back_1)
	LoadScreen.Window:draw()
end

function LoadScreen:Update(dt)
	
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