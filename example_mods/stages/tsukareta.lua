local angleshit = 1;
local anglevar = 1;
local alphaisfucked = false; --made this since for some fucking reason pb kept appearing when they weren't supposed too xD

function onCreate()
    makeLuaSprite('tsukareta', 'tsukareta', -200, -200)
    setLuaSpriteScrollFactor('tsukareta', 0.9, 0.9); 
    addLuaSprite('tsukareta')
end
function onCreatePost()
    addGlitchEffect('tsukareta', 2, 2);
end

function onStartCountdown()
    setProperty('health', 2)
    end
    
    function onUpdate(elapsed)
    songPos = getSongPosition()
    local currentBeat = (songPos/5000)*(curBpm/60)
    setCharacterY('dad',getCharacterY('dad') + (math.sin(currentBeat) * 0.6))
    function onMoveCamera(focus)
        if focus == 'boyfriend' then
            -- called when the camera focus on boyfriend
        elseif focus == 'dad' then
            setProperty('camFollowPos.y',getProperty('camFollowPos.y') + (math.sin(currentBeat) * 0.6))
        end
    end
end

function opponentNoteHit()
    if mustHitSection == false then
        health = getProperty('health')
        if getProperty('health') > 0.1 then
            setProperty('health', health- 0.022);
        end
    end
end