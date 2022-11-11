function onCreate()
	-- background shit
    makeLuaSprite('Cheated', 'Cheated', -500,-700)
    setLuaSpriteScrollFactor('Cheated', 0.3, 0.3); 
    addLuaSprite('Cheated')
    makeLuaSprite('cc1', 'cheatcube1', 1200,-500)
    setLuaSpriteScrollFactor('cc1', 0.8, 0.8); 
    addLuaSprite('cc1')
	scaleObject('cc1', 0.3,0.3);
    makeLuaSprite('cc2', 'cheatcube1', 1200,-500)
    setLuaSpriteScrollFactor('cc2', 0.3, 0.3); 
    addLuaSprite('cc2')
	scaleObject('cc2', 0.5,0.5);
    makeLuaSprite('cc3', 'cheatcube2', 1200,-500)
    setLuaSpriteScrollFactor('cc3', 1.4, 1.4); 
    addLuaSprite('cc3')
	scaleObject('cc3', 0.4,0.4);
    setObjectOrder('cc3', 10)
    makeLuaSprite('cc4', 'cheatcube2', 1200,-500)
    setLuaSpriteScrollFactor('cc4', 0.5, 0.5); 
    addLuaSprite('cc4')
	scaleObject('cc4', 0.8,0.8);
    makeLuaSprite('cc5', 'cheatcube3', 1200,-500)
    setLuaSpriteScrollFactor('cc5', 1.4, 1.4); 
    addLuaSprite('cc5')
	scaleObject('cc5', 1,1);
    setObjectOrder('cc5', 10)
    makeLuaSprite('cc6', 'cheatcube3', 1200,-500)
    setLuaSpriteScrollFactor('cc6', 0.4, 0.4); 
    addLuaSprite('cc6')
	scaleObject('cc6', 0.6,0.6);
end

function onCreatePost()
    addGlitchEffect('Cheated', 4, 4);
end
function onUpdate()
	songPos = getSongPosition()
	local currentBeat = (songPos/1000)*(bpm/60)
    setProperty('Cheated.scale.x',1.05+math.cos(currentBeat*math.pi)*0.005)
    setProperty('Cheated.scale.y',1.05+math.sin(currentBeat*math.pi)*0.005)
    setProperty('Cheated.x',-600+math.sin(currentBeat*math.pi/16)*100)
    setProperty('Cheated.y',-500+math.sin(currentBeat*math.pi/16)*50)
    setProperty('Cheated.angle',math.cos(currentBeat*math.pi/16)*3)
    setProperty('cc1.x',1200+math.sin(currentBeat*math.pi/8+1.3)*30)
    setProperty('cc1.y',-300+math.sin(currentBeat*math.pi/8+1.3)*60)
    setProperty('cc1.angle',currentBeat*7)
    setProperty('cc2.x',50+math.sin(currentBeat*math.pi/8+3.7)*-40)
    setProperty('cc2.y',-200+math.sin(currentBeat*math.pi/8+3.7)*100)
    setProperty('cc2.angle',currentBeat*-5)
    setProperty('cc3.x',1200)
    setProperty('cc3.y',-50+math.sin(currentBeat*math.pi/8+2)*80)
    setProperty('cc3.angle',currentBeat*12)
    setProperty('cc4.x',500+math.sin(currentBeat*math.pi/8+4.5)*-10)
    setProperty('cc4.y',-200+math.sin(currentBeat*math.pi/8+4.5)*140)
    setProperty('cc4.angle',0)
    setProperty('cc5.x',-300+math.sin(currentBeat*math.pi/8+5.9)*-60)
    setProperty('cc5.y',-100+math.sin(currentBeat*math.pi/8+5.9)*30)
    setProperty('cc5.angle',currentBeat*8)
    setProperty('cc6.x',-300+math.sin(currentBeat*math.pi/8+5.9)*10)
    setProperty('cc6.y',-100+math.sin(currentBeat*math.pi/8+5.9)*20)
    setProperty('cc6.angle',currentBeat*3)
    setProperty('gf.scale.x',0.7)
    setProperty('gf.scale.y',0.7)
    setProperty('gf.x',265+math.fmod(currentBeat*93.75,3000)-1500)
    setProperty('gf.y',-500+math.sin(currentBeat*math.pi/16)*-300)
    setProperty('gf.angle',currentBeat*15)
end