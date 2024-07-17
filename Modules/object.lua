Object = {}
Object.img = nil
Object.hp = 0
Object.x = 0
Object.y = 0
Object.t = ticker.new()
Object.id = "Type"
Object.vars = {}

function Object.new(x,y,hp,img,id)
	local tbl = {
		x = x or 0,
		y = y or 0,
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
		love.graphics.draw(
			files.assets.Textures.getImage(self.img),
			self.x,
			self.y
		)
	end
end

function Object:Lerp(PT)
	local c = PT:Lerp(self.t:get())
	self.x = c.x
	self.y = c.y
	self.t()
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

function ObjectTable:Insert(x,y,hp,img)
	table.insert(self.tbl,Object.new(x,y,hp,img))
end

function ObjectTable:Lerp(PT)
	for i,v in pairs(self.tbl) do
		self.tbl[i]:Lerp(PT)
	end
end

function ObjectTable:Clean(Id)
	Id = Id or "Coconut"
	for i,v in pairs(self.tbl) do
		if v.hp < 1 then
			self.tbl[i] = nil
		end
	end
end

function ObjectTable:GetClosest(Obj)
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