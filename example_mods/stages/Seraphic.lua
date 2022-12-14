function onCreate()
	-- background shit
    makeLuaSprite('Seraphic', 'Seraphic', -800,-700)
    setLuaSpriteScrollFactor('Seraphic', 1, 1); 
    addLuaSprite('Seraphic')
	scaleObject('background', 2.5,2.5);
end

function onCreatePost()
    addGlitchEffect('Seraphic', 1, 1);
end