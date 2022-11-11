local angleshit = 0;
local anglevar = 0;
local theepic = true;
local camMovement = 20
local velocity = 5

--leave this ones alone--
local campointx = 0
local campointy = 0
local camlockx = 0
local camlocky = 0
local camlock = false
local bfturn = false

function onBeatHit()
    if curBeat > 0 then
        if curBeat % 2 == 0 then
            angleshit = anglevar;

			--doTweenZoom('OhSHIT', 'camGame', 1.5, 0.13, 'sineOut')
        else
            angleshit = -anglevar;

			--doTweenZoom('OhSHIT', 'camGame', 1.5, 0.13, 'sineOut')
        end
        setProperty('camHUD.angle',angleshit*3)
        setProperty('camGame.angle',angleshit*3)
        doTweenAngle('turn', 'camHUD', angleshit, stepCrochet*0.002, 'circOut')
        doTweenX('tuin', 'camHUD', -angleshit*8, crochet*0.001, 'linear')
        doTweenAngle('tt', 'camGame', angleshit, stepCrochet*0.002, 'circOut')
        doTweenX('ttrn', 'camGame', -angleshit*8, crochet*0.001, 'linear')

        triggerEvent('Add Camera Zoom', '0.03', '0.05');
        setProperty('dad.y',getProperty('dad.y')+20)
        doTweenY('bounce1','dad',getProperty('dad.y')-20,crochet*0.001,'sineOut')
        setProperty('boyfriend.y',getProperty('boyfriend.y')+20)
        doTweenY('bounce2','boyfriend',getProperty('boyfriend.y')-20,crochet*0.001,'sineOut')
    end
end

function onCreatePost()
	makeLuaText('dis', "Purgatory by Emperor Yami", 600, 350, 300)
    doTweenAlpha('disbye','dis',0,8,'linear')
    setTextSize('dis', 40)
    setTextColor('dis', 'FFFF00')
    addLuaText('dis',true)
	makeLuaText('dis2', "The True Showdown", 600, 350, 200)
    doTweenAlpha('disbye2','dis2',0,8,'linear')
    setTextSize('dis2', 40)
    setTextColor('dis2', 'FF0000')
    addLuaText('dis2',true)
	makeLuaText('dis3', "Modchart Difficulty: 1.2", 600, 350, 400)
    doTweenAlpha('disbye3','dis3',0,8,'linear')
    setTextSize('dis3', 40)
    setTextColor('dis3', 'FFFF00')
    addLuaText('dis3',true)
	makeLuaText('dis4', "Chart Difficulty: 9", 600, 350, 450)
    doTweenAlpha('disbye4','dis4',0,8,'linear')
    setTextSize('dis4', 40)
    setTextColor('dis4', 'FFFF00')
    addLuaText('dis4',true)
	makeLuaText('dis5', "Chart Constant: 9.5", 600, 350, 525)
    doTweenAlpha('disbye5','dis5',0,8,'linear')
    setTextSize('dis5', 40)
    setTextColor('dis5', 'FF0000')
    addLuaText('dis5',true)
    for i = 4,7 do
        setPropertyFromGroup('strumLineNotes',i,'x',-20+i*110)
        end
end

function onMoveCamera(focus)
	if focus == 'boyfriend' then
	campointx = getProperty('camFollow.x')
	campointy = getProperty('camFollow.y')
	bfturn = true
	camlock = false
	setProperty('cameraSpeed', 1)
	
	elseif focus == 'dad' then
	campointx = getProperty('camFollow.x')
	campointy = getProperty('camFollow.y')
	bfturn = false
	camlock = false
	setProperty('cameraSpeed', 1)
	
	end
end

function onUpdate()
    makeLuaSprite('blackbar', 'blackbar', -400, -650)
    setLuaSpriteScrollFactor('blackbar', 0.9, 0.9); 
    addLuaSprite('blackbar', true);
    scaleObject('blackbar', 1, 1);

    makeLuaSprite('blackbar2', 'blackbar', -400, 150)
    setLuaSpriteScrollFactor('blackbar2', 0.9, 0.9); 
    addLuaSprite('blackbar2', true);
    scaleObject('blackbar2', 1, 1);

	if curBeat == 576 then
		makeLuaSprite('Blackout', 'Blackout', -400, -650)
		setLuaSpriteScrollFactor('Blackout', 0.9, 0.9); 
		addLuaSprite('Blackout', true);
		scaleObject('Blackout', 10, 10);
	end
    
    setProperty('timeBar.color', getColorFromHex('FFFFFF'))
    setProperty('timeBarBG.color', getColorFromHex('FFFFFF'))
  noteTweenAlpha('itsnothere',0, 0, 0.001, 'sineOut')
  noteTweenAlpha('itsnothere1',1, 0, 0.001, 'sineOut')
  noteTweenAlpha('itsnothere2',2, 0, 0.001, 'sineOut')
  noteTweenAlpha('itsnothere3',3, 0, 0.001, 'sineOut')
  if curBeat > 4 then
    if curBeat % 2 == 0 then
        setProperty('timeBar.color', getColorFromHex('FF0000'))
        setProperty('timeBarBG.color', getColorFromHex('FF0000'))
		doTweenColor("coloUH", "background", "FF0000", 0.001, "sineInOut")
    else
        setProperty('timeBar.color', getColorFromHex('FFFF00'))
        setProperty('timeBarBG.color', getColorFromHex('FFFF00'))
		doTweenColor("coloUH", "background", "FFFF00", 0.001, "sineInOut")
    end
end

function goodNoteHit(id, direction, noteType, isSustainNote)
	if bfturn then
		if direction == 0 then
			camlockx = campointx - camMovement
			camlocky = campointy
		elseif direction == 1 then
			camlocky = campointy + camMovement
			camlockx = campointx
		elseif direction == 2 then
			camlocky = campointy - camMovement
			camlockx = campointx
		elseif direction == 3 then
			camlockx = campointx + camMovement
			camlocky = campointy
		end
	runTimer('camreset', 1)
	setProperty('cameraSpeed', velocity)
	camlock = true
	end	
end


function opponentNoteHit(id, direction, noteType, isSustainNote)
	if not bfturn then
		if direction == 0 then
			camlockx = campointx - camMovement
			camlocky = campointy
		elseif direction == 1 then
			camlocky = campointy + camMovement
			camlockx = campointx
		elseif direction == 2 then
			camlocky = campointy - camMovement
			camlockx = campointx
		elseif direction == 3 then
			camlockx = campointx + camMovement
			camlocky = campointy
		end
	--nice--
	runTimer('camreset', 1)
	setProperty('cameraSpeed', velocity)
	camlock = true
    if mustHitSection == false then
		health = getProperty('health')
		if getProperty('health') > 0.15 then
			setProperty('health', health- 0.025);
		end
	end
	end	
end

function onTimerCompleted(tag, loops, loopsLeft)
	if tag == 'camreset' then
	camlock = false
	setProperty('cameraSpeed', 1)
	setProperty('camFollow.x', campointx)
	setProperty('camFollow.y', campointy)
	end
end
end

