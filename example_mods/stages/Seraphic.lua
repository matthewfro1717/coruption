function onCreate()
	-- background shit
    makeLuaSprite('Seraphic', 'Seraphic', -800,-700)
    setLuaSpriteScrollFactor('Seraphic', 0.9, 0.9); 
    addLuaSprite('Seraphic')
	scaleObject('background', 0.3,0.3);
end

function onCreatePost()
    addGlitchEffect('Seraphic', 1, 1);
end