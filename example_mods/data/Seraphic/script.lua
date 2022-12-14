

function onCreate() --setting variables and making sprites and da time bar :trol:
	setProperty('skipCountdown',true)
    setProperty('cpuControlled', false)
    makeLuaSprite('introfade','',0,0)
    makeLuaSprite('epicflash','',0,0)
    makeLuaSprite('chrchange','',0,0)
    setProperty('timeBar.color', getColorFromHex('0fe200'))
    setProperty('timeBarBG.color', getColorFromHex('0fe200'))
    makeGraphic('introfade',3000,3000,'000000')
    makeGraphic('epicflash',3000,3000,'FFFFFF')
    setObjectCamera('epicflash','other')
    setObjectCamera('introfade','other')
    addLuaSprite('introfade',true)
    addLuaSprite('epicflash',true)
    setProperty('epicflash.alpha', 0)
    doTweenAlpha('introfade1','introfade',0,2,'linear')
    setProperty('health', 2)
    doTweenZoom('introzoom1','camGame',0.7,2,'sineInOut')
    for i = 0,7 do
        makeLuaSprite('strumwhite' .. i,'',0,0)
        makeGraphic('strumwhite' .. i,10,3000,'FFFFFF')
        setObjectCamera('strumwhite' .. i,'HUD')
        setProperty('strumwhite' .. i .. '.alpha',0)
        addLuaSprite('strumwhite' .. i,false)
    end
    makeLuaText('dis', "modchart by: hydration#4758 and MinecraftBoy2038. PRESS Z TO HIDE", 600, 20, 540)
    setTextSize('dis', 20)
    setTextColor('dis', 'FFFFFF')
    addLuaText('dis',true)
    
    makeLuaText('dis2', "Original by Null_y34r | Remix by Emperor Yami", 600, 680, 0)
    doTweenAlpha('disbye2','dis2',0,8,'linear')
    setTextSize('dis2', 20)
    setTextColor('dis2', 'FFFFFF')
    addLuaText('dis2',true)
end

function onUpdatePost()
    if getPropertyFromClass('flixel.FlxG', 'keys.justPressed.Z') then
        setProperty('dis.alpha', 0)
    end
end

function opponentNoteHit()
    hp = getProperty('health')
    if hp > 0.5 then
    setProperty('health',hp-0.025)
    end
end
function goodNoteHit()
    hp = getProperty('health')
    setProperty('health',hp+0.05)
end

function noteMiss()
    hp = getProperty('health')
    setProperty('health',hp-0.1)
end
function onBeatHit() --events but better
    local currentBeat = math.floor((songPos / 1000) * (curBpm / 60))
    if currentBeat == 128 then
        doFlash(0.8, 1.5, 'FFFFFF')
    end
    if currentBeat == 192 then
        doTweenAlpha('funny', 'introfade', 0.95, 0.7, 'linear')
        doTweenZoom('funny2', 'camGame', 1.2, crochet * 0.004, 'sineOut')
    end
    if currentBeat == 196 then
        doTweenAlpha('funny', 'introfade', 0, 0.8, 'linear')
        doTweenZoom('funny3', 'camGame', 1, crochet * 0.002, 'sineInOut')
    end
    if currentBeat == 200 then
        doTweenAlpha('funny', 'introfade', 0.95, 0.7, 'linear')
        doTweenZoom('funny2', 'camGame', 1.2, crochet * 0.004, 'sineOut')
    end
    if currentBeat == 204 then
        doTweenAlpha('funny', 'introfade', 0, 0.8, 'linear')
        doTweenZoom('funny3', 'camGame', 1, crochet * 0.002, 'sineInOut')
    end
    if currentBeat == 256 then
        doFlash(0.3, 1, 'FFFFFF')
    end
    if currentBeat == 320 then
        setProperty('timeBar.color', getColorFromHex('1da63a'))
        setProperty('timeBarBG.color', getColorFromHex('1da63a'))
        doFlash(1, 1, 'FFFFFF')
        setProperty('health', 2)
    end
    if currentBeat == 480 then
        doFlash(1, 1.3, 'FFFFFF')
    end
    if currentBeat == 608 then
        doFlash(0.7, 3, 'FFFFFF')
    end
    if currentBeat == 672 then
        doFlash(1, 0.8, 'FFFFFF')
    end
    if currentBeat == 732 then
        setProperty('timeBar.color', getColorFromHex('FFFFFF'))
        setProperty('timeBarBG.color', getColorFromHex('FFFFFF'))
        makeLuaSprite('filter', '', 0, 0)
        makeLuaSprite('darken', '', 0, 0)
        makeGraphic('filter', 3000, 3000, 'FFFFFF')
        makeGraphic('darken', 3000, 3000, '000000')
        setObjectCamera('filter', 'other')
        setObjectCamera('darken', 'other')
        addLuaSprite('filter', true)
        addLuaSprite('darken', true)
        setProperty('filter.alpha', 0.1)
        setProperty('darken.alpha', 0)
        doTweenColor('filtercolorset', 'filter', '006666', 0.001, 'linear')
        doTweenAlpha('epic', 'darken', 0.2, crochet * 0.004 - 0.01, 'sineInOut')
        setBlendMode('filter', 'subtract')
        setBlendMode('darken', 'shader')
    end
    if currentBeat >= 736 and currentBeat < 1056 then
        if math.fmod(currentBeat, 8) == 0 then
            doTweenAlpha('epic', 'darken', 0, crochet * 0.004 - 0.01, 'sineInOut')
        end
        if math.fmod(currentBeat, 8) == 4 then
            doTweenAlpha('epic', 'darken', 0.2, crochet * 0.004 - 0.01, 'sineInOut')
        end
    end

    if currentBeat == 864 then
        doFlash(1, 1.3, '000000')
        setProperty("healthBar.alpha", 0)
        setProperty("iconP2.alpha", 0)
        setProperty("iconP1.alpha", 0)
        setProperty("timeBar.alpha", 0)
        setProperty("timeTxt.alpha", 0)
        setProperty("scoreTxt.alpha", 0)
    end
    if currentBeat == 928 then
        setProperty('camGame.zoom', 1.4)
        doTweenZoom('oppo3Z', 'camGame', 1, crochet * 0.004, 'sineOut')
    end
    if currentBeat == 984 then
        doTweenZoom('oppo3Z', 'camGame', 1.7, crochet * 0.008, 'sineInOut')
    end
    if currentBeat == 992 then
        doTweenZoom('oppo4Z', 'camGame', 1, crochet * 0.0015, 'expoOut')
    end
    if currentBeat > 992 and currentBeat < 1056 then
        if math.fmod(currentBeat - 2, 4) == 0 then
            setProperty('camGame.zoom', 1.5)
            doTweenZoom('oppo4Z', 'camGame', 1, crochet * 0.002, 'expoOut')
        end
    end
end
function onGameOver()
    loadSong('Seraphic', 'Seraphic', true);
	return Function_Stop;
end