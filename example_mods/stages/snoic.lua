function onCreate()
	-- background shit

	makeAnimatedLuaSprite('snoic','snoic',-350, -800)
	addAnimationByPrefix('snoic','loop','snoic',30,true)
    objectPlayAnimation('snoic','loop',true)
    setScrollFactor('snoic', 0.9, 0.9)
    scaleObject('snoic', 4, 4);

	addLuaSprite('snoic', false);
	
	close(true); --For performance reasons, close this script once the stage is fully loaded, as this script won't be used anymore after loading the stage
end