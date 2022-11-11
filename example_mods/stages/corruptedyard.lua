function onCreate()
	-- background shit
	makeLuaSprite('corruptedyard', 'corruptedyard', -1500, -1600);
	scaleObject('corruptedyard', 2, 2)
	
	addLuaSprite('corruptedyard', false);
	scaleObject('background', 0.1,0.1);
	setProperty("boyfriend.scale.x", 0.4)
	setProperty("boyfriend.scale.y", 0.4)

	setProperty("dad.scale.x", 0.4)
	setProperty("dad.scale.y", 0.4)
	setProperty("gf.scale.x", 0.4)
	setProperty("gf.scale.y", 0.4)
  
  
end