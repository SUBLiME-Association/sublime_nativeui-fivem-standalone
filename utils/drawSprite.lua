Cache = Cache or {}

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
function drawSprite(TextureDictionary, TextureName, x, y, width, heigth, color, heading)--drawSprite(TextureDictionary, TextureName, x, y, w, h, heading, color)
    local screenX, screenY = Cache.screenX, Cache.screenY 
    local x, y = (tonumber(x or 0) / tonumber(screenX)), (tonumber(y or 0) / tonumber(screenY))
    local w, h = (tonumber(width or 0) / tonumber(screenX)), (tonumber(heigth or 0) / tonumber(screenY))

    if not HasStreamedTextureDictLoaded(TextureDictionary) then
        RequestStreamedTextureDict(TextureDictionary, true)
    end

    DrawSprite(TextureDictionary, TextureName, x + w * 0.5 ,y + h * 0.5 , w, h, heading or 0.0, color[1] or 255, color[2] or 255, color[3] or 255, color[4] or 150)
end


