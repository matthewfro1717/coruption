function onCreate()
	-- background shit
	makeLuaSprite('Farmlands', 'Farmlands', -400, -200);
	
	addLuaSprite('Farmlands', false);
	
	close(true); --For performance reasons, close this script once the stage is fully loaded, as this script won't be used anymore after loading the stage
end