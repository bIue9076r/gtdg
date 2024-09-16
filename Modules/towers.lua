Towers = {}
Towers.Offset = 0.5

function Towers.new(x,y,t)
	local o = Object.new(x,y,0,
		"tower"..t,
		"Tower"..t
	)
	
	o.Act = Towers[t].Act
	o.Draw = function(self)
		love.graphics.draw(
			files.assets.Textures.getImage(self.img),
			50 + ((self.x - (1 + Towers.Offset)) * TileSize),
			50 + ((self.y - (1 + Towers.Offset)) * TileSize)
		)
	end
	
	return o
end

Towers[1] = Object.new(0,0,0,"tower1","Tower1") -- 
Towers[2] = Object.new(0,0,0,"tower2","Tower2") -- 
Towers[3] = Object.new(0,0,0,"tower3","Tower3") -- 
Towers[5] = Object.new(0,0,0,"tower2","Tower4") -- 

-- Multi towers need GetClosest + 2nd
--Towers[4] = Object.new(0,0,0,"tower4","Tower4") -- 
--Towers[5] = Object.new(0,0,0,"tower5","Tower5") -- 
--Towers[6] = Object.new(0,0,0,"tower6","Tower6") -- 
--Towers[7] = Object.new(0,0,0,"tower7","Tower7") -- 
--Towers[8] = Object.new(0,0,0,"tower8","Tower8") -- 
--Towers[9] = Object.new(0,0,0,"tower9","Tower9") -- 

Towers[1].Act = function(self,pathTbl)
	--self.vars["cpath"] = pathTbl:GetClosest(self)
	self.vars.damage = 10
	self.vars.bonus = self.vars.damage * 5
	self.Act = function(self,objTbl)
		-- main loop
		self.vars.radius = Player.Tower_Radius
		self.vars.cooldown = secondsToTicks(Player.Tower_Timer)
		if self.t:get() >= self.vars.cooldown then
			local o,d = objTbl:GetClosestId(self)
			if o and d and d < self.vars.radius then
				o:Hit(self.vars.damage)
				AddCash(self.vars.bonus)
				if o.hp <= 0 then
					Player.Kills = Player.Kills + 1
				end
				
				-- create bullet object
				local v = {
					(o.x - self.x)/d,
					(o.y - self.y)/d
				}
				
				objTbl:InsertObj(Bullet.new(self.x,self.y,v,d))
				self.t:set(0)
			end
		end
		if self.t:get() < self.vars.cooldown then
			self.t()
		end
	end
end

Towers[2].Act = function(self,pathTbl)
	--self.vars["cpath"] = pathTbl:GetClosest(self)
	self.vars.damage = 30
	self.vars.bonus = self.vars.damage * 5
	self.Act = function(self,objTbl)
		-- main loop
		self.vars.radius = Player.Tower_Radius
		self.vars.cooldown = secondsToTicks(Player.Tower_Timer)
		if self.t:get() >= self.vars.cooldown then
			local o,d = objTbl:GetClosestId(self)
			if o and d and d < self.vars.radius then
				o:Hit(self.vars.damage)
				AddCash(self.vars.bonus)
				if o.hp <= 0 then
					Player.Kills = Player.Kills + 1
				end
				
				-- create bullet object
				local v = {
					(o.x - self.x)/d,
					(o.y - self.y)/d
				}
				
				objTbl:InsertObj(Bullet.new(self.x,self.y,v,d))
				self.t:set(0)
			end
		end
		if self.t:get() < self.vars.cooldown then
			self.t()
		end
	end
end

Towers[3].Act = function(self,pathTbl)
	--self.vars["cpath"] = pathTbl:GetClosest(self)
	self.vars.damage = 100
	self.vars.bonus = self.vars.damage * 5
	self.Act = function(self,objTbl)
		-- main loop
		self.vars.radius = Player.Tower_Radius
		self.vars.cooldown = secondsToTicks(Player.Tower_Timer)
		if self.t:get() >= self.vars.cooldown then
			local o,d = objTbl:GetClosestId(self)
			if o and d and d < self.vars.radius then
				o:Hit(self.vars.damage)
				AddCash(self.vars.bonus)
				if o.hp <= 0 then
					Player.Kills = Player.Kills + 1
				end
				
				-- create bullet object
				local v = {
					(o.x - self.x)/d,
					(o.y - self.y)/d
				}
				
				objTbl:InsertObj(Bullet.new(self.x,self.y,v,d))
				self.t:set(0)
			end
		end
		if self.t:get() < self.vars.cooldown then
			self.t()
		end
	end
end

Towers[5].Act = function(self,pathTbl)
	--self.vars["cpath"] = pathTbl:GetClosest(self)
	self.vars.damage = 30
	self.vars.bonus = self.vars.damage * 5
	self.Act = function(self,objTbl)
		-- main loop
		self.vars.radius = Player.Tower_Radius
		self.vars.cooldown = secondsToTicks(Player.Tower_Timer)
		self.vars.multi = Player.Multi_Tower
		if self.t:get() >= self.vars.cooldown then
			local o = objTbl:GetClosestInRId(self,nil,self.vars.radius)
			if o then
				local s = sortTbl(o)
				if s then
					for i = 1,self.vars.multi do
						if s[i] then
							s[i][1]:Hit(self.vars.damage)
							AddCash(self.vars.bonus)
							if s[i][1].hp <= 0 then
								Player.Kills = Player.Kills + 1
							end
							
							-- create bullet object
							local v = {
								(s[i][1].x - self.x)/s[i][2],
								(s[i][1].y - self.y)/s[i][2]
							}
							
							objTbl:InsertObj(Bullet.new(self.x,self.y,v,s[i][2]))
							self.t:set(0)
						end
					end
				end
			end
		end
		if self.t:get() < self.vars.cooldown then
			self.t()
		end
	end
end

--[[
Towers[5].Act = function(self,pathTbl)
	
	self.Act = function(self)
		-- main loop
		print("loop")
	end
end

Towers[6].Act = function(self,pathTbl)
	
	self.Act = function(self)
		-- main loop
		print("loop")
	end
end

Towers[7].Act = function(self,pathTbl)
	
	self.Act = function(self)
		-- main loop
		print("loop")
	end
end

Towers[8].Act = function(self,pathTbl)
	
	self.Act = function(self)
		-- main loop
		print("loop")
	end
end

Towers[9].Act = function(self,pathTbl)
	
	self.Act = function(self)
		-- main loop
		print("loop")
	end
end
]]
