Level = {}
Level.name = ""
Level.Path = PathTable.new()

function Level:Lerp(ObjTbl)
	
end

function Level.new(n)
	local tbl = {
		name = n or "",
		Path = PathTbl.new()
	}
	
	local mt = {
		__index = Level,
		__call = Level.Lerp,
	}
	
	return setmetatable(tbl,mt)
end