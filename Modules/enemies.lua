Enemies = {}

function Enemies.new(hp,ty,t)
	hp = hp or 100
	ty = ty or "Coconut"
	t = t or 0
	local o = Object.new(0,0,hp,ty,ty)
	if ty == "Victory" then
		o.img = 1
	end
	
	o.t:set(t)
	o.Act = function(self,Lvl)
		local of = self:Lerp(Lvl.Path)
		if self.t:get() > of then
			if not (self.id == "Victory") then
				Lvl.Damage = Lvl.Damage + self.hp
				self.hp = 0
			else
				Game.Over = true
				Game.Victory = true
				AddCash(2000)
			end
		end
	end
	
	return o
end