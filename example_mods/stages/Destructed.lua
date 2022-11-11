
function onCreate()
    makeLuaSprite('Destructed', 'Destructed', -500, -700)
    setLuaSpriteScrollFactor('Destructed', 0.9, 0.9); 
    addLuaSprite('Destructed')
    scaleObject('background', 2,2);
end
function onCreatePost()
    addGlitchEffect('Destructed', 2, 2);
end
