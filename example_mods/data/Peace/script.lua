
local attemptedPause = false


function onPause()
    addLuaText('pausestopper')
    attemptedPause = true
	return Function_Stop;
end

function onUpdate()
  noteTweenAlpha('itsnothere4',4, 0, 0.001, 'sineOut')
  noteTweenAlpha('itsnothere5',5, 0, 0.001, 'sineOut')
  noteTweenAlpha('itsnothere6',6, 0, 0.001, 'sineOut')
  noteTweenAlpha('itsnothere7',7, 0, 0.001, 'sineOut')
  noteTweenAlpha('itsnothere',0, 0, 0.001, 'sineOut')
  noteTweenAlpha('itsnothere1',1, 0, 0.001, 'sineOut')
  noteTweenAlpha('itsnothere2',2, 0, 0.001, 'sineOut')
  noteTweenAlpha('itsnothere3',3, 0, 0.001, 'sineOut')
end

  
  
  
  function onCreate()
      windowX1 = getPropertyFromClass('openfl.Lib', 'application.window.x')+11050
      windowY1 = getPropertyFromClass('openfl.Lib', 'application.window.y')+11000
    windowX2 = getPropertyFromClass('openfl.Lib', 'application.window.x')+10050
    windowY2 = getPropertyFromClass('openfl.Lib', 'application.window.y')+10000
    windowX3 = getPropertyFromClass('openfl.Lib', 'application.window.x')+10000
    windowY3 = getPropertyFromClass('openfl.Lib', 'application.window.y')+10000
    setProperty("timeBar.alpha", 0)
    setProperty("healthBar.alpha", 0)
      setProperty("boyfriend.alpha", 0.009)
      setProperty("girlfriend.scale.x", 0.7)
      setProperty("girlfriend.scale.y", 0.7)
      setProperty("dad.alpha", 0.009)
  end
  
  function goodNoteHit()
    health = getProperty('health')
      setProperty('health', health - 0.0001);
  end

    