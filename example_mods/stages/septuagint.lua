function onCreate()
    makeLuaSprite('septuagint', 'septuagint', -200, -200)
    setLuaSpriteScrollFactor('septuagint', 0.9, 0.9); 
    addLuaSprite('septuagint')
end

function onCreatePost()
    addGlitchEffect('septuagint', 4, 4);
end
function onUpdate()
	songPos = getSongPosition()
	local currentBeat = (songPos/1000)*(bpm/60)
    setProperty('septuagint.scale.x',1.05+math.cos(currentBeat*math.pi)*0.005)
    setProperty('septuagint.scale.y',1.05+math.sin(currentBeat*math.pi)*0.005)
    setProperty('septuagint.x',-600+math.sin(currentBeat*math.pi/16)*100)
    setProperty('septuagint.y',-500+math.sin(currentBeat*math.pi/16)*50)
    setProperty('septuagint.angle',math.cos(currentBeat*math.pi/16)*3)
end