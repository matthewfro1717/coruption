function onCreate()
	-- background shit
    makeLuaSprite('Epitomed', 'Epitomed', -500,-700)
    setLuaSpriteScrollFactor('Epitomed', 0.9, 0.9); 
    addLuaSprite('Epitomed')
	scaleObject('background', 0.3,0.3);
end

function onCreatePost()
    addGlitchEffect('Epitomed', 2, 1);
end