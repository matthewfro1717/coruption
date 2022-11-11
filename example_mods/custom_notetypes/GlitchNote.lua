function onCreate()
	--Iterate over all notes
	for i = 0, getProperty('unspawnNotes.length')-1 do
		--Check if the note is an Instakill Note
		if getPropertyFromGroup('unspawnNotes', i, 'noteType') == 'GlitchNote' then
			setPropertyFromGroup('unspawnNotes', i, 'texture', 'GlitchNote_assets'); --Change texture
			setPropertyFromGroup('unspawnNotes', i, 'hitHealth', '0.023'); --Default value is: 0.023, health gained on hit
			setPropertyFromGroup('unspawnNotes', i, 'missHealth', '0.65'); --Default value is: 0.0475, health lost on miss
			setPropertyFromGroup('unspawnNotes', i, 'hitCausesMiss', true);
			if getPropertyFromGroup('unspawnNotes', i, 'mustPress') then --Doesn't let Dad/Opponent notes get ignored
				setPropertyFromGroup('unspawnNotes', i, 'ignoreNote', true); --Miss has no penalties
			end
		end
	end
	--debugPrint('Script started!')
end

-- Function called when you hit a note (after note hit calculations)
-- id: The note member id, you can get whatever variable you want from this note, example: "getPropertyFromGroup('notes', id, 'strumTime')"
-- noteData: 0 = Left, 1 = Down, 2 = Up, 3 = Right
-- noteType: The note type string/tag
-- isSustainNote: If it's a hold note, can be either true or false
function goodNoteHit(id, noteData, noteType, isSustainNote)
	if noteType == 'GlitchNote' then
		-- put something here if you want
	end
end

-- Called after the note miss calculations
-- Player missed a note by letting it go offscreen
function noteMiss(id, noteData, noteType, isSustainNote)
	if noteType == 'GlitchNote' then
		playSound('sorry', 0.4);
		cameraShake('camGame', 0.01, 0.2)
		triggerEvent('Screen Shake', '0.1, 0.1', '0.1, 0.01');
		triggerEvent('Add Camera Zoom', '0.03, 0.03', '0.03, 0.03');  
		triggerEvent('Change Scroll Speed', '1.7', '0.001');  
		triggerEvent('Change Scroll Speed', '1.3', '0.03');  
		triggerEvent('Change Scroll Speed', '1', '1.7');  
		triggerEvent('Play Animation', 'hurt', 'BF');  
	end
end