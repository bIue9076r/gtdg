Tile = {}

function Tile.new(p,o)
	local tbl = {
		path = p or false,
		obj = o or 0,
	}
	
	return tbl
end

TileTable = {}
TileTable.tbl = {}

function TileTable.new()
	local tbl = {
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
