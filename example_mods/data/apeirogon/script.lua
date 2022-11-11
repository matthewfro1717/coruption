local allowCountdown = false

function onCreate()
makeLuaSprite('corruptedyard', 'corruptedyard', -400, -400);
doTweenAlpha('lmao', 'corruptedyard', 0.7, 00000000000.1, 'linear')
makeLuaText('dis', "Apeirogon - Hortas", 600, 680, 0)
doTweenAlpha('disbye','dis',0,8,'linear')
setTextSize('dis', 20)
setTextColor('dis', 'FFFFFF')
addLuaText('dis',true)
end

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

function onUpdate()
	setProperty('timeBar.color', getColorFromHex('0080ff'))
    setProperty('timeBarBG.color', getColorFromHex('0080ff'))
end

function onBeatHit()
	if curBeat >= 64 then
		addLuaSprite('corruptedyard', false);
		playSound('sorry', 0.4, 'damn');
		triggerEvent('Change Character', '1', 'phobiadave');  
	end

	if curBeat >= 64.5 then
		triggerEvent('Screen Shake', '0, 0', '0, 0');
		triggerEvent('Change Character', '1', 'worrieddave');
		removeLuaSprite('corruptedyard', true)
	end

	if curBeat >= 65 then
		stopSound('damn');
		makeLuaSprite('corruptedyard', 'corruptedyard', -400, -400);
doTweenAlpha('lmao', 'corruptedyard', 0.7, 00000000000.1, 'linear')
	end
	if curBeat >= 156 then
		addLuaSprite('corruptedyard', false);
		playSound('sorry', 0.4, 'damn');
		triggerEvent('Change Character', '1', 'phobiadave');  
	end

	if curBeat >= 156.5 then
		triggerEvent('Screen Shake', '0, 0', '0, 0');
		triggerEvent('Change Character', '1', 'worrieddave');
		removeLuaSprite('corruptedyard', true)
	end

	if curBeat >= 157 then
		stopSound('damn');
		makeLuaSprite('corruptedyard', 'corruptedyard', -400, -400);
doTweenAlpha('lmao', 'corruptedyard', 0.7, 00000000000.1, 'linear')
	end

	if curBeat >= 257 then
		addLuaSprite('corruptedyard', false);
		playSound('sorry', 0.4, 'damn');
		triggerEvent('Change Character', '1', 'phobiadave');  
	end

	if curBeat >= 257.5 then
		triggerEvent('Screen Shake', '0, 0', '0, 0');
		triggerEvent('Change Character', '1', 'worrieddave');
		removeLuaSprite('corruptedyard', true)
	end

	if curBeat >= 258 then
		stopSound('damn');
		makeLuaSprite('corruptedyard', 'corruptedyard', -400, -400);
doTweenAlpha('lmao', 'corruptedyard', 0.7, 00000000000.1, 'linear')
	end
	
	if curBeat >= 260 then
		addLuaSprite('corruptedyard', false);
		playSound('sorry', 0.4, 'damn');
		triggerEvent('Change Character', '1', 'phobiadave');  
	end

	if curBeat >= 260.5 then
		triggerEvent('Screen Shake', '0, 0', '0, 0');
		triggerEvent('Change Character', '1', 'worrieddave');
		removeLuaSprite('corruptedyard', true)
	end

	if curBeat >= 261 then
		stopSound('damn');
		makeLuaSprite('corruptedyard', 'corruptedyard', -400, -400);
doTweenAlpha('lmao', 'corruptedyard', 0.7, 00000000000.1, 'linear')
	end

	if curBeat >= 286 then
		addLuaSprite('corruptedyard', false);
		playSound('sorry', 0.4, 'damn');
		triggerEvent('Change Character', '1', 'phobiadave');  
	end

	if curBeat >= 286.5 then
		triggerEvent('Screen Shake', '0, 0', '0, 0');
		triggerEvent('Change Character', '1', 'worrieddave');
		removeLuaSprite('corruptedyard', true)
	end

	if curBeat >= 287 then
		stopSound('damn');
		makeLuaSprite('corruptedyard', 'corruptedyard', -400, -400);
doTweenAlpha('lmao', 'corruptedyard', 0.7, 00000000000.1, 'linear')
	end
	if curBeat >= 305 then
		addLuaSprite('corruptedyard', false);
		playSound('sorry', 0.4, 'damn');
		triggerEvent('Change Character', '1', 'phobiadave');  
	end

	if curBeat >= 305.5 then
		triggerEvent('Screen Shake', '0, 0', '0, 0');
		triggerEvent('Change Character', '1', 'worrieddave');
		removeLuaSprite('corruptedyard', true)
	end

	if curBeat >= 306 then
		stopSound('damn');
		makeLuaSprite('corruptedyard', 'corruptedyard', -400, -400);
doTweenAlpha('lmao', 'corruptedyard', 0.7, 00000000000.1, 'linear')
	end

	if curBeat >= 315 then
		addLuaSprite('corruptedyard', false);
		playSound('sorry', 0.4, 'damn');
		triggerEvent('Change Character', '1', 'phobiadave');  
	end

	if curBeat >= 315.5 then
		triggerEvent('Screen Shake', '0, 0', '0, 0');
		triggerEvent('Change Character', '1', 'worrieddave');
		removeLuaSprite('corruptedyard', true)
	end

	if curBeat >= 316 then
		stopSound('damn');
		makeLuaSprite('corruptedyard', 'corruptedyard', -400, -400);
doTweenAlpha('lmao', 'corruptedyard', 0.7, 00000000000.1, 'linear')
	end

	if curBeat >= 323 then
		addLuaSprite('corruptedyard', false);
		playSound('sorry', 0.4, 'damn');
		triggerEvent('Change Character', '1', 'phobiadave');  
	end

	if curBeat >= 323.5 then
		triggerEvent('Screen Shake', '0, 0', '0, 0');
		triggerEvent('Change Character', '1', 'worrieddave');
		removeLuaSprite('corruptedyard', true)
	end

	if curBeat >= 324 then
		stopSound('damn');
		makeLuaSprite('corruptedyard', 'corruptedyard', -400, -400);
doTweenAlpha('lmao', 'corruptedyard', 0.7, 00000000000.1, 'linear')
	end

	if curBeat >= 382 then
		addLuaSprite('corruptedyard', false);
		playSound('sorry', 0.4, 'damn');
		triggerEvent('Change Character', '1', 'phobiadave');  
	end

	if curBeat >= 382.5 then
		triggerEvent('Screen Shake', '0, 0', '0, 0');
		triggerEvent('Change Character', '1', 'worrieddave');
		removeLuaSprite('corruptedyard', true)
	end

	if curBeat >= 383 then
		stopSound('damn');
		makeLuaSprite('corruptedyard', 'corruptedyard', -400, -400);
doTweenAlpha('lmao', 'corruptedyard', 0.7, 00000000000.1, 'linear')
	end

	if curBeat >= 385 then
		addLuaSprite('corruptedyard', false);
		playSound('sorry', 0.4, 'damn');
		triggerEvent('Change Character', '1', 'phobiadave');  
	end

	if curBeat >= 385.5 then
		triggerEvent('Screen Shake', '0, 0', '0, 0');
		triggerEvent('Change Character', '1', 'worrieddave');
	end

	if curBeat >= 386 then
		stopSound('damn');
	end
end