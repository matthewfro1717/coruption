function onCreate()
	-- background shit
	makeLuaSprite('background','glitchcornBG',-500,-700)
	addLuaSprite('background',false)
	setLuaSpriteScrollFactor('background',1,1)
	scaleObject('background', 1.5,1.5);
	
	close(true); --For performance reasons, close this script once the stage is fully loaded, as this script won't be used anymore after loading the stage
end