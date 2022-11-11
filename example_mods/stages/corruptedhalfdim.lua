local angleshit = 1;
local anglevar = 1;
local alphaisfucked = true; --made this since for some fucking reason pb kept appearing when they weren't supposed too xD

function onCreate()
	-- background shit
    makeLuaSprite('half', 'corrupteddimension', -2900,-2300)
    setLuaSpriteScrollFactor('half', 0.9, 0.9); 
    addLuaSprite('half')
	scaleObject('half', 6, 9);


end

function onUpdate(elapsed)
    setProperty("boyfriend.scale.x", 0.4)
    setProperty("boyfriend.scale.y", 0.4)
    setProperty("dad.scale.x", 5)
    setProperty("dad.scale.y", 5)
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

function onCreatePost()
    setProperty("gf.alpha", 0)
    addGlitchEffect('half', 0.5, 0.5);
end


function onBeatHit()
    if curBeat > 0 then
        if curBeat % 2 == 0 then
            angleshit = anglevar;
        else
            angleshit = -anglevar;
        end
        setProperty('camHUD.angle',angleshit*3)
        setProperty('camGame.angle',angleshit*3)
        doTweenAngle('turn', 'camHUD', angleshit, stepCrochet*0.002, 'circOut')
        doTweenX('tuin', 'camHUD', -angleshit*8, crochet*0.001, 'linear')
        doTweenAngle('tt', 'camGame', angleshit, stepCrochet*0.002, 'circOut')
        doTweenX('ttrn', 'camGame', -angleshit*8, crochet*0.001, 'linear')
    end
    end


