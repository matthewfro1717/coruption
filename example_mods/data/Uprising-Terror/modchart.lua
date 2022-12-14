local allowCountdown = false

function onCreate()
	setProperty('timeBar.color', getColorFromHex('0054ff'))
    setProperty('timeBarBG.color', getColorFromHex('0054ff'))
	makeLuaSprite('corruptedyard', 'corruptedyard', -400, -400);
	doTweenAlpha('lmao', 'corruptedyard', 0.85, 00000000000.1, 'linear')
	makeLuaSprite('whitebg', 'nil', -400, -400)
	doTweenAlpha('bgtween', 'whitebg', 1, 1.0, 'linear')
	addLuaSprite('whitebg',false)
	doTweenColor('davetween','dad', '000000', 1, 'linear')
	doTweenColor('bftween', 'boyfriend', '000000', 1, 'linear')
	doTweenColor('gftween', 'gf', '000000', 1, 'linear')
	makeAnimatedLuaSprite('jeff','jeff', -100, -1000)
	addAnimationByPrefix('jeff','loop','jeff',30,true)
	objectPlayAnimation('jeff','loop',true)
	setScrollFactor('jeff', 0.9, 0.9)
	scaleObject('jeff', 5, 5);
	triggerEvent('Add Camera Zoom', '0', '4');
	makeLuaSprite('white','whiteshit',-740,-380);
	setLuaSpriteScrollFactor('white', 0, 0);
	scaleObject('white', 2, 2)

	addLuaSprite('jeff', true);
end

function onUpdatePost()
	setProperty('introSoundsSuffix', '-dave')
end

function onSongStart()
	setProperty('songLength', 134000)
end

function onCountdownStarted()
	for i = 0, 3 do
		setPropertyFromGroup('opponentStrums', i, 'x', -900);
	end
end

function onBeatHit()
	if curBeat == 7 then
		removeLuaSprite('jeff', true)
		addLuaSprite('white', false);
	end
	if curBeat == 16 then
		doTweenColor('davetween1','dad', 'FFFFFF', 0.1, 'linear')
		doTweenColor('bftween1', 'boyfriend', 'FFFFFF', 0.1, 'linear')
		doTweenColor('gftween1', 'gf', 'FFFFFF', 0.1, 'linear')
	--  removeLuaSprite('white', 'linear', false)
		doTweenAlpha('whitetween1', 'white', 0,1, 'linear')
	end
	if curBeat == 17 then
		setProperty("iconP1.visible", false)
		setProperty("iconP2.visible", false)
		setProperty("healthBar.visible", false)
		setProperty("healthBarBG.visible", false)
		doTweenColor('davetween2','dad', '000000', 1, 'linear')
		doTweenColor('bftween2', 'boyfriend', '000000', 1, 'linear')
		doTweenColor('gftween2', 'gf', '000000', 1, 'linear')
		doTweenAlpha('whitetween2', 'white', 1,1,'linear')
	end
	if curBeat == 64 then
		makeLuaText('dis', "Uprising Terror by Emperor Yami", 600, 680, 0)
		doTweenAlpha('disbye','dis',0,8,'linear')
		setTextSize('dis', 20)
		setTextColor('dis', 'FFFFFF')
		addLuaText('dis',true)
	end
	if curBeat == 96 then
		doTweenColor('davetween3', 'dad', 'FFFFFF', 6, 'linear')
	end
	if curBeat == 112 then
		doTweenColor('bftween3', 'boyfriend', 'FFFFFF', 6, 'linear')
		doTweenColor('gftween3', 'gf', 'FFFFFF', 6, 'linear')
		doTweenAlpha('whitetween3', 'white', 0,1, 'linear')
	end
	if curBeat == 128 then
		setProperty("iconP1.visible", true)
		setProperty("iconP2.visible", true)
		setProperty("healthBar.visible", true)
		setProperty("healthBarBG.visible", true)
		cameraFlash('game', '0xFFFFFFFF', 1, true)
		removeLuaSprite('whitebg', true)
	end
	if curBeat == 138 then
		setProperty('timeBar.color', getColorFromHex('FFFFFF'))
		setProperty('timeBarBG.color', getColorFromHex('FFFFFF'))
		addLuaSprite('corruptedyard', false);
		triggerEvent('Change Character', '1', 'phobiadave')
	end
	if curBeat == 140 then
		removeLuaSprite('corruptedyard', false);
		triggerEvent('Change Character', '1', 'worrieddave')
		setProperty('timeBar.color', getColorFromHex('0054ff'))
    	setProperty('timeBarBG.color', getColorFromHex('0054ff'))
	end
	if curBeat == 253 then
		addLuaSprite('corruptedyard', false);
		triggerEvent('Change Character', '1', 'phobiadave')
		setProperty('timeBar.color', getColorFromHex('FFFFFF'))
		setProperty('timeBarBG.color', getColorFromHex('FFFFFF'))
	end
	if curBeat == 254 then
		removeLuaSprite('corruptedyard', false);
		triggerEvent('Change Character', '1', 'worrieddave')
		setProperty('timeBar.color', getColorFromHex('0054ff'))
    	setProperty('timeBarBG.color', getColorFromHex('0054ff'))
	end
	if curBeat == 256 then
		addLuaSprite('corruptedyard', false);
		triggerEvent('Change Character', '1', 'phobiadave')
		setProperty('timeBar.color', getColorFromHex('FFFFFF'))
		setProperty('timeBarBG.color', getColorFromHex('FFFFFF'))
	end
	if curBeat == 257 then
		removeLuaSprite('coruptedyard', false);
		triggerEvent('Change Character', '1', 'worrieddave')
		setProperty('timeBar.color', getColorFromHex('0054ff'))
    	setProperty('timeBarBG.color', getColorFromHex('0054ff'))
	end
	if curBeat == 335 then
		addLuaSprite('corruptedyard', false);
		triggerEvent('Change Character', '1', 'phobiadave')
		setProperty('timeBar.color', getColorFromHex('FFFFFF'))
		setProperty('timeBarBG.color', getColorFromHex('FFFFFF'))
	end
	if curBeat == 336 then
		removeLuaSprite('corruptedyard', false);
		triggerEvent('Change Character', '1', 'worrieddave')
		setProperty('timeBar.color', getColorFromHex('0054ff'))
    	setProperty('timeBarBG.color', getColorFromHex('0054ff'))
	end
	if curBeat == 380 then
		makeAnimatedLuaSprite('static','static', -600, -1000)
		addAnimationByPrefix('static','loop','static',30,true)
		objectPlayAnimation('static','loop',true)
		setScrollFactor('static', 0.9, 0.9)
		scaleObject('static', 10, 10);

		addLuaSprite('static', true);
	end

	if curBeat == 384 then
		setProperty('songLength', getPropertyFromClass('flixel.FlxG','sound.music.length'))
		addLuaSprite('corruptedyard', false);
		playSound('sorry', 0.4, 'damn');
		triggerEvent('Change Character', '1', 'phobiadave');  
		removeLuaSprite('static', true)
		setProperty('timeBar.color', getColorFromHex('FFFFFF'))
		setProperty('timeBarBG.color', getColorFromHex('FFFFFF'))
	end


end
function onStepHit()
	if curStep == 1036 then
		addLuaSprite('corruptedyard', false);
		triggerEvent('Change Character', '1', 'phobiadave')
		setProperty('timeBar.color', getColorFromHex('FFFFFF'))
		setProperty('timeBarBG.color', getColorFromHex('FFFFFF'))
	end
	if curStep == 1037 then
		removeLuaSprite('corruptedyard', false);
		triggerEvent('Change Character', '1', 'worrieddave')
		setProperty('timeBar.color', getColorFromHex('0054ff'))
    	setProperty('timeBarBG.color', getColorFromHex('0054ff'))
	end
	if curStep == 1038 then
		addLuaSprite('corruptedyard', false);
		triggerEvent('Change Character', '1', 'phobiadave')
		setProperty('timeBar.color', getColorFromHex('FFFFFF'))
		setProperty('timeBarBG.color', getColorFromHex('FFFFFF'))
	end
	if curStep == 1039 then
		removeLuaSprite('corruptedyard', false);
		triggerEvent('Change Character', '1', 'worrieddave')
		setProperty('timeBar.color', getColorFromHex('0054ff'))
    	setProperty('timeBarBG.color', getColorFromHex('0054ff'))
	end
end