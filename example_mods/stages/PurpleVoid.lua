function onCreate()
	-- background shit
    makeLuaSprite('PurpleVoid', 'PurpleVoid', -1000,-5000)
    setLuaSpriteScrollFactor('PurpleVoid', 0.9, 0.9); 
    addLuaSprite('PurpleVoid')
	scaleObject('background', 0.3,0.3);
end

function onBeatHit()
    if curBeat >= 17 then
        doTweenY('purpleTweenY', 'PurpleVoid', -500, 1)
       end
end