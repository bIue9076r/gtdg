-- File Handler
File = {}
File.path = nil
File.file = nil

function File.new(p)
	local tbl = {
		path = p,
		file = nil,
	}
	
	local mt = {
		__index = File,
	}
	
	return setmetatable(tbl,mt)
end

function File:SetHeader()
	self.file = io.open(self.path,"w")
	self.file:write("HEADR 0\n")
	self.file:close()
end

function File:NewField(i,v)
	self.file = io.open(self.path,"a")
	self.file:write("FIELD "..tostring(i).." "..tostring(v).."\n")
	self.file:close()
end

function File:GetHeader()
	local s = self.file:read()
	return tonumber(s:sub(7))
end

function File:ReadV0()
	local tbl = {}
	for line in self.file:lines() do
		if line:sub(1,5) == "FIELD" then
			local l = line:sub(7)
			local i = l:find(" ")
			if i <= 0 then
				return tbl
				--assert("Syntax Error")
			end
			v1 = l:sub(1,i-1)
			v2 = tonumber(l:sub(i+1))
			tbl[v1] = v2
		end
	end
	return tbl
end

function File:Read()
	self.file = io.open(self.path,"r")
	local v = self:GetHeader()
	local r
	if v == 0 then
		r = self:ReadV0()
	else
		r = {}
		--assert("Unsupported File Version")
	end
	self.file:close()
	return r
end