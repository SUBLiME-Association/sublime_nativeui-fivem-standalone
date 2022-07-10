---drawRect
---
---@param x number
---@param y number
---@param w number
---@param h number
---@param color table
---
function drawRect(x, y, w, h, color)
    local x, y, w, h = (tonumber(x) or 0) / Cache.screenX, (tonumber(y) or 0) / Cache.screenY, (tonumber(w) or 0) / Cache.screenX, (tonumber(h) or 0) / Cache.screenY
    DrawRect(x + w * 0.5, y + h * 0.5, w, h, color[1] or 255, color[2] or 255, color[3] or 255, color[4] or 100)
end


----------------------------------------------------------------------
----------------------------------------------------------------------
----------------------------------------------------------------------
----------------- JE LAISSE MAIS NON UTILS ---------------------------
----------------------------------------------------------------------
----------------------------------------------------------------------
----------------------------------------------------------------------