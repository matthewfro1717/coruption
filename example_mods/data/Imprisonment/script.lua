function onUpdate()
    if getPropertyFromClass('flixel.FlxG', 'keys.justPressed.BACKSPACE') then
        loadSong('Fractured-Incantation', 'Fractured-Incantation', true)
    end
    setProperty('timeBar.color', getColorFromHex('323232'))
    setProperty('timeBarBG.color', getColorFromHex('323232'))
end


function onCreate()
    makeLuaText('dis', "Imprisonment by GoddessAwe", 600, 680, 0)
    doTweenAlpha('disbye','dis',0,8,'linear')
    setTextSize('dis', 20)
    setTextColor('dis', 'FFFFFF')
    addLuaText('dis',true)
end

function onUpdatePost()
	setProperty('ratingsData[0].image', 'anomoly-sick')
    setProperty('ratingsData[1].image', 'anomoly-good')
    setProperty('ratingsData[2].image', 'anomoly-bad')
    setProperty('ratingsData[3].image', 'anomoly-shit')
	setProperty("comboSuffix", "-anomoly") -- HEY IF YOU ARE GONNA USE THIS TYPE OF SCRIPT TO YOUR MOD, THIS WAS ONLY CODED FOR THIS MOD. Thanks Raf
end

function onCountdownTick(tick)
    if tick == 1 then
        loadGraphic('countdownReady', 'anomoly-ready')
       		elseif tick == 2 then
        loadGraphic('countdownSet', 'anomoly-set')
        	elseif tick == 3 then
        loadGraphic('countdownGo', 'anomoly-go')
    end
end