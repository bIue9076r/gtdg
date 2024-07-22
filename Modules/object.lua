Object = {}
Object.img = nil
Object.hp = 0
Object.x = 0
Object.y = 0
Object.s = 0
Object.c = {
	r = 0,
	g = 0,
	b = 0,
}
Object.t = ticker.new()
Object.id = "Type"
Object.vars = {}

function Object.new(x,y,hp,img,id)
	local tbl = {
		x = x or 0,
		y = y or 0,
		s = TileSize,
		c = {r=0,g=0,b=0},
		hp = hp or 0,
		img = img or "",
		id = tostring(id) or "Object",
		t = ticker.new(),
		vars = {},
	}
	
	local mt = {
		__index = Object,
		__call = Object.Draw
	}
	
	return setmetatable(tbl,mt)
end

function Object:Hit(d)
	self.hp = math.max(0,self.hp - d)
end

function Object:Act()
	
end

function Object:Draw()
	if self.hp > 0 then
		if not (self.img == "") then
			love.graphics.draw(
				files.assets.Textures.getImage(self.img),
				(self.x + 1)*TileSize,
				(self.y + 1)*TileSize
			)
		else
			local c = 1 * (self.hp/100)
			self.c = {r=c,g=c,b=c}
			love.graphics.setColor(self.c.r,self.c.g,self.c.b)
			love.graphics.rectangle("fill",
				(self.x + 1)*TileSize,
				(self.y + 1)*TileSize,
				self.s,self.s
			)
			love.graphics.setColor(1,1,1)
		end
	end
end

function Object:Lerp(PT)
	local c, o = PT:Lerp(self.t:get())
	self.x = c.x
	self.y = c.y
	self.t()
	return o
end


ObjectTable = {}
ObjectTable.tbl = {}

function ObjectTable.new()
	local tbl = {
		tbl = {}
	}
	
	local mt = {
		__index = ObjectTable
	}
	
	return setmetatable(tbl,mt)
end

function ObjectTable:Insert(x,y,hp,img,id)
	table.insert(self.tbl,Object.new(x,y,hp,img,id))
end

function ObjectTable:InsertObj(obj)
	table.insert(self.tbl,obj)
end

function ObjectTable:Draw(Id)
	Id = Id or "Coconut"
	for i,v in pairs(self.tbl) do
		if v.id == Id then
			self.tbl[i]:Draw()
		end
	end
end

function ObjectTable:DrawAll()
	for i,v in pairs(self.tbl) do
		self.tbl[i]:Draw()
	end
end

--[[
function ObjectTable:Lerp(PT,Id)
	Id = Id or "Coconut"
	for i,v in pairs(self.tbl) do
		if v.id == Id then
			self.tbl[i]:Lerp(PT)
		end
	end
end

function ObjectTable:LerpAll(PT)
	for i,v in pairs(self.tbl) do
		self.tbl[i]:Lerp(PT)
	end
end
]]

function ObjectTable:Clean(Id)
	Id = Id or "Coconut"
	for i,v in pairs(self.tbl) do
		if v.hp < 1 and v.id == Id then
			self.tbl[i] = nil
		end
	end
end

function ObjectTable:CleanAll()
	for i,v in pairs(self.tbl) do
		if v.hp < 1 then
			self.tbl[i] = nil
		end
	end
end

function ObjectTable:Act(Id,Arg1)
	Id = Id or "bullet"
	for i,v in pairs(self.tbl) do
		if v.id == Id then
			self.tbl[i]:Act(Arg1)
		end
	end
end

function ObjectTable:ActAll(Arg1)
	for i,v in pairs(self.tbl) do
		self.tbl[i]:Act(Arg1)
	end
end

function ObjectTable:GetClosestAny(Obj)
	local closest = 0
	local sd = nil
	local sx = Obj.x
	local sy = Obj.y
	
	for i,v in pairs(self.tbl) do
		if v.hp > 0 then
			local d = math.sqrt(
				(v.x - sx)*(v.x - sx) + (v.y - sy)*(v.y - sy)
			)
			
			if not sd then
				sd = d
				closest = i
			end
			
			if d < sd then
				sd = d
				closest = i
			end
		end
	end
	
	return self.tbl[closest], sd
end

function ObjectTable:GetClosestId(Obj,id)
	id = id or "Coconut"
	local closest = 0
	local sd = nil
	local sx = Obj.x
	local sy = Obj.y
	
	for i,v in pairs(self.tbl) do
		if v.hp > 0 and v.id == id then
			local d = math.sqrt(
				(v.x - sx)*(v.x - sx) + (v.y - sy)*(v.y - sy)
			)
			
			if not sd then
				sd = d
				closest = i
			end
			
			if d < sd then
				sd = d
				closest = i
			end
		end
	end
	
	return self.tbl[closest], sd
end