
local theepic = true;



function onCreatePost()
    for i = 4,7 do
        setPropertyFromGroup('strumLineNotes',i,'x',-20+i*110)
        end
    setProperty("boyfriend.alpha", 0.0)
    setProperty("girlfriend.alpha", 0.0)
    makeLuaText('dis', "Original Song by DJ Jayden (Blocked Forever), Remix by Emperor Yami", 600, 680, 0)
    doTweenAlpha('disbye','dis',0,8,'linear')
    setTextSize('dis', 30)
    setTextColor('dis', '000000')
    addLuaText('dis',true)
end

function onUpdate(elapsed)
    songPos = getSongPosition()
    local currentBeat = (songPos/5000)*(curBpm/60)
    setCharacterY('dad',getCharacterY('dad') + (math.sin(currentBeat) * 0.6))
    noteTweenAlpha('itsnothere',0, 0, 0.001, 'sineOut')
    noteTweenAlpha('itsnothere1',1, 0, 0.001, 'sineOut')
    noteTweenAlpha('itsnothere2',2, 0, 0.001, 'sineOut')
    noteTweenAlpha('itsnothere3',3, 0, 0.001, 'sineOut')
    setProperty("timeBar.alpha",0)
    setProperty("scoreTxt.alpha",0)
    setProperty("camHUD.zoom", 0.9)
    function onMoveCamera(focus)
        if focus == 'boyfriend' then
            -- called when the camera focus on boyfriend
        elseif focus == 'dad' then
            setProperty('camFollowPos.y',getProperty('camFollowPos.y') + (math.sin(currentBeat) * 0.6))
        end
    end
end


