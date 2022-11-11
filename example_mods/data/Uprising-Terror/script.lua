local allowCountdown = false

function onUpdatePost()
	setProperty('introSoundsSuffix', '-dave')
end

function onCreate()
	setProperty('timeBar.color', getColorFromHex('0080ff'))
    setProperty('timeBarBG.color', getColorFromHex('0080ff'))
	
	makeAnimatedLuaSprite('static','static', -600, -1000)
		addAnimationByPrefix('static','loop','static',30,true)
		objectPlayAnimation('static','loop',true)
		setScrollFactor('static', 0.9, 0.9)
		scaleObject('static', 10, 10);

		makeLuaSprite('white','whiteshit',-740,-380);
		setLuaSpriteScrollFactor('white', 0, 0);
		scaleObject('white', 2, 2)
		
makeLuaSprite('corruptedyard', 'corruptedyard', -400, -400);
doTweenAlpha('lmao', 'corruptedyard', 0.85, 00000000000.1, 'linear')
makeLuaText('dis', "Uprising Terror by Emperor Yami", 600, 680, 0)
doTweenAlpha('disbye','dis',0,8,'linear')
setTextSize('dis', 20)
setTextColor('dis', 'FFFFFF')
addLuaText('dis',true)

makeLuaSprite('blackbar', 'blackbar', -400, -200)
setLuaSpriteScrollFactor('blackbar', 0.9, 0.9); 
scaleObject('blackbar', 1, 1);
setObjectCamera('blackbar', 'camHUD')

makeLuaSprite('blackbar2', 'blackbar', -400, 590)
setLuaSpriteScrollFactor('blackbar2', 0.9, 0.9); 
setObjectCamera('blackbar2', 'camHUD')

scaleObject('blackbar2', 1, 1);

end

function onUpdate()
	noteTweenAlpha('itsnothere',0, 0, 0.001, 'sineOut')
	noteTweenAlpha('itsnothere1',1, 0, 0.001, 'sineOut')
	noteTweenAlpha('itsnothere2',2, 0, 0.001, 'sineOut')
	noteTweenAlpha('itsnothere3',3, 0, 0.001, 'sineOut')
	if (getSongPosition() < 600) then
		for i = 4, 7 do
			setPropertyFromGroup('strumLineNotes', i, 'alpha', 0)
		end
	end
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

function onBeatHit()

	if curBeat == 380 then
		setProperty('timeBar.color', getColorFromHex('FFFFFF'))
        setProperty('timeBarBG.color', getColorFromHex('FFFFFF'))
		triggerEvent('Change Character', '1', 'phobiadave');  
		addLuaSprite('static', true);
	end
	
	if curBeat == 384 then
			for i = 4,7 do
				setPropertyFromGroup('strumLineNotes',i,'y',150)
			end
		addLuaSprite('blackbar', true);
		addLuaSprite('blackbar2', true);
		triggerEvent('Change Character', '0', 'ScaredBoyfriend');  
		triggerEvent('Change Character', '2', 'gfworried');  
		removeLuaSprite('static', true)
		addLuaSprite('white', false);
		doTweenColor("coloBF1", "boyfriend", "000000", 1, "linear")
		doTweenColor("colorBR", "dad", "000000", 1, "sineInOut")
		doTweenColor("colorGthe", "gf", "000000", 1, "sineInOut")
	end
end