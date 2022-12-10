

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

function onGameOver()
    loadSong('Seraphic', 'Seraphic', true);
	return Function_Stop;
end