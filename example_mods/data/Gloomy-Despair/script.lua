--this is so stupid lmao
function onCreate() --setting variables and making sprites

    makeLuaText('dis', "Instrumental by ReeVrze | Vocals by Rembulous Again", 600, 680, 0)
    doTweenAlpha('disbye','dis',0,8,'linear')
    setTextSize('dis', 20)
    setTextColor('dis', 'FFFFFF')
    addLuaText('dis',true)
end

function onUpdatePost()
	setProperty('introSoundsSuffix', '-exosphere')
end

function onEndSong()
	if not allowEnd and isStoryMode then
		setProperty('inCutscene', true);
		startDialogue('post-dialogue', 'canzies');
		allowEnd = true;
		return Function_Stop;
	end
	return Function_Continue;
end

