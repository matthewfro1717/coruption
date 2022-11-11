function onCreate()
    makeLuaSprite('CandyCane', 'CandyCane', -200, -200)
    setLuaSpriteScrollFactor('CandyCane', 0.9, 0.9); 
    addLuaSprite('CandyCane')
end

function onCreatePost()
    addGlitchEffect('CandyCane', 4, 4);
end
function onUpdate()
	songPos = getSongPosition()
	local currentBeat = (songPos/1000)*(bpm/60)
    setProperty('CandyCane.scale.x',1.05+math.cos(currentBeat*math.pi)*0.005)
    setProperty('CandyCane.scale.y',1.05+math.sin(currentBeat*math.pi)*0.005)
    setProperty('CandyCane.x',-600+math.sin(currentBeat*math.pi/16)*100)
    setProperty('CandyCane.y',-500+math.sin(currentBeat*math.pi/16)*50)
    setProperty('CandyCane.angle',math.cos(currentBeat*math.pi/16)*3)
end