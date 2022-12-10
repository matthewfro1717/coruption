--this is so stupid lmao
function onCreate() --setting variables and making sprites
    
    if not getPropertyFromClass('ClientPrefs', 'downScroll') and not getProperty("modchartsDisabled") then
        makeLuaText('scro', "this is downscroll only.", 600, 350, 300)
        setTextSize('scro', 90)
        setTextColor('scro', 'FF0077')
        addLuaText('scro',true)
   end
     
end
function onSongStart()
    doTweenY('weirdspeed1','offsettween',getProperty('offsettween.y')+sSpeed*-32*1000,stepCrochet*0.001*1000,'linear')
    setProperty('offsettween.x',(sSpeed*32)*2)
end

function onCreatePost()
    for i = 0,7 do
        setPropertyFromGroup('strumLineNotes',i,'y',-110)
        setPropertyFromGroup('strumLineNotes',i,'direction',90)
    end
end

function onBeatHit() --events but better
    local currentBeat = math.floor((songPos/1000)*(curBpm/60))
    if currentBeat >= 8 and not getPropertyFromClass('ClientPrefs', 'downScroll') and not getProperty("modchartsDisabled") then
        setPropertyFromClass('ClientPrefs', 'downScroll', true)
        playedupscroll = true
        doTweenAlpha('scrofade','scro',0,1,'linear')
    end
        if currentBeat == 32 then
          for i = 0,7 do
             noteTweenY('1-2-' .. i,i,560,1,'sineOut')
        end
end
end
function onStepHit()
    floorStep = math.floor(currentStep)
    if floorStep % 2 == 0 then
    doTweenX('weirdspeed2','offsettween',getProperty('offsettween.x')+(sSpeed*32)*2,stepCrochet*0.0009*2,'expoOut')
    end
end

function onUpdatePost(elapsed)
    if playedupscroll and not getProperty("modchartsDisabled") then
        playedupscroll = false
        makeLuaText('fix', "fixed :^)", 600, 330, 300)
        setTextSize('fix', 140)
        setTextColor('fix', 'FFFFFF')
        addLuaText('fix',true)
		loadSong('Hydromania', 'Hydromania', true);
	end
end


