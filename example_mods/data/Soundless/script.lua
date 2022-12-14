--this is so stupid lmao
function onCreate() --setting variables and making sprites

    makeLuaText('dis', "Original Song by GoddessAwe (Quiet) | Cover by Emperor Yami", 600, 680, 0)
    doTweenAlpha('disbye','dis',0,8,'linear')
    setTextSize('dis', 20)
    setTextColor('dis', 'FFFFFF')
    addLuaText('dis',true)
end

function onUpdatePost()
	setProperty('introSoundsSuffix', '-dave')
    setProperty('timeBar.color', getColorFromHex('001678'))
    setProperty('timeBarBG.color', getColorFromHex('001678'))
end