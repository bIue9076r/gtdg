Bullet = {}
Bullet.MaxTime = 50

function Bullet.new(x,y,v,d)
	local o = Object.new(x,y,1,"bullet","bullet")
	
	o.Act = function(self)
		self.vars.direction = v
		self.vars.distance = d
		
		self.Act = function(self)
			if self.t:get() <= Bullet.MaxTime then
				local dt = (self.vars.distance * (self.t / Bullet.MaxTime))
				self.x = self.x + self.vars.direction[1] * dt
				self.y = self.y + self.vars.direction[2] * dt
				self.t()
			else
				self.hp = 0
			end
		end
	end
	
	return o
end