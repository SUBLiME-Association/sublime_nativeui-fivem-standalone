---RenderSprite
---
---@param TextureDictionary string
---@param TextureName string
---@param x number
---@param y number
---@param w number
---@param h number
---@param heading number
---@param color table
function drawSprite(TextureDictionary, TextureName, x, y, w, h, heading, color)
    local x, y, w, h = (tonumber(x) or 0) / 1920, (tonumber(y) or 0) / 1080, (tonumber(w) or 0) / 1920, (tonumber(h) or 0) / 1080

    if not HasStreamedTextureDictLoaded(TextureDictionary) then
        RequestStreamedTextureDict(TextureDictionary, true)
    end

    DrawSprite(TextureDictionary, TextureName, x + w * 0.5, y + h * 0.5, w, h, heading or 0, color[1] or 255, color[2] or 255, color[3] or 255, color[4] or 150)
end


