function onCreate()
	-- background shit

	makeAnimatedLuaSprite('desaturatedmovement','desaturatedmovement',-500, -700)
	addAnimationByPrefix('desaturatedmovement','loop','insane',30,true)
    objectPlayAnimation('insane','loop',true)
    setScrollFactor('desaturatedmovement', 0.9, 0.9)
    scaleObject('desaturatedmovement', 5, 5);
	setProperty("desaturatedmovement.alpha", 0.4)

	addLuaSprite('desaturatedmovement', false);
	
	close(true); --For performance reasons, close this script once the stage is fully loaded, as this script won't be used anymore after loading the stage
end