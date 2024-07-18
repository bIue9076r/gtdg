Towers = {}
Towers.Offset = 0.5

function Towers.new(x,y,t)
	local o = Object.new(x,y,0,
		"tower"..t,
		"Tower"..t
	)
	
	o.Act = Towers[t].Act
	return o
end

Towers[1] = Object.new(0,0,0,"tower1","Tower1") -- 
Towers[2] = Object.new(0,0,0,"tower2","Tower2") -- 
Towers[3] = Object.new(0,0,0,"tower3","Tower3") -- 

-- Multi towers need GetClosest + 2nd
--Towers[4] = Object.new(0,0,0,"tower4","Tower4") -- 
--Towers[5] = Object.new(0,0,0,"tower5","Tower5") -- 
--Towers[6] = Object.new(0,0,0,"tower6","Tower6") -- 
--Towers[7] = Object.new(0,0,0,"tower7","Tower7") -- 
--Towers[8] = Object.new(0,0,0,"tower8","Tower8") -- 
--Towers[9] = Object.new(0,0,0,"tower9","Tower9") -- 

Towers[1].Act = function(self,pathTbl)
	self.vars["cpath"] = pathTbl:GetClosest(self)
	self.vars.radius = 6
	self.vars.damage = 10
	self.vars.cooldown = 500
	self.Act = function(self,objTbl)
		-- main loop
		local o,d = objTbl:GetClosest(self)
		if o and d and d < self.vars.radius then
			if self.t:get() >= self.vars.cooldown then
				print("Object Hit", d)
				o:Hit(self.vars.damage)
				self.t:set(0)
			end
			self.t()
		else
			-- Reset if no objects in radius
			self.t:set(0)
		end
	end
end

Towers[2].Act = function(self,pathTbl)
	
	self.Act = function(self)
		-- main loop
		print("loop")
	end
end

Towers[3].Act = function(self,pathTbl)
	
	self.Act = function(self)
		-- main loop
		print("loop")
	end
end

--[[
Towers[4].Act = function(self,pathTbl)
	
	self.Act = function(self)
		-- main loop
		print("loop")
	end
end

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