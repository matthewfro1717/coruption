
function onCreate()
    makeLuaSprite('ControlledVoid', 'ControlledVoid', -200, -500)
    setLuaSpriteScrollFactor('ControlledVoid', 0.9, 0.9); 
    addLuaSprite('ControlledVoid')
    scaleObject('background', 4,4);
end
function onCreatePost()
    addGlitchEffect('ControlledVoid', 2, 2);
end

function onStartCountdown()
    setProperty('health', 2)
    end
    