
function onCreate()
    makeLuaSprite('Blackout', 'Blackout', -500, -700)
    setLuaSpriteScrollFactor('Blackout', 0.9, 0.9); 
    addLuaSprite('Blackout')
    scaleObject('Blackout', 2,2);
    makeLuaSprite('Blackout2', 'Blackout2', -600, -500);

    addLuaSprite('Blackout2', false);
    scaleObject('Blackout2', 10, 10);
    setProperty("Blackout2.alpha",0)
    
end
function onCreatePost()
    addGlitchEffect('Blackout', 2, 2);
end

function onBeatHit()
    if curBeat == 532 then
        setProperty("Blackout2.alpha",1)
    end
end
