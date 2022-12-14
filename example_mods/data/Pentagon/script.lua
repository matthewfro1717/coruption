function onUpdatePost()
    setProperty('introSoundsSuffix', '-dave')
	setProperty('ratingsData[0].image', 'og-sick')
    setProperty('ratingsData[1].image', 'og-good')
    setProperty('ratingsData[2].image', 'og-bad')
    setProperty('ratingsData[3].image', 'og-shit')
	setProperty("comboSuffix", "-og") -- HEY IF YOU ARE GONNA USE THIS TYPE OF SCRIPT TO YOUR MOD, THIS WAS ONLY CODED FOR THIS MOD. Thanks Raf
end

function onCountdownTick(tick)
	if tick == 1 then
		loadGraphic('countdownReady', 'og-ready')
		   elseif tick == 2 then
		loadGraphic('countdownSet', 'og-set')
		  elseif tick == 3 then
		loadGraphic('countdownGo', 'og-go')
	end
  end
