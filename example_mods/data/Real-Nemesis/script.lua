function opponentNoteHit()
    if mustHitSection == false then
        health = getProperty('health')
        if getProperty('health') > 0.1 then
            setProperty('health', health- 0.015);
        end
    end
end

function onUpdate()
	setProperty('timeBar.color', getColorFromHex('ff9640'))
    setProperty('timeBarBG.color', getColorFromHex('ff9640'))
end

function onCreate()
	makeLuaText('dis', "Real Nemesis by Emperor Yami", 600, 680, 0)
    doTweenAlpha('disbye','dis',0,8,'linear')
    setTextSize('dis', 20)
    setTextColor('dis', 'FFFFFF')
    addLuaText('dis',true)
end