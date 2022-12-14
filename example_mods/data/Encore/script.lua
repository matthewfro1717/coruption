function opponentNoteHit()
    if mustHitSection == false then
        health = getProperty('health')
        if getProperty('health') > 0.1 then
            setProperty('health', health- 0.015);
        end
    end
end

function onUpdate()
	setProperty('timeBar.color', getColorFromHex('00ff00'))
    setProperty('timeBarBG.color', getColorFromHex('00ff00'))
end

function onUpdatePost()
	setProperty('introSoundsSuffix', '-bambi')
	setProperty('ratingsData[0].image', 'og-sick')
    setProperty('ratingsData[1].image', 'og-good')
    setProperty('ratingsData[2].image', 'og-bad')
    setProperty('ratingsData[3].image', 'og-shit')
	setProperty("comboSuffix", "-og") -- HEY IF YOU ARE GONNA USE THIS TYPE OF SCRIPT TO YOUR MOD, THIS WAS ONLY CODED FOR THIS MOD. Thanks Raf
end

function onCountdownTick(tick)
    if tick == 1 then
        loadGraphic('countdownReady', 'og-ready')
       		elseif tick == 2 then
        loadGraphic('countdownSet', 'og-set')
        	elseif tick == 3 then
        loadGraphic('countdownGo', 'og-go')
    end
end