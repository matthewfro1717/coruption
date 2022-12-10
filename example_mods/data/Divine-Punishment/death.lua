local deaths          = { "headlessfnf", "glowyeyes", "fire", "IMDEAD", "cooked", "shanked" }
local foldername      = "deathsdvp"
local length          = 0.7
local tweenEase       = "linear"
local pauseUntilClose = 3

function onGameOver()
    openCustomSubstate("death", true)
    return Function_Stop
end

function onCustomSubstateCreate(name)
    if name == "death" then
        makeLuaSprite("darknesss", "Blackout", 0, 0)
        setObjectCamera("darknesss", "other")
        addLuaSprite("darknesss", true)
        makeLuaSprite("deadboif", foldername .. "/" .. deaths[getRandomInt(1, #deaths)], 0, 0)
        setObjectCamera("deadboif", "other")
        setProperty("deadboif.alpha", 0)
        addLuaSprite("deadboif", true)
        local alphaEnd = 1
        if getPropertyFromClass("ClientPrefs", "gorestuff") then
            alphaEnd = 0
        end
        doTweenAlpha("deathent", "deadboif", alphaEnd, length, tweenEase)
    end
end

function onTweenCompleted(tag)
    if tag == "deathent" then
        runTimer("diebetahch", pauseUntilClose)

    end
end

function onTimerCompleted(tag, loops, loopsLeft)
    if tag == "diebetahch" then
        addHaxeLibrary("Sys")
        runHaxeCode("Sys.exit(0);");
    end
end
