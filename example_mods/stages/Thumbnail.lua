function onCreate()
	-- background shit
	makeLuaSprite('Thumbnail', 'Thumbnail', -400, -400);
	
	addLuaSprite('Thumbnail', false);
	
	close(true); --For performance reasons, close this script once the stage is fully loaded, as this script won't be used anymore after loading the stage
end