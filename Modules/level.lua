Level = {}
Level.name = ""
Level.Path = PathTbl.new()

function Level:Lerp(Obj)
	
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