State = {}
State.Id = 0
State.Window = Window.new()

function State:Load()
	
end

function State:Draw()
	derror()
end

function State:Update(dt)
	
end

function State:Keypressed(key)
	kerror(key)
end

function State:GetId()
	return self.Id
end

function State.new(id,l)
	local tbl = {
		Id = id or 0,
		Window = Window.new(l),
	}
	
	local mt = {
		__call = GetId,
		__index = State,
	}
	
	return setmetatable(tbl,mt)
end