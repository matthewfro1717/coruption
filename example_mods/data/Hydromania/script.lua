--this is so stupid lmao
function onCreate() --setting variables and making sprites
    setProperty('skipCountdown', true)
    setProperty('cpuControlled', false)
    makeLuaSprite('introfade', '', 0, 0)
    makeGraphic('introfade', 3000, 3000, '000000')
    setObjectCamera('introfade', 'other')
    addLuaSprite('introfade', true)
    makeLuaSprite('epicflash', '', 0, 0)
    makeGraphic('epicflash', 3000, 3000, 'FFFFFF')
    setObjectCamera('epicflash', 'other')
    addLuaSprite('epicflash', true)
    setProperty('epicflash.alpha', 0)
    doTweenAlpha('introfade1', 'introfade', 0, 1, 'linear')
    for i = 0, 7 do
        makeLuaSprite('strumwhite' .. i, '', 0, 0)
        makeGraphic('strumwhite' .. i, 10, 3000, 'FFFFFF')
        setObjectCamera('strumwhite' .. i, 'HUD')
        setProperty('strumwhite' .. i .. '.alpha', 0)
        addLuaSprite('strumwhite' .. i, false)
    end


    makeLuaText('dis', "Hydromania by Null_y34r, Remix by Emmperor Yami | This chart is meant to be like this", 600, 680
        , 0)
    doTweenAlpha('disbye', 'dis', 0, 8, 'linear')
    setTextSize('dis', 20)
    setTextColor('dis', 'FFFFFF')
    addLuaText('dis', true)
end

function onCreatePost()
    addChromaticAbberationEffect('camHud', 0.005)
    addChromaticAbberationEffect('camGame', 0.005)
end

function onUpdatePost(elapsed)
    setProperty("timeTxt.alpha", 0)
    setProperty("timeBar.alpha", 0)
end
