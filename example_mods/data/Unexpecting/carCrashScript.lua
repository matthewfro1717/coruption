function onCreatePost()

    dadPositionX = getProperty("dad.x")
    dadPositionY = getProperty("dad.y")
    dadMaxX = dadPositionX+5000
    dadMaxY = dadPositionY+5000
    precacheSound("carCrash")
    makeLuaText('dis', "credits to Piggyfriend1792", 600, 680, 0)
    doTweenAlpha('disbye','dis',0,3,'linear')
    setTextSize('dis', 20)
    setTextColor('dis', 'FFFFFF')
    addLuaText('dis',true)
end

function onCreate()

end

function opponentNoteHit(id, direction, noteType, isSustainNote)
    
    if isSustainNote == false then
        if direction == 0 then
            doTweenX("dadTweenCrash", "dad", (-1 * dadMaxX), 0.6, "expoIn")
        elseif direction == 1 then
            doTweenY("dadTweenCrash", "dad", dadMaxY, 0.6, "expoIn")
        elseif direction == 2 then
            doTweenY("dadTweenCrash", "dad", (-1 * dadMaxY), 0.6, "expoIn")
        elseif direction == 3 then
            doTweenX("dadTweenCrash", "dad", dadMaxX, 0.6, "expoIn")
        end
    end

end

function onUpdate(elapsed)
    noteTweenAlpha('itsnothere',0, 0, 0.001, 'sineOut')
    noteTweenAlpha('itsnothere1',1, 0, 0.001, 'sineOut')
    noteTweenAlpha('itsnothere2',2, 0, 0.001, 'sineOut')
    noteTweenAlpha('itsnothere3',3, 0, 0.001, 'sineOut')
    if getProperty("dad.x") >= (dadMaxX) or getProperty("dad.x") <= (-1*dadMaxX) or getProperty("dad.y") >= (dadMaxY) or getProperty("dad.y") <= (-1*dadMaxY) then
        playSound("carCrash",2)
        triggerEvent('Screen Shake', '0.35, 0.05', '')
        doTweenX("dadTweenX","dad", dadPositionX, 2, "expoOut")
        doTweenY("dadTweenY","dad", dadPositionY, 2, "expoOut")
    end     
end


