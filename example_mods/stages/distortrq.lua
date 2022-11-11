function onCreate()
	-- background shit
    makeLuaSprite('distortrq', 'distortrq', -500,-700)
    setLuaSpriteScrollFactor('distortrq', 0.9, 0.9); 
    addLuaSprite('distortrq')
	scaleObject('background', 0.3,0.3);
end

function onCreatePost()
    addGlitchEffect('distortrq', 7, 7);
end