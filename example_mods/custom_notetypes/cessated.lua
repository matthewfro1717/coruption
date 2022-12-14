function onCreate()
	--Iterate over all notes
	for i = 0, getProperty('unspawnNotes.length')-1 do
		if getPropertyFromGroup('unspawnNotes', i, 'noteType') == 'cessated' then --Check if the note on the chart is a Bullet Note
			--setPropertyFromGroup('unspawnNotes', i, 'texture', 'notetexture'); --Change notetexture
			--setPropertyFromGroup('unspawnNotes', i, 'noteSplashHue', 0);
			--setPropertyFromGroup('unspawnNotes', i, 'noteSplashSat', -20);
			--setPropertyFromGroup('unspawnNotes', i, 'noteSplashBrt', 1);

			setPropertyFromGroup('unspawnNotes', i, 'noAnimation', true); -- make it so original character doesn't sing these notes

			if getPropertyFromGroup('unspawnNotes', i, 'mustPress') then --Doesn't let Dad/Opponent notes get ignored
				setPropertyFromGroup('unspawnNotes', i, 'ignoreNote', true); --Miss has penalties
			end

		end
	end
end
function opponentNoteHit(ipiss, piss2, piss3, sus) -- SUS? SUS?SUS?SUS?SUS?SUS?SUS?SUS?SUS?SUS?SUS?SUS?SUS?SUS?SUS?SUS?SUS?SUS?SUS?SUS?SUS?SUS?SUS?SUS?SUS?SUS?SUS?SUS?SUS?SUS?SUS?SUS?SUS?SUS?
    if curBeat > 0 and curBeat < 608 then
        if piss2 == 0 then
            setPropertyFromClass('openfl.Lib','application.window.x', getPropertyFromClass('openfl.Lib','application.window.x')-bruh)
            triggerEvent('Screen Shake', '0.1, 0.01', '0.1, 0.01');
          elseif piss2 == 1 then
            setPropertyFromClass('openfl.Lib','application.window.y', getPropertyFromClass('openfl.Lib','application.window.y')+bruh)
                  triggerEvent('Screen Shake', '0.1, 0.01', '0.1, 0.01');
          elseif piss2 == 2 then
            setPropertyFromClass('openfl.Lib','application.window.y', getPropertyFromClass('openfl.Lib','application.window.y')-bruh)
                  triggerEvent('Screen Shake', '0.1, 0.01', '0.1, 0.01');
          elseif piss2 == 3 then
            setPropertyFromClass('openfl.Lib','application.window.x', getPropertyFromClass('openfl.Lib','application.window.x')+bruh)
                  triggerEvent('Screen Shake', '0.1, 0.01', '0.1, 0.01');
          
        end
    
        
    end
end