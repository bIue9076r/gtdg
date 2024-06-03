-- Level Screen State

function LevelScreen:Load(l)
	print(l)
end

function LevelScreen:Draw()
	
end

function LevelScreen:Update(dt)
	
end

function LevelScreen:Keypressed(key)
	if key == "return" then
		Game.State = LoadScreen
		Game.State:Load()
	end
end