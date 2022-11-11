function onCreate()
    makeLuaSprite('Resilient', 'Resilient', -200, -200)
    setLuaSpriteScrollFactor('Resilient', 0.9, 0.9); 
    addLuaSprite('Resilient')
end

function onCreatePost()
    addGlitchEffect('Resilient', 4, 4);
end
function onUpdate()
	songPos = getSongPosition()
	local currentBeat = (songPos/1000)*(bpm/60)
    setProperty('Resilient.scale.x',1.05+math.cos(currentBeat*math.pi)*0.005)
    setProperty('Resilient.scale.y',1.05+math.sin(currentBeat*math.pi)*0.005)
    setProperty('Resilient.x',-600+math.sin(currentBeat*math.pi/16)*100)
    setProperty('Resilient.y',-500+math.sin(currentBeat*math.pi/16)*50)
    setProperty('Resilient.angle',math.cos(currentBeat*math.pi/16)*3)
end