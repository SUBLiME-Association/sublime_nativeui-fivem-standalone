--- WORK IN PROGRESS
local TotalMenu = {}

SublimeUI = {}

SublimeUI.Menus = setmetatable({}, SublimeUI.Menus)
SublimeUI.Menus.__call = function()
    return true
end
SublimeUI.Menus.__index = SublimeUI.Menus

local function DeleteMenu(self)
    TotalMenu[self.id] = nil
    return nil, collectgarbage()
end

local function GetDataMenu(self) -- utile pour dev
    return self.id, self.title, self.subtitle, self.x, self.y, self.w, self.h, json.encode(self.color), self
end

local function Banner(self) -- le code du banner, a voir pour faire en drawsprite plutot que drawRect
    drawRect(self.x,self.y,self.w,self.h,self.color)
end

local function canVisible(self)
    local possible = true
    for i,v in ipairs (TotalMenu) do
        --print(i, self.id, v.visible, self.visible)
        if self.id == i and (v.visible or self.visible) then
            possible = false
        end
        if self.id ~= i and v.visible then
            --DeleteMenu(self)
            possible = false
        end
    end
    print(self,possible)
    if possible then
        return true
    else
        return false
    end
end

local function CompoMenu(self)
    if self.visible then
        if self.options.banner then
            Banner(self)
        end
    end
end

local function Open(self, bool)
    if not bool then
        --print('passez ici')
        self.visible = bool
        TotalMenu[self.id].visible = bool
        SublimeUI.PlayThread(self, false)
        return DeleteMenu(self), false
    else
        if self:canVisible() then
            self.visible = bool
            TotalMenu[self.id].visible = bool
            SublimeUI.PlayThread(self, true)
            return CompoMenu(self)
        else return print('deja ouvert menu') -- utile pour le debug à delete une fois release avec le else
        end
    end
end

function SublimeUI.CreateMenu(parent, title, subtitle, x, y, w, h, color) -- type to create
    local id = #TotalMenu + 1
    -- args
    local self = {}
    self.options = {}
    self.id = id
    self.title = title or nil
    self.subtitle = subtitle or nil
    self.parent = parent or nil
    self.x = x or 30 -- pour le moment fonction uniquement par rapport au banner pour text mais a se servir pour la CompoMenu
    self.y = y or 30 -- pour le moment fonction uniquement par rapport au banner pour text mais a se servir pour la CompoMenu
    self.w = w or 431 -- les valeur seront changer une fois le reste fait
    self.h = h or 110 -- les valeur seront changer une fois le reste fait
    self.color = color or {1,1,1,100}
    self.visible = false
    --option
    self.options.banner = true
    -- func
    self.banner = Banner
    self.deleted = DeleteMenu
    self.open = Open
    self.canVisible = canVisible
    self.composition = CompoMenu
    --self.isVisible = IsVisible

    --tooldev
    self.get = GetDataMenu -- only for dev
    

    TotalMenu[id] = self
    return setmetatable(self, SublimeUI.Menus)
end


function SublimeUI.PlayThread(self, bool)
    local intervale
    CreateThread(function()
        while true do
            Wait(0.5)
            intervale = true
            if bool then
                if self.visible then intervale = false
                    self:composition()
                    self:isVisible()
                end

                if intervale then
                    Wait(500)
                end
            else
                return false
            end
        end
    end)
end

function SublimeUI.OpenMenu(self) -- utile mais à revoir avec le self:open
    if not self:canVisible() then
        print("ne peut être visible")
        return false
    end
    self:open(true)
    return print('peut être visible')
end






--[[ ___ la merde d'avant pas faire gaffe juste au cas où ca peut servir
    --- Teste
local isOpen = {}
local TotalMenu = {}

SublimeUI = {}

SublimeUI.Menus = setmetatable({}, SublimeUI.Menus)
SublimeUI.Menus.__call = function()
    return true
end
SublimeUI.Menus.__index = SublimeUI.Menus

local function DeleteMenu(self)
    --print(self, SublimeUI.Menus)
    --print(TotalMenu[self.id])
    TotalMenu[self.id] = nil
    --print(TotalMenu[self.id])
    return nil, collectgarbage()
end

local function GetDataMenu(self)
    return self.id, self.title, self.subtitle, self.x, self.y, self.w, self.h, json.encode(self.color), self
end

local function canVisible(self)
    for i,v in ipairs (TotalMenu) do
        --print(i, self.id, v.visible, self.visible)
        if self.id == i and (v.visible or self.visible) then
            return false, print("menu deja ouvert")
        end
        if self.id ~= i then
            if v.visible then
                return false, print("un autre menu deja ouvert")
            end
        end
    end
    return true
end

local function CompoMenu(self, fn)
    drawRect(self.x,self.y,self.w,self.h,self.color)
end

--local function IsVisible(self)
--    if self.visible then
--        CreateThread(function()
--            SublimeUI.OpenThread(true)
--            while true do
--                Wait(0)
--                if self.visible then -- ici mettre tout les composant du menu
--                    CompoMenu(self)
--                else
--                    SublimeUI.OpenThread(false)
--                    return false
--                end
--            end
--        end)
--    else
--        return nil
--    end
--end

local function Open(self, bool)
    if not bool then
        self.visible = bool
        TotalMenu[self.id].visible = bool
        return DeleteMenu(self), false
    else
        if self:canVisible() then
            self.visible = bool
            TotalMenu[self.id].visible = bool
            return true, IsVisible(self)
        else return print('deja ouvert menu')
        end
    end 
end



function SublimeUI.CreateMenu(title, subtitle, x, y, w, h, color) -- type to create
    local id = #TotalMenu + 1
    -- args
    local self = {}
    self.id = id
    self.title = title or nil
    self.subtitle = subtitle or nil
    self.x = x or 30
    self.y = y or 30
    self.w = w or 431 -- les valeur seront changer une fois le reste fait
    self.h = h or 110 -- les valeur seront changer une fois le reste fait
    self.color = color or {1,1,1,100}
    --self.visible = false -- init false
    self.visible = false
    -- func
    self.deleted = DeleteMenu
    self.open = Open
    self.canVisible = canVisible
    self.isVisible = IsVisible
    self.menu = CompoMenu

    --tooldev
    self.get = GetDataMenu -- only for dev

    TotalMenu[id] = self
    return setmetatable(self, SublimeUI.Menus)
end





CreateThread(function()
    while bool do
        Wait(0)
        self.loop()
    end
end)
]]

