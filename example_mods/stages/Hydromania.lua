
function onCreate()
    makeLuaSprite('Hydromania', 'Hydromania', -500, -100);
    setLuaSpriteScrollFactor('Hydromania', 0.9, 0.9); 
    addLuaSprite('Hydromania')
    scaleObject('Hydromania', 1,1);
    makeLuaSprite('FloorHydro', 'FloorHydro', -500, -300 );

    addLuaSprite('FloorHydro', false);
    scaleObject('FloorHydro', 0.5, 0.5);
    setProperty("FloorHydro.alpha",1)
    scaleObject('FloorHydro', 1,1);
end
function onCreatePost()
    addGlitchEffect('Hydromania', 2, 2);
end


function onUpdate()
	songPos = getSongPosition()
	local currentBeat = (songPos/1000)*(bpm/60)
    setProperty('Hydromania.x',-600+math.sin(currentBeat*math.pi/16)*100)
    setProperty('Hydromania.y',-500+math.sin(currentBeat*math.pi/16)*50)
    setProperty('Hydromania.angle',math.cos(currentBeat*math.pi/16)*6)
end


