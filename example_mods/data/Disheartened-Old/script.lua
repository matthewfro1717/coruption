function onCreatePost()
    addBloomEffect("hud", 0, 0);
    addBloomEffect("game", 0, 0);
    addScanlineEffect("hud");
    addChromaticAbberationEffect("game");
end

function onBeatHit()
	songPos = getSongPosition()
	local currentBeat = math.floor((songPos/1000)*(bpm/60))
    if curBeat > 176 then
        setProperty("iconP2.alpha", 0)
        setProperty("iconP1.alpha", 0)
        setProperty('timeTxt.color', getColorFromHex('FF0000'))
        setProperty('healthBar.color', getColorFromHex('FF0000'))
        setProperty('scoreTxt.color', getColorFromHex('FF0000'))
        setProperty('judgementCounter.color', getColorFromHex('FF0000'))
        doTweenColor('epic5','background','FFFFFF',crochet*0.001-0.01,'linear')
        setProperty('background.color', getColorFromHex('FF0000'))
        doTweenColor('epic1','timeTxt','000000',crochet*0.001-0.01,'linear')
        doTweenColor('epic2','healthBar','000000',crochet*0.001-0.01,'linear')
        doTweenColor('epic3','scoreTxt','000000',crochet*0.001-0.01,'linear')
        doTweenColor('epic4','judgementCounter','000000',crochet*0.001-0.01,'linear')
        doBloomPulse("hud")
        doBloomPulse("game")
    end

    if curBeat > 176 and curBeat < 1136 then
        triggerEvent('Screen Shake', '0.5, 0.005', '0.5, 0.005');
        triggerEvent('Screen Shake', '0.3, 0.005', '0.3, 0.005');
        triggerEvent('Screen Shake', '0.1, 0.005', '0.1, 0.005');
        triggerEvent('Add Camera Zoom', '0.05', '0.025');
    end



    if curBeat > 496 and curBeat < 720 then
        if curBeat % 2 == 0 then
            setProperty('timeTxt.color', getColorFromHex('0000FF'))
            setProperty('healthBar.color', getColorFromHex('0000FF'))
            setProperty('scoreTxt.color', getColorFromHex('0000FF'))
            setProperty('judgementCounter.color', getColorFromHex('0000FF'))
            doTweenColor('epic1','timeTxt','000000',crochet*0.001-0.01,'linear')
            doTweenColor('epic2','healthBar','000000',crochet*0.001-0.01,'linear')
            doTweenColor('epic3','scoreTxt','000000',crochet*0.001-0.01,'linear')
            doTweenColor('epic4','judgementCounter','000000',crochet*0.001-0.01,'linear')
        else
            setProperty('timeTxt.color', getColorFromHex('FF0000'))
            setProperty('healthBar.color', getColorFromHex('FF0000'))
            setProperty('scoreTxt.color', getColorFromHex('FF0000'))
            setProperty('judgementCounter.color', getColorFromHex('FF0000'))
            doTweenColor('epic1','timeTxt','000000',crochet*0.001-0.01,'linear')
            doTweenColor('epic2','healthBar','000000',crochet*0.001-0.01,'linear')
            doTweenColor('epic3','scoreTxt','000000',crochet*0.001-0.01,'linear')
            doTweenColor('epic4','judgementCounter','000000',crochet*0.001-0.01,'linear')
        end
    end


    if curBeat > 560 and curBeat < 720 then
        setProperty('timeTxt.color', getColorFromHex('FFFFFF'))
        setProperty('healthBar.color', getColorFromHex('FFFFFF'))
        setProperty('scoreTxt.color', getColorFromHex('FFFFFF'))
        setProperty('judgementCounter.color', getColorFromHex('FFFFFF'))
        doTweenColor('epic1','timeTxt','000000',crochet*0.001-0.01,'linear')
        doTweenColor('epic2','healthBar','000000',crochet*0.001-0.01,'linear')
        doTweenColor('epic3','scoreTxt','000000',crochet*0.001-0.01,'linear')
        doTweenColor('epic4','judgementCounter','000000',crochet*0.001-0.01,'linear')
        triggerEvent('Change Scroll Speed', '0.8', '0.005');
        triggerEvent('Change Scroll Speed', '1', '0.2');
    end

    
    if curBeat > 624 and curBeat < 752 then
        setProperty('timeTxt.color', getColorFromHex('0D0D0D'))
        setProperty('healthBar.color', getColorFromHex('0D0D0D'))
        setProperty('scoreTxt.color', getColorFromHex('0D0D0D'))
        setProperty('judgementCounter.color', getColorFromHex('0D0D0D'))
        doTweenColor('epic1','timeTxt','000000',crochet*0.001-0.01,'linear')
        doTweenColor('epic2','healthBar','000000',crochet*0.001-0.01,'linear')
        doTweenColor('epic3','scoreTxt','000000',crochet*0.001-0.01,'linear')
        doTweenColor('epic4','judgementCounter','000000',crochet*0.001-0.01,'linear')
        for i = 0,7 do
            noteTweenAngle('beatSpin' .. i,i,getPropertyFromGroup('strumLineNotes',i,'angle')+90,crochet*0.001-0.01,'expoOut')
        end
    end
    

    if curBeat > 752 and curBeat < 880 then
        setProperty('timeTxt.color', getColorFromHex('5D3FD3'))
        setProperty('healthBar.color', getColorFromHex('5D3FD3'))
        setProperty('scoreTxt.color', getColorFromHex('5D3FD3'))
        setProperty('judgementCounter.color', getColorFromHex('5D3FD3'))
        doTweenColor('epic1','timeTxt','000000',crochet*0.001-0.01,'linear')
        doTweenColor('epic2','healthBar','000000',crochet*0.001-0.01,'linear')
        doTweenColor('epic3','scoreTxt','000000',crochet*0.001-0.01,'linear')
        doTweenColor('epic4','judgementCounter','000000',crochet*0.001-0.01,'linear')
        triggerEvent('Add Camera Zoom', '0.1', '0');
        triggerEvent('Change Scroll Speed', '0.8', '0.005');
        triggerEvent('Change Scroll Speed', '1', '0.2');
        for i = 0,7 do
            noteTweenAngle('beatSpin' .. i,i,getPropertyFromGroup('strumLineNotes',i,'angle')-45,crochet*0.001-0.01,'expoOut')
        end
       end
    
    
    if curBeat > 880 then
        setProperty('timeTxt.color', getColorFromHex('FF0000'))
        setProperty('healthBar.color', getColorFromHex('FF0000'))
        setProperty('scoreTxt.color', getColorFromHex('FF0000'))
        setProperty('judgementCounter.color', getColorFromHex('FF0000'))
        doTweenColor('epic1','timeTxt','000000',crochet*0.001-0.01,'linear')
        doTweenColor('epic2','healthBar','000000',crochet*0.001-0.01,'linear')
        doTweenColor('epic3','scoreTxt','000000',crochet*0.001-0.01,'linear')
        doTweenColor('epic4','judgementCounter','000000',crochet*0.001-0.01,'linear')
     end
    
    
    if curBeat == 176 then
        doFlash(1,1.5,'000000')
        setProperty("TheTrueVoid.alpha",1)
    end

    if curBeat == 496 then
        doFlash(1,1.5,'000000')
    end

    if curBeat == 560 then
        doFlash(1,1.5,'000000')
    end
    if curBeat == 624 then
        doFlash(1,1.5,'000000')
    end
    if curBeat == 752 then
        doFlash(1,1.5,'000000')
    end

    if curBeat == 880 then
        for i = 0,7 do
            noteTweenAngle('beatSpin' .. i,i,0,crochet*0.001-0.01,'expoOut')
        end
        doFlash(0.8,1.5,'000000')
    end

end
function onCreate()
    setProperty("TheTrueVoid.alpha",0)
    setProperty('health', 0.05)
    setProperty('skipCountdown',true)
    makeLuaSprite('epicflash','',0,0)
    makeGraphic('epicflash',3000,3000,'FFFFFF')
    addLuaSprite('epicflash',true)
    setProperty('epicflash.alpha', 0)
    setObjectCamera('epicflash','other')
    makeLuaSprite('introfade','',0,0)
    makeGraphic('introfade',3000,3000,'000000')
    setObjectCamera('introfade','other')
    addLuaSprite('introfade',true)
    doTweenAlpha('introfade1','introfade',0,2,'linear')
    setProperty('timeTxt.color', getColorFromHex('000000'))
    setProperty('healthBar.color', getColorFromHex('000000'))
    setProperty('scoreTxt.color', getColorFromHex('000000'))
    setProperty('judgementCounter.color', getColorFromHex('000000'))
    makeLuaText('dis', "Old Disheartened by Emperor Yami. It was supposed to be access in debug on purpose.", 600, 680, 0)
    doTweenAlpha('disbye','dis',0,8,'linear')
    setTextSize('dis', 20)
    setTextColor('dis', 'FFFFFF')
    addLuaText('dis',true)
    makeLuaText('dis2', "Modchart Difficulty: 4.2 | Chart Difficulty: 8.3 | Overall Difficulty: 10", 0, 0, 200)
    doTweenAlpha('disbye2','dis2',0,16,'linear')
    setTextSize('dis2', 25)
    setTextColor('dis2', 'FF0000')
    addLuaText('dis2',true)
    makeLuaText('dis3', "Exosphere learns BF is immortal, this wont go well...", 0, 0, 300)
    doTweenAlpha('disbye3','dis3',0,8,'linear')
    setTextSize('dis3', 25)
    setTextColor('dis3', '5D3FD3')
    addLuaText('dis3',true)
end

function doFlash(brightness,length,color) --self explanatory
    setProperty('epicflash.alpha',brightness)
    setProperty('epicflash.color',getColorFromHex(color))
    doTweenAlpha('epicparts','epicflash',0,length,'sineOut')
end

function onGameOver()
    playSound('slice', 0.4);
    loadSong('Disheartened', 'Disheartened', true);
    return Function_Stop;
end

function onUpdate()
    noteTweenAlpha('itsnothere',0, 0, 0.001, 'sineOut')
    noteTweenAlpha('itsnothere1',1, 0, 0.001, 'sineOut')
    noteTweenAlpha('itsnothere2',2, 0, 0.001, 'sineOut')
    noteTweenAlpha('itsnothere3',3, 0, 0.001, 'sineOut')
    setProperty("timeBar.alpha",0)
    health = getProperty('health')
    if attemptedPause then
        setProperty('health', health-0.01);
    end
end
function opponentNoteHit()
if mustHitSection == false then
    health = getProperty('health')
    if getProperty('health') > 0.15 then
        setProperty('health', health- 0.015);
    end
end
end

function goodNoteHit()
    hp = getProperty('health')
    setProperty('health',hp+0.002)
end
function noteMiss()
    hp = getProperty('health')
    setProperty('health',hp-0.1)
end

function onGameOver()
    playSound('slice', 0.4);
    loadSong('Disregard', 'Disregard', true);
    return Function_Stop;
end


