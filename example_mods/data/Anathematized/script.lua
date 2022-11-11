function onBeatHit()

    if curBeat > 352 and curBeat < 800 then 
		triggerEvent('Add Camera Zoom', '0.02', '0.04');
	end



    if curBeat == 352 then
        setProperty('health', 0.5)
        doFlash(1,1.5,'6A0DAD')
        setProperty("MansionHalls.alpha",1)
    end

end

function onCreate()
    setProperty("MansionHalls.alpha",0)
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
    setProperty('healthBar.alpha', 0)
    addLuaSprite('introfade',true)
    doTweenAlpha('introfade1','introfade',0,2,'linear')
    makeLuaText('dis', "Anathematized by Emperor Yami", 600, 680, 0)
    doTweenAlpha('disbye','dis',0,8,'linear')
    setTextSize('dis', 20)
    setTextColor('dis', 'FFFFFF')
    addLuaText('dis',true)
end

function doFlash(brightness,length,color) --self explanatory
    setProperty('epicflash.alpha',brightness)
    setProperty('epicflash.color',getColorFromHex(color))
    doTweenAlpha('epicparts','epicflash',0,length,'sineOut')
end


function onUpdate(elapsed)
	setProperty('timeBar.color', getColorFromHex('000000'))
    setProperty('timeBarBG.color', getColorFromHex('000000'))
    setProperty('timeTxt.color', getColorFromHex('000000'))
    noteTweenAlpha('itsnothere',0, 0, 0.001, 'sineOut')
    noteTweenAlpha('itsnothere1',1, 0, 0.001, 'sineOut')
    noteTweenAlpha('itsnothere2',2, 0, 0.001, 'sineOut')
    noteTweenAlpha('itsnothere3',3, 0, 0.001, 'sineOut')
    setProperty("timeBar.alpha",0)
end


function opponentNoteHit(ipiss, piss2, piss3, sus) -- SUS? SUS?SUS?SUS?SUS?SUS?SUS?SUS?SUS?SUS?SUS?SUS?SUS?SUS?SUS?SUS?SUS?SUS?SUS?SUS?SUS?SUS?SUS?SUS?SUS?SUS?SUS?SUS?SUS?SUS?SUS?SUS?SUS?SUS?
    if piss2 == 0 then
    --  triggerEvent('Screen Shake', '0.1, 0.01', '0.1, 0.01');
    elseif piss2 == 1 then
         --   triggerEvent('Screen Shake', '0.1, 0.01', '0.1, 0.01');
    elseif piss2 == 2 then
          --  triggerEvent('Screen Shake', '0.1, 0.01', '0.1, 0.01');
    elseif piss2 == 3 then
           -- triggerEvent('Screen Shake', '0.1, 0.01', '0.1, 0.01');
    end
   
    health = getProperty('health')
    if getProperty('health') > 0.05 then
        setProperty('health', health- 0.023);
    end
end

function goodNoteHit()
    hp = getProperty('health')
    setProperty('health',hp+0.005)
end
