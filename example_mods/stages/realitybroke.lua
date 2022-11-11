
function onCreate()
    makeLuaSprite('bg', 'realityisbroken', -200, -500)
    setLuaSpriteScrollFactor('bg', 0.9, 0.9); 
    addLuaSprite('bg')
    scaleObject('background', 4,4);
end

function onStartCountdown()
    setProperty('health', 2)
    end
    