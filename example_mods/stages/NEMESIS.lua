
function onCreate()
    makeLuaSprite('TheEclipse', 'TheEclipse', -700, -100);
    setLuaSpriteScrollFactor('TheEclipse', 0.9, 0.9); 
    addLuaSprite('TheEclipse')
    scaleObject('TheEclipse', 3,3);
   
   
    makeLuaSprite('ThePinkedEdges', 'ThePinkedEdges', -500, -100 );

    addLuaSprite('ThePinkedEdges', false);
    setProperty("ThePinkedEdges.alpha",1)
    scaleObject('ThePinkedEdges', 1,1);

    makeLuaSprite('RedGalaxy', 'RedGalaxy', -500, -100 );

    addLuaSprite('RedGalaxy', false);
    setProperty("RedGalaxy.alpha",1)
    scaleObject('RedGalaxy', 2,2);

    makeLuaSprite('SpacialSky', 'SpacialSky', -500, -100 );

    addLuaSprite('SpacialSky', false);
    setProperty("SpacialSky.alpha",1)
    scaleObject('SpacialSky', 7,7);

    makeLuaSprite('BlueSpace', 'BlueSpace', -500, -100 );

    addLuaSprite('BlueSpace', false);
    setProperty("BlueSpace.alpha",1)
    scaleObject('BlueSpace', 2,2);
    
    makeLuaSprite('RealityShattered', 'RealityShattered', -500, -100 );

    addLuaSprite('RealityShattered', false);
    setProperty("RealityShattered.alpha",1)
    scaleObject('RealityShattered', 2,2);

    setProperty("ThePinkedEdges.alpha",0)
    setProperty("BlueSpace.alpha",0)
    setProperty("SpacialSky.alpha",0)
    setProperty("RedGalaxy.alpha",0)
    setProperty("RealityShattered.alpha",0)
end
function onCreatePost()
    addGlitchEffect('Cheating', 2, 2);
end

function onBeatHit()
    if curBeat == 608 then
        setProperty("SpacialSky.alpha",1)
        setProperty("TheEclipse.alpha",0)
    end
    if curBeat == 1376 then
        setProperty("ThePinkedEdges.alpha",1)
        setProperty("SpacialSky.alpha",0)
    end
    if curBeat == 2080 then
        setProperty("BlueSpace.alpha",1)
        setProperty("ThePinkedEdges.alpha",0)
    end
    if curBeat == 2784 then
        setProperty("RedGalaxy.alpha",1)
        setProperty("BlueSpace.alpha",0)
    end
    if curBeat == 3040 then
        setProperty("RedGalaxy.alpha",0)
        setProperty("TheEclipse.alpha",1)
    end

    if curBeat == 3104 then
        setProperty("SpacialSky.alpha",1)
        setProperty("TheEclipse.alpha",0)
    end

    if curBeat == 3168 then
        setProperty("ThePinkedEdges.alpha",1)
        setProperty("SpacialSky.alpha",0)
    end
    if curBeat == 3232 then
        setProperty("BlueSpace.alpha",1)
        setProperty("ThePinkedEdges.alpha",0)
    end 

    if curBeat == 3296 then
        setProperty("RealityShattered.alpha",1)
        setProperty("BlueSpace.alpha",0)
    end
    if curBeat == 3424 then
        setProperty("RedGalaxy.alpha",1)
        setProperty("RealityShattered.alpha",0)
    end
    if curBeat == 3552 then
        setProperty("RealityShattered.alpha",1)
        setProperty("RedGalaxy.alpha",0)
    end
end

function onUpdate()
	songPos = getSongPosition()
	local currentBeat = (songPos/1000)*(bpm/60)
    setProperty('TheEclipse.x',-600+math.sin(currentBeat*math.pi/16)*100)
    setProperty('TheEclipse.y',-500+math.sin(currentBeat*math.pi/16)*50)
    setProperty('TheEclipse.angle',math.cos(currentBeat*math.pi/16)*6)
    setProperty('ThePinkedEdges.x',-600+math.sin(currentBeat*math.pi/16)*100)
    setProperty('ThePinkedEdges.y',-500+math.sin(currentBeat*math.pi/16)*50)
    setProperty('ThePinkedEdges.angle',math.cos(currentBeat*math.pi/16)*6)
    setProperty('RedGalaxy.x',-600+math.sin(currentBeat*math.pi/16)*100)
    setProperty('RedGalaxy.y',-500+math.sin(currentBeat*math.pi/16)*50)
    setProperty('RedGalaxy.angle',math.cos(currentBeat*math.pi/16)*6)
    setProperty('SpacialSky.x',-600+math.sin(currentBeat*math.pi/16)*100)
    setProperty('SpacialSky.y',-500+math.sin(currentBeat*math.pi/16)*50)
    setProperty('SpacialSky.angle',math.cos(currentBeat*math.pi/16)*6)
    setProperty('BlueSpace.x',-600+math.sin(currentBeat*math.pi/16)*100)
    setProperty('BlueSpace.y',-500+math.sin(currentBeat*math.pi/16)*50)
    setProperty('BlueSpace.angle',math.cos(currentBeat*math.pi/16)*6)
    setProperty('RealityShattered.x',-600+math.sin(currentBeat*math.pi/16)*100)
    setProperty('RealityShattered.y',-500+math.sin(currentBeat*math.pi/16)*50)
    setProperty('RealityShattered.angle',math.cos(currentBeat*math.pi/16)*6)
end


