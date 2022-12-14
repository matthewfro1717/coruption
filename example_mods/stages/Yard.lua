function onCreate()
	-- background shit
	makeLuaSprite('Yard', 'Yard', -400, -475);
	scaleObject('Yard', 1.7,1.7);
	addLuaSprite('Yard', false);
	
	close(true); --For performance reasons, close this script once the stage is fully loaded, as this script won't be used anymore after loading the stage
end