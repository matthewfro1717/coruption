function onCreate()
    makeLuaSprite('Inequal', 'Inequal', -200, -200)
    setLuaSpriteScrollFactor('Inequal', 0.9, 0.9); 
    addLuaSprite('Inequal')
    scaleObject('background', 1.5,1.5);
end

function onCreatePost()
    addGlitchEffect('Inequal', 1, 1);
end
function onUpdate()
	songPos = getSongPosition()
	local currentBeat = (songPos/1000)*(bpm/60)
    setProperty('Inequal.scale.x',1.05+math.cos(currentBeat*math.pi)*0.005)
    setProperty('Inequal.scale.y',1.05+math.sin(currentBeat*math.pi)*0.005)
    setProperty('Inequal.x',-600+math.sin(currentBeat*math.pi/16)*100)
    setProperty('Inequal.y',-500+math.sin(currentBeat*math.pi/16)*50)
    setProperty('Inequal.angle',math.cos(currentBeat*math.pi/16)*6)
end