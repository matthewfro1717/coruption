function onEvent(name, value1, value2)
    if name == "Subtitles" then
        setTextString('subtitle', value1)
        setTextColor('subtitle', value2)
        runTimer('subtitleFade', 2, 1)
    end
end

function onCreate()
    fade = 0
    makeLuaText('subtitle', '', 1400, -105, 150)
    addLuaText('subtitle')
    setTextSize('subtitle', 40)
end

function onUpdate()
    fade = fade + 1
    if fade > 20000 then
        setTextString('subtitle', '')
    end
end