function opponentNoteHit()
    if mustHitSection == false then
        health = getProperty('health')
        if getProperty('health') > 0.5 then
            setProperty('health', health- 0.025);
        end
    end
end


function onCreate()
    triggerEvent('Add Camera Zoom', '0, 0', '6, 6');
end

function onUpdate()
	setProperty('timeBar.color', getColorFromHex('FF6A00'))
    setProperty('timeBarBG.color', getColorFromHex('FF6A00'))
end

function onBeatHit()
	triggerEvent('Add Camera Zoom', '0.01, 0.01', '0.01, 0.01');
end