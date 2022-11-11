local allowCountdown = false
function onStartCountdown()
	-- Block the first countdown and start a timer of 0.8 seconds to play the dialogue
	if not allowCountdown and isStoryMode and not seenCutscene then
		setProperty('inCutscene', true);
		runTimer('startDialogue', 0.8);
		allowCountdown = true;
		return Function_Stop;
	end
	return Function_Continue;
end

function onTimerCompleted(tag, loops, loopsLeft)
	if tag == 'startDialogue' then -- Timer completed, play dialogue
		startDialogue('dialogue', 'canzies');
	end
end

function onUpdate(elapsed)
	if curBeat >= 112 then
		doTweenColor("colorBR", "dad", "00FF00", 0.001, "sineInOut")
		doTweenColor("coloUH", "background", "00FF00", 0.001, "sineInOut")
		doTweenZoom('OhSHIT', 'camGame', 1.5, 0.13, 'sineOut')
		setProperty('timeBar.color', getColorFromHex('00ff00'))
		setProperty('timeBarBG.color', getColorFromHex('00ff00'))
	end

	if curBeat >= 119 then
		doTweenColor("colorBR", "dad", "FF0000", 0.001, "sineInOut")
		doTweenColor("coloUH", "background", "FF0000", 0.001, "sineInOut")
		doTweenZoom('OhSHIT', 'camGame', 1.3, 0.13, 'sineOut')
		setProperty('timeBar.color', getColorFromHex('850101'))
		setProperty('timeBarBG.color', getColorFromHex('850101'))
	end

	if curBeat >= 120 then
		doTweenColor("colorBR", "dad", "00FF00", 0.001, "sineInOut")
		doTweenColor("coloUH", "background", "00FF00", 0.001, "sineInOut")
		doTweenZoom('OhSHIT', 'camGame', 1.5, 0.13, 'sineOut')
		setProperty('timeBar.color', getColorFromHex('00ff00'))
		setProperty('timeBarBG.color', getColorFromHex('00ff00'))
	end

	if curBeat >= 121 then
		doTweenColor("colorBR", "dad", "FF0000", 0.001, "sineInOut")
		doTweenColor("coloUH", "background", "FF0000", 0.001, "sineInOut")
		doTweenZoom('OhSHIT', 'camGame', 1.3, 0.13, 'sineOut')
		setProperty('timeBar.color', getColorFromHex('850101'))
		setProperty('timeBarBG.color', getColorFromHex('850101'))
	end

	if curStep >= 486 then
		doTweenColor("colorBR", "dad", "00FF00", 0.001, "sineInOut")
		doTweenColor("coloUH", "background", "00FF00", 0.001, "sineInOut")
		doTweenZoom('OhSHIT', 'camGame', 1.5, 0.13, 'sineOut')
		setProperty('timeBar.color', getColorFromHex('00ff00'))
		setProperty('timeBarBG.color', getColorFromHex('00ff00'))
	end

	if curBeat >= 122 then
		doTweenColor("colorBR", "dad", "FF0000", 0.001, "sineInOut")
		doTweenColor("coloUH", "background", "FF0000", 0.001, "sineInOut")
		doTweenZoom('OhSHIT', 'camGame', 1.3, 0.13, 'sineOut')
		setProperty('timeBar.color', getColorFromHex('850101'))
		setProperty('timeBarBG.color', getColorFromHex('850101'))
	end

	if curStep >= 490 then
		doTweenColor("colorBR", "dad", "00FF00", 0.001, "sineInOut")
		doTweenColor("coloUH", "background", "00FF00", 0.001, "sineInOut")
		doTweenZoom('OhSHIT', 'camGame', 1.5, 0.13, 'sineOut')
		setProperty('timeBar.color', getColorFromHex('00ff00'))
		setProperty('timeBarBG.color', getColorFromHex('00ff00'))
	end

	if curBeat >= 123 then
		doTweenColor("colorBR", "dad", "FF0000", 0.001, "sineInOut")
		doTweenColor("coloUH", "background", "FF0000", 0.001, "sineInOut")
		doTweenZoom('OhSHIT', 'camGame', 1.3, 0.13, 'sineOut')
		setProperty('timeBar.color', getColorFromHex('850101'))
		setProperty('timeBarBG.color', getColorFromHex('850101'))
	end

	if curBeat >= 224 then
		doTweenColor("colorBR", "dad", "505050", 1, "quadOut")
		doTweenColor("coloUH", "background", "505050", 1, "quadOut")
		doTweenZoom('OhSHIT', 'camGame', 1.3, 0.13, 'sineOut')
		doTweenColor("colortime", "timeBar", "505050", 1, "quadOut")
		doTweenColor("colotimebg", "timeBarBG", "505050", 1, "quadOut")
    end
	noteTweenAlpha('itsnothere',0, 0.4, 0.001, 'sineOut')
    noteTweenAlpha('itsnothere1',1, 0.4, 0.001, 'sineOut')
    noteTweenAlpha('itsnothere2',2, 0.4, 0.001, 'sineOut')
    noteTweenAlpha('itsnothere3',3, 0.4, 0.001, 'sineOut')
end



function onCreate()

	setProperty('timeBar.color', getColorFromHex('505050'))
	setProperty('timeBarBG.color', getColorFromHex('505050'))

    windowX1 = getPropertyFromClass('openfl.Lib', 'application.window.x')+11050
    windowY1 = getPropertyFromClass('openfl.Lib', 'application.window.y')+11000
  windowX2 = getPropertyFromClass('openfl.Lib', 'application.window.x')+10050
  windowY2 = getPropertyFromClass('openfl.Lib', 'application.window.y')+10000
  windowX3 = getPropertyFromClass('openfl.Lib', 'application.window.x')+10000
  windowY3 = getPropertyFromClass('openfl.Lib', 'application.window.y')+10000
  setProperty("dad.scale.x", 0.6)
  setProperty("dad.scale.y", 0.6)
  setProperty("boyfriend.scale.x", 0.6)
  setProperty("boyfriend.scale.y", 0.6)

	setProperty("gf.alpha", 0)
	makeLuaText('dis', "Doomed by Oxy", 600, 680, 0)
    doTweenAlpha('disbye','dis',0,8,'linear')
    setTextSize('dis', 20)
    setTextColor('dis', 'FFFFFF')
    addLuaText('dis',true)
end


easingstyle = "sineInOut"

function onSongStart()
	notePosX0 = getPropertyFromGroup('opponentStrums', 0, 'x')
	notePosX1 = getPropertyFromGroup('opponentStrums', 1, 'x')
	notePosX2 = getPropertyFromGroup('opponentStrums', 2, 'x')
	notePosX3 = getPropertyFromGroup('opponentStrums', 3, 'x')
	notePosX4 = getPropertyFromGroup('playerStrums', 0, 'x')
	notePosX5 = getPropertyFromGroup('playerStrums', 1, 'x')
	notePosX6 = getPropertyFromGroup('playerStrums', 2, 'x')
	notePosX7 = getPropertyFromGroup('playerStrums', 3, 'x')

	noteTweenX("0", 0, (notePosX0 + 600), 0.5, easingstyle)
	noteTweenX("02", 1, (notePosX1 + 600), 0.5, easingstyle)
	noteTweenX("03", 2, (notePosX2 + 600), 0.5, easingstyle)
	noteTweenX("04", 3, (notePosX3 + 600), 0.5, easingstyle)
	noteTweenX("05", 4, (notePosX4 - 600), 0.5, easingstyle)
	noteTweenX("06", 5, (notePosX5 - 600), 0.5, easingstyle)
	noteTweenX("07", 6, (notePosX6 - 600), 0.5, easingstyle)
	noteTweenX("08", 7, (notePosX7 - 600), 0.5, easingstyle)
end

function onTweenCompleted(tag)
	notePosX0 = getPropertyFromGroup('opponentStrums', 0, 'x')
	notePosX1 = getPropertyFromGroup('opponentStrums', 1, 'x')
	notePosX2 = getPropertyFromGroup('opponentStrums', 2, 'x')
	notePosX3 = getPropertyFromGroup('opponentStrums', 3, 'x')
	notePosX4 = getPropertyFromGroup('playerStrums', 0, 'x')
	notePosX5 = getPropertyFromGroup('playerStrums', 1, 'x')
	notePosX6 = getPropertyFromGroup('playerStrums', 2, 'x')
	notePosX7 = getPropertyFromGroup('playerStrums', 3, 'x')

	if tag == "0" then
		noteTweenX("1", 0, (notePosX0 - 600), 0.5, easingstyle)
		noteTweenX("12", 1, (notePosX1 - 600), 0.5, easingstyle)
		noteTweenX("13", 2, (notePosX2 - 600), 0.5, easingstyle)
		noteTweenX("14", 3, (notePosX3 - 600), 0.5, easingstyle)

		noteTweenX("15", 4, (notePosX4 + 600), 0.5, easingstyle)
		noteTweenX("16", 5, (notePosX5 + 600), 0.5, easingstyle)
		noteTweenX("17", 6, (notePosX6 + 600), 0.5, easingstyle)
		noteTweenX("18", 7, (notePosX7 + 600), 0.5, easingstyle)
	end
	if tag == "1" then
		noteTweenX("0", 0, (notePosX0 + 600), 0.5, easingstyle)
		noteTweenX("02", 1, (notePosX1 + 600), 0.5, easingstyle)
		noteTweenX("03", 2, (notePosX2 + 600), 0.5, easingstyle)
		noteTweenX("04", 3, (notePosX3 + 600), 0.5, easingstyle)
		noteTweenX("05", 4, (notePosX4 - 600), 0.5, easingstyle)
		noteTweenX("06", 5, (notePosX5 - 600), 0.5, easingstyle)
		noteTweenX("07", 6, (notePosX6 - 600), 0.5, easingstyle)
		noteTweenX("08", 7, (notePosX7 - 600), 0.5, easingstyle)
	end
end
