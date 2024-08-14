Bombs = {}
Bombs.Offset = 0.5

function Bombs.new(x,y)
	local o = Object.new(x,y,0,
		"bomb",
		"Bomb"
	)
	
	o.Act = Bombs.Act
	o.Draw = function(self)
		love.graphics.draw(
			files.assets.Textures.getImage(self.img),
			50 + ((self.x - (1 + Bombs.Offset)) * TileSize),
			50 + ((self.y - (1 + Bombs.Offset)) * TileSize)
		)
	end
	
	return o
end

Bombs.Act = function(self,pathTbl)
	--self.vars["cpath"] = pathTbl:GetClosest(self)
	self.vars.damage = 10
	self.vars.bonus = self.vars.damage * 5
	self.Act = function(self,objTbl)
		-- main loop
		self.vars.radius = Player.Tower_Radius
		self.vars.cooldown = secondsToTicks(Player.Tower_Timer)
		local o,d = objTbl:GetClosestId(self)
		if o and d and d < self.vars.radius then
			if self.t:get() >= self.vars.cooldown then
				o:Hit(self.vars.damage)
				AddCash(self.vars.bonus)
				self.t:set(0)
				if o.hp <= 0 then
					Player.Kills = Player.Kills + 1
				end
				
				-- create bullet object
				local v = {
					(o.x - self.x)/d,
					(o.y - self.y)/d
				}
				
				objTbl:InsertObj(Bullet.new(self.x,self.y,v,d))
			end
		end
		if self.t:get() < self.vars.cooldown then
			self.t()
		end
	end
end
