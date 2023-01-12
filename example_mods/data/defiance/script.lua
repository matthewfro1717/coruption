function onUpdate()
    setProperty('timeBar.color', getColorFromHex('5D3FD3'))
    setProperty('timeBarBG.color', getColorFromHex('5D3FD3'))
end

function onUpdatePost()
	setProperty('introSoundsSuffix', '-exosphere')
end
function onCreate()
    setProperty('skipCountdown',true)
    makeLuaSprite('introfade','',0,0)
    makeGraphic('introfade',3000,3000,'000000')
    setObjectCamera('introfade','other')
    addLuaSprite('introfade',true)
    doTweenAlpha('introfade1','introfade',0,10,'linear')
end