-- Shop Screen State

function ShopScreen:Load()
	ShopScreen.vars.Items = {
		"Tower Speed",
		"Tower Damage",
		"Bomb Fuse",
		"Bomb Damage",
		"Multi Bullet",
	}
	
	ShopScreen.vars.ItemImg = ""
	ShopScreen.vars.ItemStr1 = ""
	ShopScreen.vars.ItemStr2 = sticker.new("")
	ShopScreen.vars.ItemStr3 = sticker.new("")
	ShopScreen.vars.ItemStr4 = sticker.new("")
	ShopScreen.vars.ItemStr5 = sticker.new("")
	ShopScreen.vars.ItemStr6 = sticker.new("")
	
	ShopScreen.vars.ItemFuncs = {}
	ShopScreen.vars.ItemFuncs[1] = function()
		ShopScreen.vars.ItemImg = ""
		ShopScreen.vars.ItemStr1 = ShopScreen.vars.Items[1]..": Costs $"..(Player.Tower_Speed_Base_Cost + ((Player.Tower_Speed_Level - 1) * Player.Tower_Speed_Upgrade_Cost))
		ShopScreen.vars.ItemStr2 = sticker.new("Increases tower speed.")
		ShopScreen.vars.ItemStr3 = sticker.new("")
		ShopScreen.vars.ItemStr4 = sticker.new("Current Speed: "..(Player.Tower_Speed))
		ShopScreen.vars.ItemStr5 = sticker.new("New Speed: "..(Player.Tower_Speed + Player.Tower_Speed_Upgrade))
		ShopScreen.vars.ItemStr6 = sticker.new("")
	end
	
	ShopScreen.vars.ItemFuncs[2] = function()
		ShopScreen.vars.ItemImg = ""
		ShopScreen.vars.ItemStr1 = ShopScreen.vars.Items[2]..": Costs $"..(Player.Tower_Damage_Base_Cost + ((Player.Tower_Damage_Level - 1) * Player.Tower_Damage_Upgrade_Cost))
		ShopScreen.vars.ItemStr2 = sticker.new("Increases tower damage.")
		ShopScreen.vars.ItemStr3 = sticker.new("")
		ShopScreen.vars.ItemStr4 = sticker.new("Current damage: "..(Player.Tower_Damage))
		ShopScreen.vars.ItemStr5 = sticker.new("New damage: "..(Player.Tower_Damage + Player.Tower_Damage_Upgrade))
		ShopScreen.vars.ItemStr6 = sticker.new("")
	end
	
	ShopScreen.vars.ItemFuncs[3] = function()
		ShopScreen.vars.ItemImg = ""
		ShopScreen.vars.ItemStr1 = ShopScreen.vars.Items[3]..": Costs $"..(Player.Bomb_Fuse_Base_Cost + ((Player.Bomb_Fuse_Level - 1) * Player.Bomb_Fuse_Upgrade_Cost))
		ShopScreen.vars.ItemStr2 = sticker.new("Decreases bomb fuse.")
		ShopScreen.vars.ItemStr3 = sticker.new("")
		if Player.Bomb_Fuse_Level <= 8 then
			ShopScreen.vars.ItemStr4 = sticker.new("Current fuse: "..(Player.Bomb_Fuse))
			ShopScreen.vars.ItemStr5 = sticker.new("New fuse: "..(Player.Bomb_Fuse + Player.Bomb_Fuse_Upgrade))
		else
			ShopScreen.vars.ItemStr4 = sticker.new("Unavaliable")
			ShopScreen.vars.ItemStr5 = sticker.new("")
		end
		ShopScreen.vars.ItemStr6 = sticker.new("")
	end
	
	ShopScreen.vars.ItemFuncs[4] = function()
		ShopScreen.vars.ItemImg = ""
		ShopScreen.vars.ItemStr1 = ShopScreen.vars.Items[4]..": Costs $"..(Player.Bomb_Damage_Base_Cost + ((Player.Bomb_Damage_Level - 1) * Player.Bomb_Damage_Upgrade_Cost))
		ShopScreen.vars.ItemStr2 = sticker.new("Increases bomb damage.")
		ShopScreen.vars.ItemStr3 = sticker.new("")
		ShopScreen.vars.ItemStr4 = sticker.new("Current damage: "..(Player.Bomb_Damage))
		ShopScreen.vars.ItemStr5 = sticker.new("New damage: "..(Player.Bomb_Damage + Player.Bomb_Damage_Upgrade))
		ShopScreen.vars.ItemStr6 = sticker.new("")
	end
	
	ShopScreen.vars.ItemFuncs[5] = function()
		ShopScreen.vars.ItemImg = ""
		ShopScreen.vars.ItemStr1 = ShopScreen.vars.Items[5]..": Costs $"..(Player.Multi_Tower_Base_Cost + ((Player.Multi_Tower_Level - 1) * Player.Multi_Tower_Upgrade_Cost))
		ShopScreen.vars.ItemStr2 = sticker.new("Increases number bullets in")
		ShopScreen.vars.ItemStr3 = sticker.new("multi tower.")
		ShopScreen.vars.ItemStr4 = sticker.new("Current number: "..(Player.Multi_Tower))
		ShopScreen.vars.ItemStr5 = sticker.new("New number: "..(Player.Multi_Tower + Player.Multi_Tower_Upgrade))
		ShopScreen.vars.ItemStr6 = sticker.new("")
	end
	
	ShopScreen.vars.Pick = false
	ShopScreen.vars.Select = 1
	ShopScreen.vars.SelectLast = 0
	ShopScreen.vars.Inside = false
	ShopScreen.vars.lx = 0
	ShopScreen.vars.ly = 0
	
	ShopScreen.vars.Bsound = files.assets.Audio.getSound("shop")
	ShopScreen.Window:draw() -- should be a clear
end

function ShopScreen:Draw()
	ShopScreen.Window.back:put(function()
		love.graphics.draw(
			files.assets.Textures.getImage("back-d")
		,0,0)
		
		love.graphics.setLineWidth(10)
		love.graphics.rectangle("fill",5,5,240,590)
		love.graphics.setColor(0,0,0)
		love.graphics.rectangle("line",5,5,240,590)
		love.graphics.setColor(1,1,1)
		
		for i = 1,#ShopScreen.vars.Items do
			love.graphics.print({{0,0,0},ShopScreen.vars.Items[i]},25,50+(100*(i-1)))
		end
		
		love.graphics.setColor(1,0,0)
		love.graphics.rectangle("line",15,15+(100*(ShopScreen.vars.Select-1)),220,85)
		love.graphics.setColor(1,1,1)
		
		love.graphics.rectangle("fill",285,405,490,140)
		love.graphics.setColor(0,0,0)
		love.graphics.rectangle("line",285,405,490,140)
		love.graphics.setColor(1,1,1)
		
		love.graphics.print({{0,0,0},"Shop Controls:"},300,420)
		love.graphics.print({{0,0,0},"Return: [b]"},300,440)
		
		love.graphics.print({{0,0,0},"Stats:"},300,480)
		love.graphics.print({{0,0,0},"Money: $"..tostring(Player.Money)},300,500)
	end)
	
	ShopScreen.Window.mid:put(function()
		if ShopScreen.vars.Pick then
			love.graphics.rectangle("fill",285,55,490,290)
			love.graphics.setColor(0,0,0)
			love.graphics.rectangle("line",285,55,490,290)
			love.graphics.setColor(1,1,1)
			
			love.graphics.setColor(1,0,1)
			love.graphics.rectangle("fill",300,70,190,190)
			love.graphics.setColor(1,1,1)
			
			love.graphics.print({{0,0,0},ShopScreen.vars.ItemStr1},510,80)
			love.graphics.print({{0,0,0},ShopScreen.vars.ItemStr2()},510,120)
			love.graphics.print({{0,0,0},ShopScreen.vars.ItemStr3()},510,140)
			
			love.graphics.print({{0,0,0},ShopScreen.vars.ItemStr4()},510,180)
			love.graphics.print({{0,0,0},ShopScreen.vars.ItemStr5()},510,200)
			
			love.graphics.print({{0,0,0},ShopScreen.vars.ItemStr6()},300,280)
		end
	end)
	
	ShopScreen.Window.fore:put(function()
		love.graphics.setLineWidth(1)
	end)
	
	if not Game.muted then
		ShopScreen.vars.Bsound:play()
	else
		ShopScreen.vars.Bsound:pause()
	end
	ShopScreen.Window:draw()
end

function ShopScreen:Update(dt)
	local x,y = love.mouse.getPosition()
	
	if not(ShopScreen.vars.ly == y) and not(ShopScreen.vars.lx == x) then
		if (x >= 15) and (x <= 235) then
			if (y >= 15) and (y <= 500) then
				ShopScreen.vars.Select = math.max(1,math.min(5,math.floor(((y-15)/(485))*5)+1))
				if not (ShopScreen.vars.SelectLast == ShopScreen.vars.Select) then
					ShopScreen.vars.ItemFuncs[ShopScreen.vars.Select]()
				end
				ShopScreen.vars.Inside = true
			else
				ShopScreen.vars.Inside = false
			end
		else
			ShopScreen.vars.Inside = false
		end
	end
	
	if ShopScreen.vars.Inside and love.mouse.isDown(1) then
		ShopScreen.vars.Pick = true
		--playSFX("item_selected")
	end
	
	if love.mouse.isDown(2) and ShopScreen.vars.Pick then
		ShopScreen.vars.Pick = false
		--playSFX("item_deselected")
	end
	
	ShopScreen.vars.lx, ShopScreen.vars.ly = x, y
	ShopScreen.vars.SelectLast = ShopScreen.vars.Select
end

function ShopScreen:Keypressed(key)
	if isKeyUp(key) then
		if ShopScreen.vars.Select - 1 >= 1 then
			ShopScreen.vars.Select = ShopScreen.vars.Select - 1
		else
			ShopScreen.vars.Select = #ShopScreen.vars.Items
		end
		if not (ShopScreen.vars.SelectLast == ShopScreen.vars.Select) then
			ShopScreen.vars.ItemFuncs[ShopScreen.vars.Select]()
		end
		ShopScreen.vars.SelectLast = ShopScreen.vars.Select
		playSFX("option_moved")
	elseif isKeyDown(key) then
		if ShopScreen.vars.Select + 1 <= #ShopScreen.vars.Items then
			ShopScreen.vars.Select = ShopScreen.vars.Select + 1
		else
			ShopScreen.vars.Select = 1
		end
		if not (ShopScreen.vars.SelectLast == ShopScreen.vars.Select) then
			ShopScreen.vars.ItemFuncs[ShopScreen.vars.Select]()
		end
		ShopScreen.vars.SelectLast = ShopScreen.vars.Select
		playSFX("option_moved")
	elseif key == "return" then
		if ShopScreen.vars.Pick then
			playSFX("item_bought")
		else
			if not (ShopScreen.vars.SelectLast == 0) then
				ShopScreen.vars.ItemFuncs[ShopScreen.vars.Select]()
			end
			ShopScreen.vars.Pick = true
			playSFX("item_selected")
		end
	elseif iskeyBack(key) then
		if ShopScreen.vars.Pick then
			ShopScreen.vars.Pick = false
			playSFX("item_deselected")
		else
			ShopScreen.vars.Bsound:seek(0)
			ShopScreen.vars.Bsound:pause()
			Game.State = HomeScreen
			Game.State:Load()
		end
	end
end