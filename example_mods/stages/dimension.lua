function onCreate()
    makeLuaSprite('dimension', 'dimension', -200, -200)
    setLuaSpriteScrollFactor('dimension', 0.9, 0.9); 
    addLuaSprite('dimension')
end

function onCreatePost()
    addGlitchEffect('Cheated', 4, 4);
end
function onUpdate()
	songPos = getSongPosition()
	local currentBeat = (songPos/1000)*(bpm/60)
    setProperty('dimension.scale.x',1.05+math.cos(currentBeat*math.pi)*0.005)
    setProperty('dimension.scale.y',1.05+math.sin(currentBeat*math.pi)*0.005)
    setProperty('dimension.x',-600+math.sin(currentBeat*math.pi/16)*100)
    setProperty('dimension.y',-500+math.sin(currentBeat*math.pi/16)*50)
    setProperty('dimension.angle',math.cos(currentBeat*math.pi/16)*3)
end