Tile = {}

function Tile.new(p,o,t)
	local tbl = {
		path = p or false,
		obj = o or 0,
		tower = t or nil,
	}
	
	return tbl
end

TileTable = {}
TileTable.x = 0
TileTable.y = 0
TileTable.tbl = {}

function TileTable.new(lx,ly)
	local tbl = {
		x = lx or 0,
		y = ly or 0,
		tbl = {},
	}
	
	local mt = {
		__index = TileTable,
		__call = TileTable.Insert,
	}
	
	return setmetatable(tbl,mt)
end

function TileTable:Insert(p,o)
	table.insert(self.tbl,Tile.new(p,o))
end

function TileTable:Get(x,y)
	if ((x < 1) or (y < 1) or (x > self.x) or (y > self.y)) then
		return nil, "Out of Range"
	end
	
	return self.tbl[((y - 1)*self.x) + x]
end

function TileTable:Set(x,y,p,o)
	if ((x < 1) or (y < 1) or (x > self.x) or (y > self.y)) then
		return "Out of Range"
	end
	
	self.tbl[((y - 1)*self.x) + x].path = p or false
	self.tbl[((y - 1)*self.x) + x].obj = o or 0
end