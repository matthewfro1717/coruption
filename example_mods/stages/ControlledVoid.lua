
function onCreate()
    makeLuaSprite('ControlledVoid', 'ControlledVoid', -900, -700)
    setLuaSpriteScrollFactor('ControlledVoid', 0.9, 0.9); 
    addLuaSprite('ControlledVoid')
    scaleObject('ControlledVoid', 2.5,2.5);
    makeLuaSprite('VoidPlatform', 'VoidPlatform', -1400, -850)
    setLuaSpriteScrollFactor('VoidPlatform', 0.9, 0.9); 
    addLuaSprite('VoidPlatform')
    scaleObject('VoidPlatform', 2.5,2.5);
    makeLuaSprite('VoidCrystals', 'VoidCrystals', -900, -700)
    setLuaSpriteScrollFactor('VoidCrystals', 0.9, 0.9); 
    addLuaSprite('VoidCrystals', true)
    scaleObject('VoidCrystals', 2.5,2.5);
end


function onUpdate()
    songPos = getSongPosition()
	local currentBeat = (songPos/1000)*(bpm/60)
    setProperty('VoidCrystals.x',-900+math.sin(currentBeat*math.pi/8+1.3)*30)
    setProperty('VoidCrystals.y',-700+math.sin(currentBeat*math.pi/8+1.3)*60)
    setProperty('VoidCrystals.angle',currentBeat*7)
end
    