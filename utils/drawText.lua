Cache = Cache or {}

-- Ref RageUI

function StringToArray(str)
    local charCount = #str
    local strCount = math.ceil(charCount / 99)
    local strings = {}

    for i = 1, strCount do
        local start = (i - 1) * 99 + 1
        local clamp = math.clamp(#string.sub(str, start), 0, 99)
        local finish = ((i ~= 1) and (start - 1) or 0) + clamp

        strings[i] = string.sub(str, start, finish)
    end
    
    return strings
end

function MeasureStringWidth(str, font, scale)
    BeginTextCommandWidth("CELL_EMAIL_BCON")
    AddTextComponentSubstringPlayerName(str)
    SetTextFont(font or 0)
    SetTextScale(1.0, scale or 0)
    return EndTextCommandGetWidth(true) * Cache.screenX
end

function AddText(str)
    local str = tostring(str)
    local charCount = #str

    if charCount < 100 then
        AddTextComponentSubstringPlayerName(str)
    else
        local strings = StringToArray(str)
        for s = 1, #strings do
            AddTextComponentSubstringPlayerName(strings[s])
        end
    end
end

function GetLineCount(Text, X, Y, Font, Scale, Color, Alignment, DropShadow, Outline, WordWrap)
    local Text, X, Y = tostring(Text), (tonumber(X) or 0) / Cache.screenX, (tonumber(Y) or 0) / Cache.screenY
    SetTextFont(Font or 0)
    SetTextScale(1.0, Scale or 0)
    SetTextColour(tonumber(Color[1]) or 255, tonumber(Color[2]) or 255, tonumber(Color[3]) or 255, tonumber(Color[4]) or 255)
    if DropShadow then
        SetTextDropShadow()
    end
    if Outline then
        SetTextOutline()
    end
    if Alignment ~= nil then
        if Alignment == 1 or Alignment == "Center" or Alignment == "Centre" then
            SetTextCentre(true)
        elseif Alignment == 2 or Alignment == "Right" then
            SetTextRightJustify(true)
        end
    end
    if tonumber(WordWrap) and tonumber(WordWrap) ~= 0 then
        if Alignment == 1 or Alignment == "Center" or Alignment == "Centre" then
            SetTextWrap(X - ((WordWrap / Cache.screenX) / 2), X + ((WordWrap / Cache.screenY) / 2))
        elseif Alignment == 2 or Alignment == "Right" then
            SetTextWrap(0, X)
        else
            SetTextWrap(X, X + (WordWrap / Cache.screenX))
        end
    else
        if Alignment == 2 or Alignment == "Right" then
            SetTextWrap(0, X)
        end
    end

    BeginTextCommandLineCount("CELL_EMAIL_BCON")
    AddText(Text)
    return GetTextScreenLineCount(X, Y)
end

function drawText(Text, X, Y, Font, Scale, Color, Alignment, DropShadow, Outline, WordWrap)
    local Text, X, Y = tostring(Text), (tonumber(X) or 0) / Cache.screenX, (tonumber(Y) or 0) / Cache.screenY
    SetTextFont(Font or 0)
    SetTextScale(1.0, Scale or 0)
    SetTextColour(tonumber(Color[1]) or 255, tonumber(Color[2]) or 255, tonumber(Color[3]) or 255, tonumber(Color[4]) or 255)
    if DropShadow then
        SetTextDropShadow()
    end
    if Outline then
        SetTextOutline()
    end
    if Alignment ~= nil then
        if Alignment == 1 or Alignment == "Center" or Alignment == "Centre" then
            SetTextCentre(true)
        elseif Alignment == 2 or Alignment == "Right" then
            SetTextRightJustify(true)
        end
    end
    if tonumber(WordWrap) and tonumber(WordWrap) ~= 0 then
        if Alignment == 1 or Alignment == "Center" or Alignment == "Centre" then
            SetTextWrap(X - ((WordWrap / Cache.screenX) / 2), X + ((WordWrap / Cache.screenY) / 2))
        elseif Alignment == 2 or Alignment == "Right" then
            SetTextWrap(0, X)
        else
            SetTextWrap(X, X + (WordWrap / Cache.screenX))
        end
    else
        if Alignment == 2 or Alignment == "Right" then
            SetTextWrap(0, X)
        end
    end
    BeginTextCommandDisplayText("CELL_EMAIL_BCON")
    AddText(Text)
    EndTextCommandDisplayText(X, Y)
end