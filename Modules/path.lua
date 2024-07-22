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
	for i,v in pairs(self.tbl) do
		if t >= c then
			c = c + v.tt
			f = i
			n = c - v.tt
		end
	end
	
	return self.tbl[f](t,n), c
end

function PathTable:GetClosest(Obj)
	local closest = 1
	local sdf = nil
	local sx = Obj.x
	local sy = Obj.y
	
	for i,v in pairs(self.tbl) do
		if (v.x1 - v.x2) == 0 then
			-- compare x
			if ((sy >= v.y1) and (sy <= v.y2)) or ((sy <= v.y1) and (sy >= v.y2)) then
				local dx = math.abs(v.x1 - sx)
				if not sdf then
					sdf = dx
					closest = i
				else
					if dx < sdf then
						sdf = dx
						closest = i
					end
				end
			end
		elseif (v.y1 - v.y2) == 0 then
			-- compare y
			if ((sx >= v.x1) and (sx <= v.x2)) or ((sx <= v.x1) and (sx >= v.x2)) then
				local dy = math.abs(v.y1 - sy)
				if not sdf then
					sdf = dy
					closest = i
				else
					if dy < sdf then
						sdf = dy
						closest = i
					end
				end
			end
		end
	end
	
	return self.tbl[closest]
end
