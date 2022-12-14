function onCreate()
	-- background shit
	makeLuaSprite('Grapesky', 'Grapesky', -650, -290);
	setScrollFactor('Grapesky', 0.9, 0.9);
	scaleObject('Grapesky', 2.2, 2.2);
	makeLuaSprite('Grapeground', 'Grapeground', -650, -290);
	setScrollFactor('Grapeground', 0.9, 0.9);
	scaleObject('Grapeground', 2.0, 2.0);
	
	addLuaSprite('Grapesky', false);
	addLuaSprite('Grapeground', false);
	
	close(true); --For performance reasons, close this script once the stage is fully loaded, as this script won't be used anymore after loading the stage
end