Path = {}

function Path.new(x1,x2,y1,y2,tt)
	local tbl = {
		x1 = x1 or 0, x2 = x2 or 0,
		y1 = y1 or 0, y2 = y2 or 0,
		tt = tt or 0,
	}
	
	local mt = {
		__index = Path,
		__call = Path.Lerp,
	}
	
	return setmetatable(tbl,mt)
end

function Path:Lerp(t,o)
	o = o or 0
	dt = math.max(0,math.min(1,(t - o)/(self.tt)))
	return {
		x = ((self.x1)*(1-dt)) + ((self.x2)*(dt)),
		y = ((self.y1)*(1-dt)) + ((self.y2)*(dt)),
	}
end

PathTable = {}
PathTable.tbl = {}

function PathTable.new()
	local tbl = {
		tbl = {},
	}
	
	local mt = {
		__index = PathTable,
		__call = PathTable.Lerp,
	}
	
	return setmetatable(tbl,mt)
end

function PathTable:Insert(x1,x2,y1,y2,tt)
	table.insert(self.tbl,Path.new(x1,x2,y1,y2,tt))
end

function PathTable:Lerp(t)
	local n = 0
	local c = n
	local f = 1
	
	-- should be a until loop tbh
	for i,v in ipairs(self.tbl) do
		if t >= c then
			c = c + v.tt
			if t <= c then
				f = i
				n = c - v.tt
			end
		end
	end
	
	return self.tbl[f](t,n)
end