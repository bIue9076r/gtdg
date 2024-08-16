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
	self.hp = 1
	self.vars.damage = 200
	self.vars.bonus = math.ceil(self.vars.damage / 2)
	self.Act = function(self,objTbl)
		-- main loop
		self.vars.radius = Player.Bomb_Radius
		self.vars.cooldown = Player.Bomb_Fuse
		if self.t:get() < self.vars.cooldown then
			self.t()
		else
			local o = objTbl:GetClosestInRId(self,nil,self.vars.radius)
			if o then
				for i,v in pairs(o) do
					v[1]:Hit(math.ceil(self.vars.damage * ((self.vars.radius-(v[2]-2.5))/self.vars.radius)))
					AddCash(math.ceil(self.vars.bonus * (v[2]/self.vars.radius)))
					if v[1].hp <= 0 then
						Player.Kills = Player.Kills + 1
					end
				end
			end
			self.parent[self.index] = nil
		end
	end
end
