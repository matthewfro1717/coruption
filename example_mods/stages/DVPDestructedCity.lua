
function onCreate()
    makeLuaSprite('Destructed', 'Destructed', -500, -200)
    setLuaSpriteScrollFactor('Destructed', 0.9, 0.9); 
    addLuaSprite('Destructed')
    scaleObject('background', 3,3);
    setProperty("Destructed.alpha",0)
	makeLuaSprite('white','whiteshit',-740,-380);
	setLuaSpriteScrollFactor('white', 0, 0);
	scaleObject('white', 2, 2)
    addLuaSprite('white', true);
    doTweenAlpha('whitetween2', 'white', 0,1, 'linear')
    makeLuaSprite('black','blackshit',-740,-380);
	setLuaSpriteScrollFactor('black', 0, 0);
	scaleObject('black', 2, 2)
    addLuaSprite('black', true);
    doTweenAlpha('blacktween2', 'black', 0,1, 'linear')
    --[[makeLuaSprite('DivinePlatform', 'DivinePlatform', 250,800)
    setLuaSpriteScrollFactor('DivinePlatform', 1.4, 1.4); 
    addLuaSprite('DivinePlatform')
	scaleObject('DivinePlatform', 1,1);]]
end

function onUpdate()
    setObjectOrder('dad', 1)
    setObjectOrder('DivinePlatform', 2)
    setObjectOrder('boyfriend', 3)
end

function onBeatHit()

    if curBeat == 40 then
        doTweenAlpha('whitetween1', 'white', 1,6, 'linear')
    end
    if curBeat == 64 then
        setProperty("Destructed.alpha",1)
        doTweenAlpha('whitetween2', 'white', 0,1, 'linear')
    end

    if curBeat == 64 then
        doTweenAlpha('blacktween1', 'black', 1,5, 'linear')
    end
    if curBeat == 688 then
        setProperty("Destructed.alpha",0)
        doTweenAlpha('blacktween2', 'black', 0,3, 'linear')
    end

    if curBeat == 812 then
        doTweenAlpha('whitetween1', 'white', 1,2, 'linear')
    end
    if curBeat == 815 then
        setProperty("Destructed.alpha",1)
        doTweenAlpha('whitetween2', 'white', 0,0.5, 'linear')
    end


end