--- Teste

SublimeUI = {}
local Menu = {}
Menu.__index = Menu


local function show(self) -- for teste
    drawRect(self.x, self.y, self.w, self.h, self.color)
end

function SublimeUI:CreateMenu(title, subtitle, x, y, w, h, color) -- type to create

    local self = {}
    -- args
    self.title = title or nil
    self.subtitle = subtitle or nil
    self.x = x or 30
    self.y = y or 30
    self.w = w or 431 -- les valeur seront changer une fois le reste fait
    self.h = h or 110 -- les valeur seront changer une fois le reste fait
    self.color = color or {1,1,1,100}
    -- function
    self.show = show
    setmetatable(self, Menu)
    return self
end
