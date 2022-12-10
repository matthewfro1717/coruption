function onCreatePost()
    addBloomEffect("hud", 0, 0);
    addBloomEffect("game", 0, 0);
    setTextFont('timeTxt', 'gillsans.ttf')
    setTextFont('scoreTxt','gillsans.ttf')
    setTextFont('missesTxt','gillsans.ttf')
    makeLuaText('kadeEngineWatermark',' The death penalty will suit for your treason...', 0, 4, getProperty('healthBarBG.y') + 55)
    setTextSize('kadeEngineWatermark', 16)
    setTextBorder('kadeEngineWatermark', 1, '000000')
    addLuaText('kadeEngineWatermark')
    setObjectCamera('kadeEngineWatermark', 'hud')
    setTextFont('kadeEngineWatermark', 'gillsans.ttf')
    setProperty("timeBar.visible", false)
    setProperty("timeTxt.visible", false)
    setProperty("scoreTxt.visible", false)
    setProperty("healthBar.visible", false)
    setProperty("healthBarBG.visible", false)
    setProperty("timeBarBG.visible", false)
    if downscroll then
        setProperty('kadeEngineWatermark.y', screenHeight * 0.9 + 49)
    end

    -- Hides the watermark to replace the new one
    setProperty("watermarkTxt.alpha", 0)
end

function onBeatHit()
    if curBeat == 40 then
        setProperty("timeTxt.alpha",1)
        setProperty("scoreTxt.alpha",1)
    end

    if curBeat == 80 then
        doBloomPulse("hud")
        doBloomPulse("game")
    end

    if curBeat == 64 then
		setProperty("timeTxt.visible", true)
        setProperty("scoreTxt.visible", true)
        setProperty("healthBar.visible", true)
        setProperty("healthBarBG.visible", true)
    end
    if curBeat > 96 and curBeat < 698 then
        triggerEvent('Add Camera Zoom', '0.01', '0.01');
        triggerEvent('Screen Shake', '0.05, 0.01', '0.05, 0.005');
        triggerEvent('Screen Shake', '0.05, 0.005', '0.05, 0.005');
        doBloomPulse("hud")
    end
    if curBeat > 816 then
        triggerEvent('Add Camera Zoom', '0.02', '0.02');
        triggerEvent('Screen Shake', '0.05, 0.02', '0.05, 0.01');
        triggerEvent('Screen Shake', '0.05, 0.01', '0.05, 0.01');
        doBloomPulse("hud")
    end
end


function opponentNoteHit(ipiss, piss2, piss3, sus) -- SUS? SUS?SUS?SUS?SUS?SUS?SUS?SUS?SUS?SUS?SUS?SUS?SUS?SUS?SUS?SUS?SUS?SUS?SUS?SUS?SUS?SUS?SUS?SUS?SUS?SUS?SUS?SUS?SUS?SUS?SUS?SUS?SUS?SUS?
    if piss2 == 0 then
      triggerEvent('Add Camera Zoom', '0.01', '0.005');
    elseif piss2 == 1 then
        triggerEvent('Add Camera Zoom', '0.01', '0.005');
    elseif piss2 == 2 then
        triggerEvent('Add Camera Zoom', '0.01', '0.005');
    elseif piss2 == 3 then
        triggerEvent('Add Camera Zoom', '0.01', '0.005');
    end
end
      
function onCreate()
    health = getProperty('health')
    setProperty('health', 2)
    setProperty('skipCountdown',true)
    setProperty('cpuControlled', false)
    setProperty("judgementCounter.alpha", 0)
    makeLuaSprite('introfade','',0,0)
    makeGraphic('introfade',3000,3000,'FFFFFF')
    setObjectCamera('introfade','other')
    addLuaSprite('introfade',true)
    makeLuaSprite('epicflash','',0,0)
    makeGraphic('epicflash',3000,3000,'FFFFFF')
    setObjectCamera('epicflash','other')
    addLuaSprite('epicflash',true)
    setProperty('epicflash.alpha', 0)
    doTweenAlpha('introfade1','introfade',0,1,'linear')
    makeLuaText('dis', "DIVINE PUNISHMENT by EpicRandomness11", 600, 680, 0)
    doTweenAlpha('disbye','dis',0,8,'linear')
    setTextSize('dis', 20)
    setTextColor('dis', 'FFFFFF')
    addLuaText('dis',true)
end



function goodNoteHit()
    health = getProperty('health')
      setProperty('health', health - 0.023);
  end

