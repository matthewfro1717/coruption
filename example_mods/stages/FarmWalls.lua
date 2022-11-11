function onCreate()
	-- background shit
	makeLuaSprite('FarmWalls', 'FarmWalls', -650, -200);
	scaleObject('FarmWalls', 1.7,1.7);
	addLuaSprite('FarmWalls', false);
	
	close(true); --For performance reasons, close this script once the stage is fully loaded, as this script won't be used anymore after loading the stage
end