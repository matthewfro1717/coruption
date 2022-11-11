function onUpdate()
	setProperty('timeBar.color', getColorFromHex('505050'))
    setProperty('timeBarBG.color', getColorFromHex('505050'))
end

function onCreate()
    makeLuaText('dis', "Disoriented by Hortas", 600, 680, 0)
    doTweenAlpha('disbye','dis',0,8,'linear')
    setTextSize('dis', 20)
    setTextColor('dis', 'FFFFFF')
    addLuaText('dis',true)
end