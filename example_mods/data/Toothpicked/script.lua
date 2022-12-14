-- Song Credits (Crumb Edition)
local creditsRemoved = false;

-- Judgement Counter Local (Crumb Edition)
local judgementCounter = true

function opponentNoteHit()
    if mustHitSection == false then
        health = getProperty('health')
        if getProperty('health') > 0.1 then
            setProperty('health', health- 0.015);
        end
    end
end

function onCountdownTick(tick)
	-- Countdown Images (Crumb Edition)
    if tick == 1 then
        loadGraphic('countdownReady', 'crumb-ready')
       		elseif tick == 2 then
        loadGraphic('countdownSet', 'crumb-set')
        	elseif tick == 3 then
        loadGraphic('countdownGo', 'crumb-go')
    end
end

function onUpdatePost()
	-- Crumb Edition Judgements
	setProperty('introSoundsSuffix', '-exosphere')
	setProperty('ratingsData[0].image', 'crumb-sick')
    setProperty('ratingsData[1].image', 'crumb-good')
    setProperty('ratingsData[2].image', 'crumb-bad')
    setProperty('ratingsData[3].image', 'crumb-shit')
	setProperty("comboSuffix", "-crumb") -- HEY IF YOU ARE GONNA USE THIS TYPE OF SCRIPT TO YOUR MOD, THIS WAS ONLY CODED FOR THIS MOD. Thanks Raf
end

function onCreatePost()
	-- Judgement Counter (Crumb Edition)
	if judgementCounter and getPropertyFromClass('ClientPrefs', 'judgement') then 
        makeLuaText('judgementCounterTxt', '', screenWidth, 8, 0)
        setTextSize('judgementCounterTxt', 20)
        setTextBorder('judgementCounterTxt', 2, '000000')
        screenCenter('judgementCounterTxt', 'Y')
        setTextAlignment('judgementCounterTxt', 'left')
        addLuaText('judgementCounterTxt')
        setObjectCamera('judgementCounterTxt', 'hud')
        setTextFont('judgementCounterTxt', 'ComicSansMSBold.ttf')
		setProperty("judgementCounter.alpha", 0)

	-- Watermark (Crumb Edition)
		makeLuaText('kadeEngineWatermark', songName .. ' - Crumb X Exospheric V2', 0, 4, getProperty('healthBarBG.y') + 55)
		setTextSize('kadeEngineWatermark', 16)
		setTextBorder('kadeEngineWatermark', 1, '000000')
		addLuaText('kadeEngineWatermark')
		setObjectCamera('kadeEngineWatermark', 'hud')
		setTextFont('kadeEngineWatermark', 'ComicSansMSBold.ttf')
		if downscroll then
			setProperty('kadeEngineWatermark.y', screenHeight * 0.9 + 49)
		end

		-- Hides the watermark to replace the new one
		setProperty("watermarkTxt.alpha", 0)

		-- Resets the fonts to the Crumb Edition ones
		setTextFont('scoreTxt','comic.ttf')
		setTextFont('missesTxt','comic.ttf')
		setTextFont('timeTxt','comic.ttf')
    end

	-- Crumb Edition Arrows
    for i = 0, getProperty('unspawnNotes.length') do
        if getPropertyFromGroup('unspawnNotes', i, 'mustPress') == false and getPropertyFromGroup('unspawnNotes', i, 'noteType') == '' then
            setPropertyFromGroup('unspawnNotes', i, 'texture', 'NOTE_assets_grape')
        end
    end
    for i = 0, getProperty('notes.length') do
        if getPropertyFromGroup('notes', i, 'mustPress') == false and getPropertyFromGroup('notes', i, 'noteType') == '' then
            setPropertyFromGroup('notes', i, 'texture', 'NOTE_assets_grape')
        end
    end
    for i = 0, getProperty('opponentStrums.length') do
        setPropertyFromGroup('opponentStrums', i, 'texture', 'NOTE_assets_grape')
    end
end

function onUpdate()
	-- Updates timeBar Color
	setProperty('timeBar.color', getColorFromHex('a349a4'))
    setProperty('timeBarBG.color', getColorFromHex('a349a4'))

	-- Judgement Counter 2 (Crumb Edition)
    if judgementCounter then
        setTextString('judgementCounterTxt', 'Sicks: ' .. getProperty('sicks') .. '\nGoods: ' .. getProperty('goods') .. '\nBads: ' .. getProperty('bads') .. '\nShits: ' .. getProperty('shits'))
    end
end

-- Song Credits (Crumb Edition)
-- THIS SCRIPT IS MADE BY TKTEMS (DO NOT USE IT AND CLAIM IT AS YOURS)
function onCreate()
	makeLuaSprite('bg', '', 0, (downscroll and -70 or 730))
	makeGraphic('bg', 1280, 70, '000000')
	setObjectCamera('bg', 'other');
	setProperty('bg.alpha', 0.5)
	addLuaSprite('bg')

	makeLuaText('creditsText', " Toothpicked composed by Emperor Yami | Charted by ToxicFlame ", 0, 0, (downscroll and -35 or 730));
	setTextBorder('creditsText', 2, '000000');
	setTextSize('creditsText', 20);
	screenCenter('creditsText', 'X')
	addLuaText('creditsText');
	setObjectCamera('creditsText', 'other');
	setTextFont('creditsText', 'ComicSansMSBold.ttf')
end

function onSongStart()
	doTweenY('aumddCredits', 'creditsText', (downscroll and 5 or 690), 0.3, 'elasticOut')
	doTweenY('addCreditBG', 'bg', (downscroll and -35 or 685), 0.3, 'elasticOut')

	runTimer('creditBGWait', 2, 1)
end

function onTimerCompleted(tag)
	-- FINALLY I GOT IT TO BE A TIMER
	if tag == 'creditBGWait' and not creditsRemoved then 
		doTweenY('removeCredits', 'creditsText', (downscroll and -35 or 730), 0.3, 'elasticIn')
		doTweenY('removeCreditBG', 'bg', (downscroll and -70 or 725), 0.3, 'elasticIn')
		creditsRemoved = true
	end
end

-- Why does the script has so many lines lol
-- Edited by MinecraftBoy2038