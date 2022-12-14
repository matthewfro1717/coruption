function onCreate()
    setProperty("camHUD.alpha", 0)
end
function onBeatHit()

    if curBeat == 17 then
        doTweenAlpha("tweenhud","camHUD", 1, 5, "linear")
    end
    if curBeat == 32 then
        makeLuaSprite("blackscreen", nil, 0, 0)
        makeGraphic("blackscreen", 6000, 6000, "000000")
        setObjectCamera("blackscreen", "other")
        doTweenAlpha("screen", "blackscreen", 1, 0.0000001, "linear")
        addLuaSprite("blackscreen", true)
    end
    if curBeat == 36 then
        doTweenAlpha("fadein", 'blackscreen', 0, 10, "circInOut")
    end
    if curBeat == 600 then
        doTweenAlpha("fadeout", 'blackscreen', 1, 12, "linear")
    end
    
end
