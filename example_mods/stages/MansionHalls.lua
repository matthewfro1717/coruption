function onCreate()
    makeLuaSprite('MansionHalls', 'MansionHalls', -600, -800)
    setLuaSpriteScrollFactor('MansionHalls', 0.9, 0.9); 
    addLuaSprite('MansionHalls')
    scaleObject('MansionHalls', 2, 2);
end

function onCreatePost()
    addGlitchEffect('Cheated', 4, 4);
end
