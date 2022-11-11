function mysplit(inputstr, sep)
    if sep == nil then
        sep = "%s";
    end
    local t = {};
    for str in string.gmatch(inputstr, "([^" .. sep .. "]+)") do
        table.insert(t, str);
    end
    return t;
end

-- Event notes hooks
function onEvent(name, value1, value2)
    if name == "MoveArrow" then
        local tableee = mysplit(value2, ", "); -- Splits value1 into a table
        local noteNum = tonumber(value1); -- prob more stable??
        tableee[1] = tonumber(tableee[1]);
        tableee[2] = tonumber(tableee[2]);
        tableee[3] = tonumber(tableee[3]);
        tableee[4] = tonumber(tableee[4]);
        tableee[5] = tonumber(tableee[5]);
        if (noteNum > 7) then
            return
        end
        if noteNum < 4 then
            notePosX = getPropertyFromGroup('opponentStrums', value1, 'x');
            notePosY = getPropertyFromGroup('opponentStrums', value1, 'y');
        else
            notee = noteNum - 4;
            notePosX = getPropertyFromGroup('playerStrums', notee, 'x');
            notePosY = getPropertyFromGroup('playerStrums', notee, 'y');
        end

        newnotePosX = notePosX + tableee[1];
        newnotePosY = notePosY + tableee[2];

        duration = tableee[5];
        rotation = tableee[3];
        opacity = tableee[4];

        noteTweenX("x" .. tostring(noteNum), noteNum, newnotePosX, duration, "quartInOut");
        noteTweenY("y" .. tostring(noteNum), noteNum, newnotePosY, duration, "quartInOut");
        noteTweenAngle("r" .. tostring(noteNum), noteNum, rotation, duration, "quartInOut");
        noteTweenAlpha("o" .. tostring(noteNum), noteNum, opacity, duration, "quartInOut");
    end
end
