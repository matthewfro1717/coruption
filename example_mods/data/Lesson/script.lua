function onUpdate()
	setProperty('timeBar.color', getColorFromHex('FF0000'))
    setProperty('timeBarBG.color', getColorFromHex('FF0000'))
end

function onCreate()
    makeLuaText('dis', "Lesson by Emperor Yami", 600, 680, 0)
    doTweenAlpha('disbye','dis',0,8,'linear')
    setTextSize('dis', 20)
    setTextColor('dis', 'FFFFFF')
    addLuaText('dis',true)
end