Bullet = {}
Bullet.MaxTime = 3

function Bullet.new(x,y,v,d)
	local o = Object.new(x,y,1,"bullet","bullet")
	
	o.Act = function(self)
		self.vars.origin = {self.x,self.y}
		self.vars.direction = v
		self.vars.distance = d
		
		self.Act = function(self)
			if self.t:get() < Bullet.MaxTime then
				local dt = (self.vars.distance * (self.t:get() / Bullet.MaxTime))
				self.x = self.vars.origin[1] + self.vars.direction[1] * dt
				self.y = self.vars.origin[2] + self.vars.direction[2] * dt
				self.t()
			else
				self.hp = 0
			end
		end
	end
	
	return o
end