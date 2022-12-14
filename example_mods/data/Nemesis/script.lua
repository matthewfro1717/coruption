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
    triggerEvent('Add Camera Zoom', '0', '5');
    doTweenAlpha('introfade1','introfade',0,20,'linear')
    setProperty("health", 2)
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
    setPropertyFromClass('ClientPrefs', 'downScroll', false);
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
        doTweenAlpha("cyrilltweena1", "dad", 1, 3, linear)
        doTweenAlpha("cyrilltweena2", "iconP2", 1, 3, linear)
        doFlash(1,1.5,'FFFFFF')
    end
    if curBeat == 728 then
        noteTweenY("notey1", 0, 0, 0.5, linear)
        noteTweenY("notey2", 1, 0, 0.5, linear)
        noteTweenY("notey3", 2, 0, 0.5, linear)
        noteTweenY("notey4", 3, 0, 0.5, linear)
    end
    if curBeat == 732 then
        noteTweenX("notex1", 0, defaultPlayerStrumX0, 0.5, linear)
        noteTweenX("notex2", 1, defaultPlayerStrumX1, 0.5, linear)
        noteTweenX("notex3", 2, defaultPlayerStrumX2, 0.5, linear)
        noteTweenX("notex4", 3, defaultPlayerStrumX3, 0.5, linear)
        noteTweenAlpha("notea1", 0, 1, 0.5, linear)
        noteTweenAlpha("notea2", 1, 1, 0.5, linear)
        noteTweenAlpha("notea3", 2, 1, 0.5, linear)
        noteTweenAlpha("notea4", 3, 1, 0.5, linear)
        noteTweenDirection("dir1", 0, 90, 0.1)
        noteTweenDirection("dir2", 1, 90, 0.1)
        noteTweenDirection("dir3", 2, 90, 0.1)
        noteTweenDirection("dir4", 3, 90, 0.1)
    end
    if (((curBeat >= 864) and (curBeat<=895)) or ((curBeat >= 928) and (curBeat<=959))) and (curBeat%4==0) then
        noteTweenX("notex1opp", 0, defaultOpponentStrumX0, 0.1, linear)
        noteTweenX("notex2opp", 1, defaultOpponentStrumX1, 0.1, linear)
        noteTweenX("notex3opp", 2, defaultOpponentStrumX2, 0.1, linear)
        noteTweenX("notex4opp", 3, defaultOpponentStrumX3, 0.1, linear)
    end
    if (((curBeat>=1120) and (curBeat<=1151)) or ((curBeat >= 1184) and (curBeat <= 1215))) and (curBeat%8==0) then
        noteTweenX("notex1opp2", 0, defaultOpponentStrumX0, 0.1, linear)
        noteTweenX("notex2opp2", 1, defaultOpponentStrumX1, 0.1, linear)
        noteTweenX("notex3opp2", 2, defaultOpponentStrumX1+100, 0.1, linear)
        noteTweenX("notex4opp2", 3, defaultOpponentStrumX3, 0.1, linear)
    end
    if (((curBeat>=1120) and (curBeat<=1151)) or ((curBeat >= 1184) and (curBeat <= 1215))) and (curBeat%8==4) then
        noteTweenX("notex1opp3", 0, defaultOpponentStrumX0, 0.1, linear)
        noteTweenX("notex2opp3", 1, defaultOpponentStrumX2-100, 0.1, linear)
        noteTweenX("notex3opp3", 2, defaultOpponentStrumX2, 0.1, linear)
        noteTweenX("notex4opp3", 3, defaultOpponentStrumX3, 0.1, linear)
    end
    if (((curBeat >= 864) and (curBeat<=895)) or ((curBeat >= 928) and (curBeat<=959)) or ((curBeat >= 1120) and (curBeat<=1151)) or ((curBeat >= 1184) and (curBeat <= 1215))) and (curBeat%4==2) then
        noteTweenX("notex1oppalt", 0, defaultPlayerStrumX0, 0.1, linear)
        noteTweenX("notex2oppalt", 1, defaultPlayerStrumX1, 0.1, linear)
        noteTweenX("notex3oppalt", 2, defaultPlayerStrumX2, 0.1, linear)
        noteTweenX("notex4oppalt", 3, defaultPlayerStrumX3, 0.1, linear)
    end
    if (((curBeat >= 896) and (curBeat<=927)) or ((curBeat >= 960) and (curBeat<=991))) and (curBeat%4==0) then
        noteTweenX("notex1pl", 4, defaultOpponentStrumX0, 0.1, linear)
        noteTweenX("notex2pl", 5, defaultOpponentStrumX1, 0.1, linear)
        noteTweenX("notex3pl", 6, defaultOpponentStrumX2, 0.1, linear)
        noteTweenX("notex4pl", 7, defaultOpponentStrumX3, 0.1, linear)
    end
    if (((curBeat >= 1152) and (curBeat <= 1183)) or ((curBeat >= 1216) and (curBeat <= 1247))) and (curBeat%8==0) then
        noteTweenX("notex1pl2", 4, defaultOpponentStrumX0, 0.1, linear)
        noteTweenX("notex2pl2", 5, defaultOpponentStrumX1, 0.1, linear)
        noteTweenX("notex3pl2", 6, defaultOpponentStrumX1+100, 0.1, linear)
        noteTweenX("notex4pl2", 7, defaultOpponentStrumX3, 0.1, linear)
    end
    if (((curBeat >= 1152) and (curBeat <= 1183)) or ((curBeat >= 1216) and (curBeat <= 1247))) and (curBeat%8==4) then
        noteTweenX("notex1pl3", 4, defaultOpponentStrumX0, 0.1, linear)
        noteTweenX("notex2pl3", 5, defaultOpponentStrumX2-100, 0.1, linear)
        noteTweenX("notex3pl3", 6, defaultOpponentStrumX2, 0.1, linear)
        noteTweenX("notex4pl3", 7, defaultOpponentStrumX3, 0.1, linear)
    end
    if (((curBeat >= 896) and (curBeat<=927)) or ((curBeat >= 960) and (curBeat<=991)) or ((curBeat >= 1152) and (curBeat <= 1183)) or ((curBeat >= 1216) and (curBeat <= 1247))) and (curBeat%4==2) then
        noteTweenX("notex1plalt", 4, defaultPlayerStrumX0, 0.1, linear)
        noteTweenX("notex2plalt", 5, defaultPlayerStrumX1, 0.1, linear)
        noteTweenX("notex3plalt", 6, defaultPlayerStrumX2, 0.1, linear)
        noteTweenX("notex4plalt", 7, defaultPlayerStrumX3, 0.1, linear)
    end
    if curBeat == 1376 then
        noteTweenX("notextr1", 0, defaultOpponentStrumX0, 0.1, linear)
        noteTweenX("notextr2", 1, defaultOpponentStrumX1, 0.1, linear)
        noteTweenX("notextr3", 2, defaultOpponentStrumX2, 0.1, linear)
        noteTweenX("notextr4", 3, defaultOpponentStrumX3, 0.1, linear)
        noteTweenX("noteytr1", 0, defaultOpponentStrumY0, 0.1, linear)
        noteTweenX("noteytr2", 1, defaultOpponentStrumY1, 0.1, linear)
        noteTweenX("noteytr3", 2, defaultOpponentStrumY2, 0.1, linear)
        noteTweenX("noteytr4", 3, defaultOpponentStrumY3, 0.1, linear)
        doFlash(1,1.5,'FFFFFF')
    end
    if curBeat == 1408 then
        doTweenAlpha("morpheustweena1", "dad", 1, 3, linear)
        doTweenAlpha("morpheustweena2", "iconP2", 1, 3, linear)
    end
    if curBeat == 2080 then
        doFlash(1,1.5,'FFFFFF')
    end
    if curBeat == 2084 then
        noteTweenX("manbinote1", 1, defaultPlayerStrumX1, 2, circInOut)
        noteTweenX("bfnote1", 5, defaultOpponentStrumX1, 2, circInOut)
    end
    if curBeat == 2088 then
        noteTweenX("manbinote2", 3, defaultPlayerStrumX3, 2, circInOut)
        noteTweenX("bfnote2", 7, defaultOpponentStrumX3, 2, circInOut)
    end
    if curBeat == 2092 then
        noteTweenAngle("manbiangle1", 0, 45, 2, circInOut)
        noteTweenDirection("manbidir1", 0, 45, 2)
    end
    if curBeat == 2096 then
        noteTweenAngle("bfangle1", 5, 45, 2, circInOut)
        noteTweenDirection("bfdir1", 5, 45, 2)
    end
    if curBeat == 2100 then
        noteTweenAngle("manbiangle2", 2, 45, 2, circInOut)
        noteTweenDirection("manbidir2", 2, 45, 2)
    end
    if curBeat == 2104 then
        noteTweenAngle("bfangle2", 7, 45, 2, circInOut)
        noteTweenDirection("bfdir2", 7, 45, 2)
    end
    if curBeat == 2108 then
        noteTweenAngle("bfangle3", 4, -45, 2, circInOut)
        noteTweenDirection("bfdir3", 4, 135, 2)
    end
    if curBeat == 2111 then
        doTweenAlpha("manbitweena1", "dad", 1, 3, linear)
        doTweenAlpha("manbitweena2", "iconP2", 1, 3, linear)
    end
    if curBeat == 2112 then
        noteTweenAngle("manbiangle3", 1, -45, 2, circInOut)
        noteTweenDirection("manbidir3", 1, 135, 2)
    end
    if curBeat == 2116 then
        noteTweenAngle("bfangle4", 6, -45, 2, circInOut)
        noteTweenDirection("bfdir4", 6, 135, 2)
    end
    if curBeat == 2120 then
        noteTweenAngle("manbiangle4", 3, -45, 2, circInOut)
        noteTweenDirection("manbidir4", 3, 135, 2)
    end
    if (((curBeat>=2336) and (curBeat<=2463))) and (curBeat%8==0) then
        noteTweenX("notesx1", 0, defaultPlayerStrumX0, 0.5, circInOut)
        noteTweenX("notesx2", 5, defaultPlayerStrumX1, 0.5, circInOut)
        noteTweenX("notesx3", 2, defaultPlayerStrumX2, 0.5, circInOut)
        noteTweenX("notesx4", 7, defaultPlayerStrumX3, 0.5, circInOut)
        noteTweenX("notesx5", 4, defaultOpponentStrumX0, 0.5, circInOut)
        noteTweenX("notesx6", 1, defaultOpponentStrumX1, 0.5, circInOut)
        noteTweenX("notesx7", 6, defaultOpponentStrumX2, 0.5, circInOut)
        noteTweenX("notesx8", 3, defaultOpponentStrumX3, 0.5, circInOut)
    end
    if (((curBeat>=2336) and (curBeat<=2463))) and (curBeat%8==2) then
        noteTweenAngle("notesa1", 0, -45, 0.5, circInOut)
        noteTweenAngle("notesa2", 5, -45, 0.5, circInOut)
        noteTweenAngle("notesa3", 2, -45, 0.5, circInOut)
        noteTweenAngle("notesa4", 7, -45, 0.5, circInOut)
        noteTweenAngle("notesa5", 4, 45, 0.5, circInOut)
        noteTweenAngle("notesa6", 1, 45, 0.5, circInOut)
        noteTweenAngle("notesa7", 6, 45, 0.5, circInOut)
        noteTweenAngle("notesa8", 3, 45, 0.5, circInOut)
        noteTweenDirection("notesd1", 0, 135, 1)
        noteTweenDirection("notesd2", 5, 135, 1)
        noteTweenDirection("notesd3", 2, 135, 1)
        noteTweenDirection("notesd4", 7, 135, 1)
        noteTweenDirection("notesd5", 4, 45, 1)
        noteTweenDirection("notesd6", 1, 45, 1)
        noteTweenDirection("notesd7", 6, 45, 1)
        noteTweenDirection("notesd8", 3, 45, 1)
    end
    if (((curBeat>=2336) and (curBeat<=2463))) and (curBeat%8==4) then
        noteTweenX("notesx1alt", 0, defaultOpponentStrumX0, 0.5, circInOut)
        noteTweenX("notesx2alt", 5, defaultOpponentStrumX1, 0.5, circInOut)
        noteTweenX("notesx3alt", 2, defaultOpponentStrumX2, 0.5, circInOut)
        noteTweenX("notesx4alt", 7, defaultOpponentStrumX3, 0.5, circInOut)
        noteTweenX("notesx5alt", 4, defaultPlayerStrumX0, 0.5, circInOut)
        noteTweenX("notesx6alt", 1, defaultPlayerStrumX1, 0.5, circInOut)
        noteTweenX("notesx7alt", 6, defaultPlayerStrumX2, 0.5, circInOut)
        noteTweenX("notesx8alt", 3, defaultPlayerStrumX3, 0.5, circInOut)
    end
    if ((curBeat>=2336) and (curBeat<=2463)) and (curBeat%8==6) then
        noteTweenAngle("notesa1alt", 0, 45, 0.5, circInOut)
        noteTweenAngle("notesa2alt", 5, 45, 0.5, circInOut)
        noteTweenAngle("notesa3alt", 2, 45, 0.5, circInOut)
        noteTweenAngle("notesa4alt", 7, 45, 0.5, circInOut)
        noteTweenAngle("notesa5alt", 4, -45, 0.5, circInOut)
        noteTweenAngle("notesa6alt", 1, -45, 0.5, circInOut)
        noteTweenAngle("notesa7alt", 6, -45, 0.5, circInOut)
        noteTweenAngle("notesa8alt", 3, -45, 0.5, circInOut)
        noteTweenDirection("notesd1alt", 0, 45, 0.5)
        noteTweenDirection("notesd2alt", 5, 45, 0.5)
        noteTweenDirection("notesd3alt", 2, 45, 0.5)
        noteTweenDirection("notesd4alt", 7, 45, 0.5)
        noteTweenDirection("notesd5alt", 4, 135, 0.5)
        noteTweenDirection("notesd6alt", 1, 135, 0.5)
        noteTweenDirection("notesd7alt", 6, 135, 0.5)
        noteTweenDirection("notesd8alt", 3, 135, 0.5)
    end
    if (((curBeat>=2592) and (curBeat<=2719))) and (curBeat%4==0) then
        noteTweenX("notesx1", 0, defaultPlayerStrumX0, 0.25, circInOut)
        noteTweenX("notesx2", 5, defaultPlayerStrumX1, 0.25, circInOut)
        noteTweenX("notesx3", 2, defaultPlayerStrumX2, 0.25, circInOut)
        noteTweenX("notesx4", 7, defaultPlayerStrumX3, 0.25, circInOut)
        noteTweenX("notesx5", 4, defaultOpponentStrumX0, 0.25, circInOut)
        noteTweenX("notesx6", 1, defaultOpponentStrumX1, 0.25, circInOut)
        noteTweenX("notesx7", 6, defaultOpponentStrumX2, 0.25, circInOut)
        noteTweenX("notesx8", 3, defaultOpponentStrumX3, 0.25, circInOut)
    end
    if (((curBeat>=2592) and (curBeat<=2719))) and (curBeat%4==1) then
        noteTweenAngle("notesa1", 0, -45, 0.25, circInOut)
        noteTweenAngle("notesa2", 5, -45, 0.25, circInOut)
        noteTweenAngle("notesa3", 2, -45, 0.25, circInOut)
        noteTweenAngle("notesa4", 7, -45, 0.25, circInOut)
        noteTweenAngle("notesa5", 4, 45, 0.25, circInOut)
        noteTweenAngle("notesa6", 1, 45, 0.25, circInOut)
        noteTweenAngle("notesa7", 6, 45, 0.25, circInOut)
        noteTweenAngle("notesa8", 3, 45, 0.25, circInOut)
        noteTweenDirection("notesd1", 0, 135, 0.25)
        noteTweenDirection("notesd2", 5, 135, 0.25)
        noteTweenDirection("notesd3", 2, 135, 0.25)
        noteTweenDirection("notesd4", 7, 135, 0.25)
        noteTweenDirection("notesd5", 4, 45, 0.25)
        noteTweenDirection("notesd6", 1, 45, 0.25)
        noteTweenDirection("notesd7", 6, 45, 0.25)
        noteTweenDirection("notesd8", 3, 45, 0.25)
    end
    if (((curBeat>=2592) and (curBeat<=2719))) and (curBeat%4==2) then
        noteTweenX("notesx1alt", 0, defaultOpponentStrumX0, 0.25, circInOut)
        noteTweenX("notesx2alt", 5, defaultOpponentStrumX1, 0.25, circInOut)
        noteTweenX("notesx3alt", 2, defaultOpponentStrumX2, 0.25, circInOut)
        noteTweenX("notesx4alt", 7, defaultOpponentStrumX3, 0.25, circInOut)
        noteTweenX("notesx5alt", 4, defaultPlayerStrumX0, 0.25, circInOut)
        noteTweenX("notesx6alt", 1, defaultPlayerStrumX1, 0.25, circInOut)
        noteTweenX("notesx7alt", 6, defaultPlayerStrumX2, 0.25, circInOut)
        noteTweenX("notesx8alt", 3, defaultPlayerStrumX3, 0.25, circInOut)
    end
    if ((curBeat>=2592) and (curBeat<=2719)) and (curBeat%4==3) then
        noteTweenAngle("notesa1", 0, 45, 0.25, circInOut)
        noteTweenAngle("notesa2", 5, 45, 0.25, circInOut)
        noteTweenAngle("notesa3", 2, 45, 0.25, circInOut)
        noteTweenAngle("notesa4", 7, 45, 0.25, circInOut)
        noteTweenAngle("notesa5", 4, -45, 0.25, circInOut)
        noteTweenAngle("notesa6", 1, -45, 0.25, circInOut)
        noteTweenAngle("notesa7", 6, -45, 0.25, circInOut)
        noteTweenAngle("notesa8", 3, -45, 0.25, circInOut)
        noteTweenDirection("notesd1", 0, 45, 0.25)
        noteTweenDirection("notesd2", 5, 45, 0.25)
        noteTweenDirection("notesd3", 2, 45, 0.25)
        noteTweenDirection("notesd4", 7, 45, 0.25)
        noteTweenDirection("notesd5", 4, 135, 0.25)
        noteTweenDirection("notesd6", 1, 135, 0.25)
        noteTweenDirection("notesd7", 6, 135, 0.25)
        noteTweenDirection("notesd8", 3, 135, 0.25)
    end
    if curBeat == 2720 then
        noteTweenAngle("notesa1", 0, 0, 0.25, circInOut)
        noteTweenAngle("notesa2", 5, 0, 0.25, circInOut)
        noteTweenAngle("notesa3", 2, 0, 0.25, circInOut)
        noteTweenAngle("notesa4", 7, 0, 0.25, circInOut)
        noteTweenAngle("notesa5", 4, 0, 0.25, circInOut)
        noteTweenAngle("notesa6", 1, 0, 0.25, circInOut)
        noteTweenAngle("notesa7", 6, 0, 0.25, circInOut)
        noteTweenAngle("notesa8", 3, 0, 0.25, circInOut)
        noteTweenDirection("notesd1", 0, 90, 0.25)
        noteTweenDirection("notesd2", 5, 90, 0.25)
        noteTweenDirection("notesd3", 2, 90, 0.25)
        noteTweenDirection("notesd4", 7, 90, 0.25)
        noteTweenDirection("notesd5", 4, 90, 0.25)
        noteTweenDirection("notesd6", 1, 90, 0.25)
        noteTweenDirection("notesd7", 6, 90, 0.25)
        noteTweenDirection("notesd8", 3, 90, 0.25)
    end
    if curBeat == 2721 then
        noteTweenX("notesx1", 0, defaultOpponentStrumX0, 0.5, circInOut)
        noteTweenX("notesx2", 5, defaultPlayerStrumX1, 0.5, circInOut)
        noteTweenX("notesx3", 2, defaultOpponentStrumX2, 0.5, circInOut)
        noteTweenX("notesx4", 7, defaultPlayerStrumX3, 0.5, circInOut)
        noteTweenX("notesx5", 4, defaultPlayerStrumX0, 0.5, circInOut)
        noteTweenX("notesx6", 1, defaultOpponentStrumX1, 0.5, circInOut)
        noteTweenX("notesx7", 6, defaultPlayerStrumX2, 0.5, circInOut)
        noteTweenX("notesx8", 3, defaultOpponentStrumX3, 0.5, circInOut)
    end
    if curBeat == 2784 then
        doFlash(1,1.5,'FFFFFF')
    end
    if curBeat == 2912 then
        doFlash(1,1.5,'FFFFFF')
        noteTweenAlpha("bye1", 0, 0, 0.5, linear)
        noteTweenAlpha("bye2", 1, 0, 0.5, linear)
        noteTweenAlpha("bye3", 2, 0, 0.5, linear)
        noteTweenAlpha("bye4", 3, 0, 0.5, linear)
        doTweenAlpha("bye5", "healthBarBG", 0, 0.5, linear)
        doTweenAlpha("bye6", "healthBar", 0, 0.5, linear)
        doTweenAlpha("bye7", "timeTxt", 0, 0.5, linear)
        doTweenAlpha("bye8", "iconP1", 0, 0.5, linear)
        doTweenAlpha("bye9", "iconP2", 0, 0.5, linear)
    end
    if curBeat == 2913 then
        doTweenAlpha("conbitweena1", "dad", 1, 3, linear)
        triggerEvent("Change Character", "bf", "ScaredBoyfriend")
    end
    if (curBeat >=2912) and (curBeat <= 3680) then
        noteTweenX("x1", 4, math.random(50, 1000), 0.5, circInOut)
        noteTweenX("x2", 5, math.random(50, 1000), 0.5, circInOut)
        noteTweenX("x3", 6, math.random(50, 1000), 0.5, circInOut)
        noteTweenX("x4", 7, math.random(50, 1000), 0.5, circInOut)
        noteTweenY("y1", 4, math.random(-100, 600), 0.5, circInOut)
        noteTweenY("y2", 5, math.random(-100, 600), 0.5, circInOut)
        noteTweenY("y3", 6, math.random(-100, 600), 0.5, circInOut)
        noteTweenY("y4", 7, math.random(-100, 500), 0.5, circInOut)
    end
    if curBeat == 3296 then
        doFlash(1,1.5,'FFFFFF')
    end
    if curBeat == 3424 then
        doFlash(1,1.5,'FFFFFF')
    end
    if curBeat == 3552 then
        doFlash(1,1.5,'FFFFFF')
    end
    if curBeat == 3548 then
        startCountdown()
    end
    if curBeat == 3296 then
        doFlash(1,1.5,'FFFFFF')
    end
    if curBeat == 3681 then
        doTweenAlpha('outrofade2','introfade',1,20,'linear')
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
end