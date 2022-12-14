function onUpdate()
    setProperty('timeBar.color', getColorFromHex('5D3FD3'))
    setProperty('timeBarBG.color', getColorFromHex('5D3FD3'))
end

function opponentNoteHit()
    if mustHitSection == false then
        health = getProperty('health')
        if getProperty('health') > 0 then
            setProperty('health', health- 0.022);
        end
    end
end


function onBeatHit()
	songPos = getSongPosition()
    if curBeat > 0 then
        setProperty('iconP2.color', getColorFromHex('FF0000'))
        doTweenColor('epic1','iconP2','FFFFFF',crochet*0.001-0.01,'linear')
    end
end

function onUpdatePost()
	setProperty('introSoundsSuffix', '-exosphere')
end