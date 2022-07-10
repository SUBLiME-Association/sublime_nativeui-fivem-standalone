--- WORK IN PROGRESS
local TotalMenu = {}
--local i = 1
local scaleformGlare
Cache = {}
Cache.screenX, Cache.screenY = 0, 0


SublimeUI = {}

SublimeUI.Menus = setmetatable({}, SublimeUI.Menus)
SublimeUI.Menus.__call = function()
    return true
end
SublimeUI.Menus.__index = SublimeUI.Menus

local function DeleteMenu(self)
    TotalMenu[self.id] = nil
    ---table.wipe(SublimeUI.Menus)
    return nil, collectgarbage()
end

local function GetDataMenu(self) -- utile pour dev
    return self.id, self.title, self.subtitle, self.setting.x, self.setting.y, self.setting.w, self.setting.h, json.encode(self.options.color.banner), self
end

local function Background(self)
    drawSprite(Config.Background.TextureDictionary, Config.Background.TextureName, self.setting.x, self.setting.y + Config.Background.y, self.setting.w, self.itemsOffSetH, Config.Background.color, self.setting.heading)
end

local function Navigation(self)
    drawSprite(Config.Navigation.Rectangle.Dictionary, Config.Navigation.Rectangle.Texture, self.setting.x + Config.Navigation.Rectangle.X + (0 / 2), self.setting.y + Config.Navigation.Rectangle.Y + 150 + self.itemsOffSetH, Config.Navigation.Rectangle.Width, Config.Navigation.Rectangle.Height, Config.Navigation.Rectangle.Color, 0.0)
    drawSprite(Config.Navigation.Arrows.Dictionary, Config.Navigation.Arrows.Texture, self.setting.x + Config.Navigation.Arrows.X + (0 / 2), self.setting.y + Config.Navigation.Arrows.Y + 140 + self.itemsOffSetH, Config.Navigation.Arrows.Width, Config.Navigation.Arrows.Height, Config.Navigation.Arrows.Color, 0.0)
    --self.itemsOffSetH = self.itemsOffSetH + (Config.Navigation.Rectangle.Height * 2)
end

local function Banner(self) -- le code du banner, a voir pour faire en drawsprite plutot que drawRect
    drawSprite(self.options.texture.banner[1], self.options.texture.banner[2], self.setting.x, self.setting.y, self.setting.w, self.setting.h, self.options.color.banner, self.setting.heading)
    if self.display.glare then -- FAIT CHIER A RENDRE CA RESPONSIVE NIQUE CA MERE!!!!! 
        local glareW = (self.setting.w / self.setting.w) + 0.0041
        local glareH = (self.setting.h / self.setting.h) + 0.059
        local glareX = self.setting.x / Cache.screenX --[[- 0.001001]] + (29 / (64.399 - (0 * 0.065731)))
        local glareY = self.setting.y / Cache.screenY --[[- 0.02791]] + 16 / 33.195020746888
        PushScaleformMovieFunction(scaleformGlare, "SET_DATA_SLOT")
        PushScaleformMovieFunctionParameterFloat(GetGameplayCamRelativeHeading())
        PopScaleformMovieFunctionVoid()
        DrawScaleformMovie(scaleformGlare, glareX, glareY, glareW, glareH, 255, 255, 255, 255, 0)
    end
    if self.title then
        drawText(self.title, self.setting.x + 150 + (0/2), self.setting.y + 2 + 24 , 1, 1.0, {255,255,255,255}, "Center", true, false, nil)
    end
    if self.subtitle then
        local y = (self.setting.y + Config.Subtitle.y)
        self.offsetY += y
        self.offsetH += (self.setting.h - Config.Subtitle.h)
        drawSprite(self.options.texture.subtitle[1], self.options.texture.subtitle[2], self.setting.x, y, self.setting.w, self.setting.h - Config.Subtitle.h, self.options.color.subtitle, self.setting.heading)
        drawText(self.subtitle, self.setting.x + 8, self.setting.y + 113, 0, 0.30, {255,255,255,255}, nil, false, false, self.setting.w + 0)
    end
end

local function AddButton(self, texte, description, style, enable, action, submenu)
    local id = self.items_count + 1
    if self.pagination.min <= id and id <= self.pagination.max then
        self.items.button[id] = {}
        self.items.button[id].name = name or nil
        self.items.button[id].description = description or nil
        self.items.button[id].style = style
        self.items.button[id].action = action or nil
        self.items.button[id].submenu = submenu or nil
        self.items.button[id].offsetY = self.itemsOffSetY += 30 + self.itemsSpace
        self.items.button[id].textoffsetY = self.itemTextOffSetY += 30 + self.itemsSpace
        self.itemsOffSetY += 30 + self.itemsSpace
        self.itemTextOffSetY += 30 + self.itemsSpace
        self.itemsOffSetH += 30 + self.itemsSpace 
        --print(self.items.button[id], self.items.button[id].name, self.items.button[id].label)
        self.items.button[id].render = function() 
            drawSprite(Config.Button.SelectedSprite.Dictionary, Config.Button.SelectedSprite.Texture, self.setting.x, self.setting.y + Config.Button.SelectedSprite.Y + self.items.button[id].offsetY + 0, Config.Button.SelectedSprite.Width + 0, Config.Button.SelectedSprite.Height, self.items.button[id].style.color, 0.0) 
            drawText(self.items.button[id].name, self.setting.x + 8, self.setting.y + self.items.button[id].textoffsetY, 0, 0.30, {0,0,0,255}, nil, false, false, self.setting.w + 0)
        end
    end
    self.items_count += 1
end

local function AddList(self, texte, description, style, enable, action, submenu)
    local id = self.items_count + 1
    if self.pagination.min <= id and id <= self.pagination.max then

    end
    self.items_count += 1
end

local function ItemsRender(self)
    if self.addButton then
        for i = 1, #self.items.button do
            self.items.button[i].render()
        end
    end
    self.item_count_total = #self.items.button
end

function SublimeUI.CreateItem(self)
    
end

local function canVisible(self)
    local possible = true
    for i,v in ipairs (TotalMenu) do
        if self.id == i and (v.visible or self.visible) then
            possible = false
        end
        if self.id ~= i and v.visible then
            possible = false
        end
    end
    if possible then
        return true
    else
        return false
    end
end

local function compoMenu(self)
    if self.visible then
        if self.display.banner then
            Banner(self)  
        end
        if self.display.background then
            Background(self)
        end
        ItemsRender(self)
        if self.display.navigation then
            if self.item_count_total >= self.pagination.max then
                -- self.nav_visible = true -- utile pour plus tard
                Navigation(self)
            end
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
            return compoMenu(self)
        else return print('deja ouvert menu') -- utile pour le debug à delete une fois release avec le else
        end
    end
end

function SublimeUI.CreateMenu(parent, title, subtitle, setting, options) -- type to create
    local id = #TotalMenu + 1
    local self = {}
    
    if not setting then setting = {} end
    if not options or not options.color or not options.texture then options = {} options.color = {} options.texture = {} end
    
    -- args
    self.id = id
    self.title = title or nil
    self.subtitle = subtitle or nil
    self.parent = parent or nil

    self.setting = setting
    self.options = options

    -- setting
    self.setting.x = setting.x or Config.Banner.x -- pour le moment fonction uniquement par rapport au banner pour text mais a se servir pour la optionsMenu
    self.setting.y = setting.y or Config.Banner.y -- pour le moment fonction uniquement par rapport au banner pour text mais a se servir pour la optionsMenu
    self.setting.w = setting.w or Config.Banner.w -- les valeur seront changer une fois le reste fait
    self.setting.h = setting.h or Config.Banner.h -- les valeur seront changer une fois le reste fait
    self.setting.heading = setting.heading or Config.Banner.heading

    -- options
    self.options.color.banner = options.color.banner or Config.Banner.color
    self.options.color.subtitle = options.color.subtitle or Config.Subtitle.color
    self.options.texture.banner = options.texture.banner or {Config.Banner.TextureDictionary, Config.Banner.TextureName}
    self.options.texture.subtitle = options.texture.subtitle or {Config.Subtitle.TextureDictionary, Config.Subtitle.TextureName}
    self.visible = false

    --display
    self.display = {}
    self.display.banner = true
    self.display.background = Config.Background.active
    self.display.glare = Config.Display.glare
    self.display.navigation = true

    --self.nav_visible = false -- utile pour plus tard

    --test
    --self.subtitleHeight = -20
    --self.safezone = true
    --self.safezoneSize = nil

    -- data
    self.item_count_total = 0
    self.items_count = 0
    self.offsetY = 0
    self.offsetH = 0

    -- Items
    self.items = {}
    self.items.button = {}
    --self.items.panels = {}

    -- Items Param
    self.itemsSpace = 1
    self.itemsOffSetH = 0
    self.itemsOffSetY = 116 -- 116 par défaut avec les valeur actuelle du menu header + subtitle
    self.itemTextOffSetY = 116

    -- Pagination
    self.currentIndex = 0
    self.pagination = {
        min = 1,
        max = 15
    }

    -- func ref
    self.banner = Banner
    self.deleted = DeleteMenu
    self.open = Open
    self.canVisible = canVisible
    self.composition = compoMenu

    self.addButton = AddButton

    
    -- ++
    --self.glare = DisplayGlare -- un peu useless vu les méthode du menu...

    --tooldev
    self.get = GetDataMenu -- only for dev
    
    if not self:canVisible() then
        return
    end
    if self.display.glare then
        CreateThread(function()
            scaleformGlare = RequestScaleformMovie("MP_MENU_GLARE")
            while not HasScaleformMovieLoaded(scaleformGlare) do
                Citizen.Wait(0)
            end
        end)
    end
    TotalMenu[id] = self
    return setmetatable(self, SublimeUI.Menus)
end


function SublimeUI.PlayThread(self, bool)
    local intervale, _x, _y
    CreateThread(function()
        _x, _y = GetActiveScreenResolution() -- Check de la résolution à chaque ouverture de menu (visible)
        if (not Cache.screenX and not Cache.screenY) or (_x ~= Cache.screenX or _y ~= Cache.screenY) then
            Cache.screenX, Cache.screenY = GetActiveScreenResolution() -- Mise en Cache de la résolution
        end
        self:beVisible()
    end)
    CreateThread(function()
        while true do
            Wait(0)
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


function SublimeUI.OpenMenu(self) -- utile mais à revoir avec le self:open mmh du coups modifier suite a la nouvelle facon de gerer l'ouverture mais je laisse en attendant
    if not self:canVisible() then
        print("ne peut être visible")
        return false
    end
    self:open(true)
    return print('peut être visible')
end



_ENV.Cache = Cache


--[[ ___ la merde d'avant pas faire gaffe juste au cas où ca peut servir

local function DisplayGlare(self, bool) -- function un peu useless...
    self.display.glare = bool
    return self.display.glare
end

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

local function optionsMenu(self, fn)
    drawRect(self.x,self.y,self.w,self.h,self.color)
end

--local function IsVisible(self)
--    if self.visible then
--        CreateThread(function()
--            SublimeUI.OpenThread(true)
--            while true do
--                Wait(0)
--                if self.visible then -- ici mettre tout les optionssant du menu
--                    optionsMenu(self)
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
    self.menu = optionsMenu

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

