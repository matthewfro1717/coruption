function onCreate()
	-- background shit
    makeLuaSprite('Familiarity', 'Familiarity', -3000,-2200)
    setLuaSpriteScrollFactor('Familiarity', 0.9, 0.9); 
    addLuaSprite('Familiarity')
	scaleObject('Familiarity', 2,2);
end

function onCreatePost()
    addGlitchEffect('Familiarity', 2, 2);
end