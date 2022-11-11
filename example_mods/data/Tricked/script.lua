
local allowCountdown = false
function onStartCountdown()
	-- Block the first countdown and start a timer of 0.8 seconds to play the dialogue
	if not allowCountdown and isStoryMode and not seenCutscene then
		makeLuaSprite('banpungedd', 'banpunged', -200, -200)
		addLuaSprite('banpungedd', true)
		setProperty('inCutscene', true);
		runTimer('startDialogue', 0.8);
		allowCountdown = true;
		return Function_Stop;
	end
	removeLuaSprite('banpungedd', true);
	return Function_Continue;
end

function onTimerCompleted(tag, loops, loopsLeft)
	if tag == 'startDialogue' then -- Timer completed, play dialogue
		startDialogue('dialogue', 'canzies');
	end
end

function onUpdate()
	setProperty('timeBar.color', getColorFromHex('023020'))
	setProperty('timeBarBG.color', getColorFromHex('023020'))
end