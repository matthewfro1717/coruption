--this is so stupid lmao
function onCreate() --setting variables and making sprites
	setProperty('skipCountdown',true)
    setProperty('cpuControlled', false)
    makeLuaSprite('introfade','',0,0)
    makeGraphic('introfade',3000,3000,'000000')
    setObjectCamera('introfade','other')
    addLuaSprite('introfade',true)
    makeLuaSprite('epicflash','',0,0)
    makeGraphic('epicflash',3000,3000,'FFFFFF')
    setObjectCamera('epicflash','other')
    addLuaSprite('epicflash',true)
    setProperty('epicflash.alpha', 0)
    addChromaticAbberationEffect('camHud', 0.005)
    addChromaticAbberationEffect('camGame', 0.005)
    triggerEvent('Add Camera Zoom', '0', '5');
    doTweenAlpha('introfade1','introfade',0,20,'linear')
    for i = 0,7 do
        makeLuaSprite('strumwhite' .. i,'',0,0)
        makeGraphic('strumwhite' .. i,10,3000,'FFFFFF')
        setObjectCamera('strumwhite' .. i,'HUD')
        setProperty('strumwhite' .. i .. '.alpha',0)
        addLuaSprite('strumwhite' .. i,false)
    end
	makeLuaText('dis2', "Ghost Tapping is off.. GL", 600, 350, 400)
    doTweenAlpha('disbye2','dis2',0,15,'linear')
    setTextSize('dis2', 10)
    setTextColor('dis2', 'FF0000')
    addLuaText('dis2',true)

    setPropertyFromClass('ClientPrefs', 'ghostTapping', false);
end

function doFlash(brightness,length,color) --self explanatory
    setProperty('epicflash.alpha',brightness)
    setProperty('epicflash.color',getColorFromHex(color))
    doTweenAlpha('epicparts','epicflash',0,length,'sineOut')
end


function onUpdate()
    setProperty("timeBar.alpha",0)
end

function onBeatHit()

    if curBeat == 64 then
        doFlash(1,1.5,'FFFFFF')
    end

    if curBeat == 608 then
        doFlash(1,1.5,'FFFFFF')
    end

    if curBeat == 1376 then
        doFlash(1,1.5,'FFFFFF')
    end
    if curBeat == 2080 then
        doFlash(1,1.5,'FFFFFF')
    end
    if curBeat == 2784 then
        doFlash(1,1.5,'FFFFFF')
    end
    if curBeat == 2912 then
        doFlash(1,1.5,'FFFFFF')
    end
    if curBeat == 3104 then
        doFlash(1,1.5,'FFFFFF')
    end
    if curBeat == 3168 then
        doFlash(1,1.5,'FFFFFF')
    end
    if curBeat == 3232 then
        doFlash(1,1.5,'FFFFFF')
    end
    if curBeat == 3296 then
        doFlash(1,0.7,'FFFFFF')
    end
    if curBeat == 3324 then
        doFlash(1,0.7,'FFFFFF')
    end
    if curBeat == 3424 then
        doFlash(1,1,'FFFFFF')
    end
    if curBeat == 3552 then
        doFlash(1,0.7,'FFFFFF')
    end
    
    if curBeat == 3580 then
        doFlash(1,0.7,'FFFFFF')
    end

    if curBeat == 3616 then
        doFlash(1,0.7,'FFFFFF')
    end
    if curBeat == 3680 then
        doFlash(1,0.7,'FFFFFF')
    end

end
bruh = 15 --how many pixels the screen moves per note hit
function opponentNoteHit(ipiss, piss2, piss3, sus) -- SUS? SUS?SUS?SUS?SUS?SUS?SUS?SUS?SUS?SUS?SUS?SUS?SUS?SUS?SUS?SUS?SUS?SUS?SUS?SUS?SUS?SUS?SUS?SUS?SUS?SUS?SUS?SUS?SUS?SUS?SUS?SUS?SUS?SUS?
    if curBeat > 0 and curBeat < 608 then
        if piss2 == 0 then
            setPropertyFromClass('openfl.Lib','application.window.x', getPropertyFromClass('openfl.Lib','application.window.x')-bruh)
            triggerEvent('Screen Shake', '0.1, 0.01', '0.1, 0.01');
          elseif piss2 == 1 then
            setPropertyFromClass('openfl.Lib','application.window.y', getPropertyFromClass('openfl.Lib','application.window.y')+bruh)
                  triggerEvent('Screen Shake', '0.1, 0.01', '0.1, 0.01');
          elseif piss2 == 2 then
            setPropertyFromClass('openfl.Lib','application.window.y', getPropertyFromClass('openfl.Lib','application.window.y')-bruh)
                  triggerEvent('Screen Shake', '0.1, 0.01', '0.1, 0.01');
          elseif piss2 == 3 then
            setPropertyFromClass('openfl.Lib','application.window.x', getPropertyFromClass('openfl.Lib','application.window.x')+bruh)
                  triggerEvent('Screen Shake', '0.1, 0.01', '0.1, 0.01');
          
        end
    
        
    end

  
    health = getProperty('health')
	if getProperty('health') > 0.15 then
		setProperty('health', health- 0.005)
	end
    end

    

