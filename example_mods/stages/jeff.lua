function onCreate()
	-- background shit

	makeAnimatedLuaSprite('jeff','jeff',-100, -1300)
	addAnimationByPrefix('jeff','loop','jeff',30,true)
    objectPlayAnimation('jeff','loop',true)
    setScrollFactor('jeff', 0.9, 0.9)
    scaleObject('jeff', 4, 4);

	addLuaSprite('jeff', false);
	
	close(true); --For performance reasons, close this script once the stage is fully loaded, as this script won't be used anymore after loading the stage
end