function onCreate()
    makeLuaSprite('BizarrePark', 'BizarrePark', -600, -350)
    setLuaSpriteScrollFactor('BizarrePark', 0.9, 0.9); 
    addLuaSprite('BizarrePark')
    makeLuaSprite('greengalaxy', 'greengalaxy', -560, -500);

    addLuaSprite('greengalaxy', false);
    scaleObject('greengalaxy', 2, 2);
    setProperty("greengalaxy.alpha",0)
end


function onCreatePost()
    addGlitchEffect('Cheated', 2, 2);
end

function onBeatHit()
    if curBeat == 320 then
        setProperty("greengalaxy.alpha",1)
    end
    if curBeat == 448 then
        setProperty("greengalaxy.alpha",0)
    end
    if curBeat == 640 then
        setProperty("greengalaxy.alpha",1)
    end
    if curBeat == 704 then
        setProperty("greengalaxy.alpha",0)
    end
end

function onUpdate()
	songPos = getSongPosition()
	local currentBeat = (songPos/1000)*(bpm/60)
    setProperty('greengalaxy.x',-600+math.sin(currentBeat*math.pi/16)*100)
    setProperty('greengalaxy.y',-500+math.sin(currentBeat*math.pi/16)*50)
    setProperty('greengalaxy.angle',math.cos(currentBeat*math.pi/16)*6)
end

