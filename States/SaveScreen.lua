-- Save Screen State

function SaveScreen:Load()
	SaveScreen.vars.Saves = {
		"Save Slot #1",
		"Save Slot #2",
		"Save Slot #3",
		"Save Slot #4",
		"Save Slot #5",
	}
	
	SaveScreen.vars.SaveImg = ""
	SaveScreen.vars.SaveStr1 = ""
	SaveScreen.vars.SaveStr2 = sticker.new("")
	SaveScreen.vars.SaveStr3 = sticker.new("")
	SaveScreen.vars.SaveStr4 = sticker.new("")
	SaveScreen.vars.SaveStr5 = sticker.new("")
	SaveScreen.vars.SaveStr6 = sticker.new("")
	
	SaveScreen.vars.SaveFuncs = {}
	SaveScreen.vars.SaveFuncs[1] = function()
		SaveScreen.vars.SaveImg = ""
		SaveScreen.vars.SaveStr1 = SaveScreen.vars.Saves[1]..":"
		SaveScreen.vars.SaveStr2 = sticker.new("description")
		SaveScreen.vars.SaveStr3 = sticker.new("description")
		SaveScreen.vars.SaveStr4 = sticker.new("description")
		SaveScreen.vars.SaveStr5 = sticker.new("description")
		SaveScreen.vars.SaveStr6 = sticker.new("description")
	end
	
	SaveScreen.vars.SaveFuncs[2] = function()
		SaveScreen.vars.SaveImg = ""
		SaveScreen.vars.SaveStr1 = SaveScreen.vars.Saves[2]..":"
		SaveScreen.vars.SaveStr2 = sticker.new("description")
		SaveScreen.vars.SaveStr3 = sticker.new("description")
		SaveScreen.vars.SaveStr4 = sticker.new("description")
		SaveScreen.vars.SaveStr5 = sticker.new("description")
		SaveScreen.vars.SaveStr6 = sticker.new("description")
	end
	
	SaveScreen.vars.SaveFuncs[3] = function()
		SaveScreen.vars.SaveImg = ""
		SaveScreen.vars.SaveStr1 = SaveScreen.vars.Saves[3]..":"
		SaveScreen.vars.SaveStr2 = sticker.new("description")
		SaveScreen.vars.SaveStr3 = sticker.new("description")
		SaveScreen.vars.SaveStr4 = sticker.new("description")
		SaveScreen.vars.SaveStr5 = sticker.new("description")
		SaveScreen.vars.SaveStr6 = sticker.new("description")
	end
	
	SaveScreen.vars.SaveFuncs[4] = function()
		SaveScreen.vars.SaveImg = ""
		SaveScreen.vars.SaveStr1 = SaveScreen.vars.Saves[4]..":"
		SaveScreen.vars.SaveStr2 = sticker.new("description")
		SaveScreen.vars.SaveStr3 = sticker.new("description")
		SaveScreen.vars.SaveStr4 = sticker.new("description")
		SaveScreen.vars.SaveStr5 = sticker.new("description")
		SaveScreen.vars.SaveStr6 = sticker.new("description")
	end
	
	SaveScreen.vars.SaveFuncs[5] = function()
		SaveScreen.vars.SaveImg = ""
		SaveScreen.vars.SaveStr1 = SaveScreen.vars.Saves[5]..":"
		SaveScreen.vars.SaveStr2 = sticker.new("description")
		SaveScreen.vars.SaveStr3 = sticker.new("description")
		SaveScreen.vars.SaveStr4 = sticker.new("description")
		SaveScreen.vars.SaveStr5 = sticker.new("description")
		SaveScreen.vars.SaveStr6 = sticker.new("description")
	end
	
	SaveScreen.vars.Pick = false
	SaveScreen.vars.Select = 1
	SaveScreen.vars.SelectLast = 0
	SaveScreen.vars.Inside = false
	SaveScreen.vars.lx = 0
	SaveScreen.vars.ly = 0
	SaveScreen.vars.TimeOut = false
	SaveScreen.vars.TimeOutStr = ""
	SaveScreen.vars.TimeOutTicker = ticker.new()
	
	SaveScreen.vars.Bsound = files.assets.Audio.getSound("save")
	SaveScreen.Window:draw() -- should be a clear
end

function SaveScreen:Draw()
	SaveScreen.Window.back:put(function()
		love.graphics.draw(
			files.assets.Textures.getImage("back-d")
		,0,0)
		
		love.graphics.setLineWidth(10)
		love.graphics.rectangle("fill",5,5,240,590)
		love.graphics.setColor(0,0,0)
		love.graphics.rectangle("line",5,5,240,590)
		love.graphics.setColor(1,1,1)
		
		for i = 1,#SaveScreen.vars.Saves do
			love.graphics.print({{0,0,0},SaveScreen.vars.Saves[i]},25,50+(100*(i-1)))
		end
		
		love.graphics.setColor(1,0,0)
		love.graphics.rectangle("line",15,15+(100*(SaveScreen.vars.Select-1)),220,85)
		love.graphics.setColor(1,1,1)
		
		love.graphics.rectangle("fill",285,405,490,140)
		love.graphics.setColor(0,0,0)
		love.graphics.rectangle("line",285,405,490,140)
		love.graphics.setColor(1,1,1)
		
		love.graphics.print({{0,0,0},"Save Controls:"},300,420)
		love.graphics.print({{0,0,0},"Return: [b]  Save: [k]  Load: [l]"},300,440)
		
		love.graphics.print({{0,0,0},"Stats:"},300,480)
		love.graphics.print({{0,0,0},"Money: $"..tostring(Player.Money)},300,500)
	end)
	
	SaveScreen.Window.mid:put(function()
		if SaveScreen.vars.Pick then
			love.graphics.rectangle("fill",285,55,490,290)
			love.graphics.setColor(0,0,0)
			love.graphics.rectangle("line",285,55,490,290)
			love.graphics.setColor(1,1,1)
			
			--love.graphics.setColor(1,0,1)
			--love.graphics.rectangle("fill",300,70,190,190)
			--love.graphics.setColor(1,1,1)
			love.graphics.draw(
				files.assets.Textures.getImage("ye".."sav")
			,300,70)
			
			love.graphics.print({{0,0,0},SaveScreen.vars.SaveStr1},510,80)
			love.graphics.print({{0,0,0},SaveScreen.vars.SaveStr2()},510,120)
			love.graphics.print({{0,0,0},SaveScreen.vars.SaveStr3()},510,140)
			
			love.graphics.print({{0,0,0},SaveScreen.vars.SaveStr4()},510,180)
			love.graphics.print({{0,0,0},SaveScreen.vars.SaveStr5()},510,200)
			
			love.graphics.print({{0,0,0},SaveScreen.vars.SaveStr6()},300,280)
		end
	end)
	
	SaveScreen.Window.fore:put(function()
		if SaveScreen.vars.TimeOut then
			love.graphics.rectangle("fill",285,405,490,140)
			love.graphics.setColor(0,0,0)
			love.graphics.rectangle("line",285,405,490,140)
			love.graphics.setColor(1,1,1)
			
			love.graphics.print({{0,0,0},"Game "..SaveScreen.vars.TimeOutStr.."!"},
				files.assets.Fonts.getFont("hex-sans-serif-26")
			,300,430)
			
			if SaveScreen.vars.TimeOutTicker:get() < 50 then
				SaveScreen.vars.TimeOutTicker()
			else
				SaveScreen.vars.TimeOut = false
			end
		end
		love.graphics.setLineWidth(1)
	end)
	
	if not Game.muted then
		SaveScreen.vars.Bsound:play()
	else
		SaveScreen.vars.Bsound:pause()
	end
	SaveScreen.Window:draw()
end

function SaveScreen:Update(dt)
	local x,y = love.mouse.getPosition()
	
	if not(SaveScreen.vars.ly == y) and not(SaveScreen.vars.lx == x) then
		if (x >= 15) and (x <= 235) then
			if (y >= 15) and (y <= 500) then
				SaveScreen.vars.Select = math.max(1,math.min(5,math.floor(((y-15)/(485))*5)+1))
				if not (SaveScreen.vars.SelectLast == SaveScreen.vars.Select) then
					SaveScreen.vars.SaveFuncs[SaveScreen.vars.Select]()
				end
				SaveScreen.vars.Inside = true
			else
				SaveScreen.vars.Inside = false
			end
		else
			SaveScreen.vars.Inside = false
		end
	end
	
	if SaveScreen.vars.Inside and love.mouse.isDown(1) then
		SaveScreen.vars.Pick = true
	end
	
	if love.mouse.isDown(2) and SaveScreen.vars.Pick then
		SaveScreen.vars.Pick = false
	end
	
	SaveScreen.vars.lx, SaveScreen.vars.ly = x, y
	SaveScreen.vars.SelectLast = SaveScreen.vars.Select
end

function SaveScreen:Keypressed(key)
	if isKeyUp(key) then
		if SaveScreen.vars.Select - 1 >= 1 then
			SaveScreen.vars.Select = SaveScreen.vars.Select - 1
		else
			SaveScreen.vars.Select = #SaveScreen.vars.Saves
		end
		if not (SaveScreen.vars.SelectLast == SaveScreen.vars.Select) then
			SaveScreen.vars.SaveFuncs[SaveScreen.vars.Select]()
		end
		SaveScreen.vars.SelectLast = SaveScreen.vars.Select
	elseif isKeyDown(key) then
		if SaveScreen.vars.Select + 1 <= #SaveScreen.vars.Saves then
			SaveScreen.vars.Select = SaveScreen.vars.Select + 1
		else
			SaveScreen.vars.Select = 1
		end
		if not (SaveScreen.vars.SelectLast == SaveScreen.vars.Select) then
			SaveScreen.vars.SaveFuncs[SaveScreen.vars.Select]()
		end
		SaveScreen.vars.SelectLast = SaveScreen.vars.Select
	elseif key == "return" then
		if not SaveScreen.vars.Pick then
			if not (SaveScreen.vars.SelectLast == 0) then
				SaveScreen.vars.SaveFuncs[SaveScreen.vars.Select]()
			end
			SaveScreen.vars.Pick = true
		end
	elseif iskeyBack(key) then
		if SaveScreen.vars.Pick then
			SaveScreen.vars.Pick = false
		else
			SaveScreen.vars.Bsound:seek(0)
			SaveScreen.vars.Bsound:pause()
			Game.State = MenuScreen
			Game.State:Load()
		end
	elseif (not SaveScreen.vars.TimeOut) and SaveScreen.vars.Pick and key == "k" then
		SaveScreen.vars.Save = File.new("/Saves/SaveSlot_"..SaveScreen.vars.Select..".sav")
		saveGame(SaveScreen.vars.Save)
		SaveScreen.vars.TimeOut = true
		SaveScreen.vars.TimeOutStr = "Saved"
		SaveScreen.vars.TimeOutTicker:reset()
	elseif (not SaveScreen.vars.TimeOut) and SaveScreen.vars.Pick and key == "l" then
		SaveScreen.vars.Save = File.new("/Saves/SaveSlot_"..SaveScreen.vars.Select..".sav")
		loadGame(SaveScreen.vars.Save)
		SaveScreen.vars.TimeOut = true
		SaveScreen.vars.TimeOutStr = "Loaded"
		SaveScreen.vars.TimeOutTicker:reset()
	end
end