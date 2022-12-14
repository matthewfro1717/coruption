function onCreate()
	-- background shit

	makeAnimatedLuaSprite('StartRunning','StartRunning',-500, -700)
	addAnimationByPrefix('StartRunning','loop','idle',30,true)
    objectPlayAnimation('insane','loop',true)
    setScrollFactor('StartRunning', 0.9, 0.9)
    scaleObject('StartRunning', 2, 2);

	addLuaSprite('StartRunning', false);
	
end