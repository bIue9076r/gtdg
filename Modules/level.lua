Level = {}
Level.name = ""
Level.Path = PathTable.new()
Level.Tiles = TileTable.new()
Level.Damage = 0
Level.MaxDamage = 500

function Level.new(n)
	local tbl = {
		name = n or "",
		Path = PathTable.new()
	}
	
	local mt = {
		__index = Level,
		__call = Level.Lerp,
	}
	
	return setmetatable(tbl,mt)
end

function Level:Lerp(ObjTbl)
	
end

function Level:InsertPath()
	
end

function Level:Load()
	
end

function Level:Draw()
	
end

function Level:Update(dt)
	
end

function Level:Keypressed(key)
	
end