Enemies = {}

function Enemies.new(hp,t)
	hp = hp or 10
	t = t or "Coconut"
	local o = Object.new(0,0,hp,t,t)
	
	o.Act = function(self,Lvl)
		local of = self:Lerp(Lvl.Path)
		if self.t:get() > of then
			Lvl.Damage = Lvl.Damage + self.hp
			self.hp = 0
		end
	end
	
	return o
end