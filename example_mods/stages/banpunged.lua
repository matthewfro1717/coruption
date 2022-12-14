function onCreate()
    makeLuaSprite('banpunged', 'banpunged', -200, -200)
    setLuaSpriteScrollFactor('banpunged', 0.9, 0.9); 
    addLuaSprite('banpunged')
end
function onCreatePost()
    addGlitchEffect('banpunged', 2, 2);
end

function onStartCountdown()
    setProperty('health', 2)
    end


function opponentNoteHit()
    if mustHitSection == false then
        health = getProperty('health')
        if getProperty('health') > 0.2 then
            setProperty('health', health- 0.01);
        end
    end
end