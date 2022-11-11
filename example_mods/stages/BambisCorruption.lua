function onCreate()
	-- background shit
	makeLuaSprite('BambisCorruption', 'BambisCorruption', -400, -200);
	
	addLuaSprite('BambisCorruption', false);
	
	close(true); --For performance reasons, close this script once the stage is fully loaded, as this script won't be used anymore after loading the stage
end