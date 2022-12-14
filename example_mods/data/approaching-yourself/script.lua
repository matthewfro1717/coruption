local angleshit = 0;
local anglevar = 0;
local theepic = true;


function onBeatHit()
    if curBeat > 0 then
        if curBeat % 2 == 0 then
            angleshit = anglevar;
        else
            angleshit = -anglevar;
        end
        setProperty('camHUD.angle',angleshit*3)
        setProperty('camGame.angle',angleshit*3)
        doTweenAngle('turn', 'camHUD', angleshit, stepCrochet*0.002, 'circOut')
        doTweenX('tuin', 'camHUD', -angleshit*8, crochet*0.001, 'linear')
        doTweenAngle('tt', 'camGame', angleshit, stepCrochet*0.002, 'circOut')
        doTweenX('ttrn', 'camGame', -angleshit*8, crochet*0.001, 'linear')

        triggerEvent('Add Camera Zoom', '0.03', '0.05');
        setProperty('dad.y',getProperty('dad.y')+40)
        doTweenY('bounce1','dad',getProperty('dad.y')-40,crochet*0.001,'sineOut')
        setProperty('gf.y',getProperty('gf.y')+40)
        setProperty('boyfriend.y',getProperty('boyfriend.y')+40)
        doTweenY('bounce2','boyfriend',getProperty('boyfriend.y')-40,crochet*0.001,'sineOut')
        doTweenY('bounce3','gf',getProperty('gf.y')-40,crochet*0.001,'sineOut')
    end
end

function onCreatePost()
    makeLuaText('dis', "Original Song by Saster (Confronting Yourself), Cover + MyBandumb Sprite by Vtollgunt", 600, 680, 20)
    doTweenAlpha('disbye','dis',0,8,'linear')
    setTextSize('dis', 24)
    setTextColor('dis', 'FFFFFF')
    addLuaText('dis',true)
    for i = 4,7 do
        setPropertyFromGroup('strumLineNotes',i,'x',-20+i*110)
    end
end

function onCountdownStarted()
	for i = 0, 3 do
		setPropertyFromGroup('opponentStrums', i, 'x', -900);
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
    
    setProperty('timeBar.color', getColorFromHex('FFFFFF'))
    setProperty('timeBarBG.color', getColorFromHex('FFFFFF'))
  noteTweenAlpha('itsnothere',0, 0, 0.001, 'sineOut')
  noteTweenAlpha('itsnothere1',1, 0, 0.001, 'sineOut')
  noteTweenAlpha('itsnothere2',2, 0, 0.001, 'sineOut')
  noteTweenAlpha('itsnothere3',3, 0, 0.001, 'sineOut')
  if curBeat > 4 then
    if curBeat % 2 == 0 then
        setProperty('timeBar.color', getColorFromHex('00FF00'))
        setProperty('timeBarBG.color', getColorFromHex('00FF00'))
    else
        setProperty('timeBar.color', getColorFromHex('228B22'))
        setProperty('timeBarBG.color', getColorFromHex('228B22'))
    end
end

function opponentNoteHit(ipiss, piss2, piss3, sus) -- SUS? SUS?SUS?SUS?SUS?SUS?SUS?SUS?SUS?SUS?SUS?SUS?SUS?SUS?SUS?SUS?SUS?SUS?SUS?SUS?SUS?SUS?SUS?SUS?SUS?SUS?SUS?SUS?SUS?SUS?SUS?SUS?SUS?SUS?
    if mustHitSection == false then
        health = getProperty('health')
        if getProperty('health') > 0.1 then
            setProperty('health', health- 0.015);
        end
    end
 --[[]   if piss2 == 0 then
      triggerEvent('Add Camera Zoom', '0.01', '0.01');
    elseif piss2 == 1 then
        triggerEvent('Add Camera Zoom', '0.01', '0.01');
    elseif piss2 == 2 then
        triggerEvent('Add Camera Zoom', '0.01', '0.01');
    elseif piss2 == 3 then
        triggerEvent('Add Camera Zoom', '0.01', '0.01');
    end]]

end      
end