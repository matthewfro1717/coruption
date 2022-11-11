function onCreate()
	--Iterate over all notes
	for i = 0, getProperty('unspawnNotes.length')-1 do
		--Check if the note is an Instakill Note
		if getPropertyFromGroup('unspawnNotes', i, 'noteType') == 'Blast' then
			setPropertyFromGroup('unspawnNotes', i, 'texture', 'BlastNote_assets'); --Change texture
			setPropertyFromGroup('unspawnNotes', i, 'hitHealth', '0.023'); --Default value is: 0.023, health gained on hit
			setPropertyFromGroup('unspawnNotes', i, 'missHealth', '0.5'); --Default value is: 0.0475, health lost on miss
			setPropertyFromGroup('unspawnNotes', i, 'hitCausesMiss', false);
			if getPropertyFromGroup('unspawnNotes', i, 'mustPress') then --Doesn't let Dad/Opponent notes get ignored
				setPropertyFromGroup('unspawnNotes', i, 'ignoreNote', false); --Miss has no penalties
			end
		end
	end
	--debugPrint('Script started!')
end
function goodNoteHit(id, direction, noteType, isSustainNote)
	if noteType == 'Blast' then
		playSound('Blast', 0.4);
		characterPlayAnim('gf', 'dodge', true);
		characterPlayAnim('dad', 'fire', true);
		cameraShake('camGame', 0.01, 0.2)
    end
end

function noteMiss(id, direction, noteType, isSustainNote)
	if noteType == 'Blast' then
		playSound('Blast', 0.4);
		characterPlayAnim('gf', 'shocked', true);
		characterPlayAnim('dad', 'fire', true);
		cameraShake('camGame', 0.01, 0.2)
	end
end
