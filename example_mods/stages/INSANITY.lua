function onCreate()
	-- background shit

	makeAnimatedLuaSprite('insane','insane',-700, -800)
	addAnimationByPrefix('insane','loop','insane',30,true)
    objectPlayAnimation('insane','loop',true)
    setScrollFactor('insane', 0.9, 0.9)
    scaleObject('insane', 5, 5);

	addLuaSprite('insane', false);
	
	close(true); --For performance reasons, close this script once the stage is fully loaded, as this script won't be used anymore after loading the stage
end