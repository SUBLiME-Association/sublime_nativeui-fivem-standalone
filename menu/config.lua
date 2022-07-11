Config = Config or {}

-- Attenttion le config est loins d'être complet (tout n'est pas encore relié au code source)

Config.Main = {
    SaveMenu4players = false, -- option non disponible pour le moment sera disponible uniquement après que la libs soi finit
    ------
    Pagination = {min = 1, max = 15, total = 10},
}

Config.Display = {
    glare = true -- ok
}

Config.Sprite = {

}

Config.Background = {
    active = true, --ok 
    TextureDictionary = "commonmenu", --ok
    TextureName = "interaction_bgd",  --ok
    y = 142, heading = nil, --ok,ok
    color = {0,0,0,50}, -- ok
}

Config.Banner = {
    TextureDictionary = "commonmenu", --ok
    TextureName = "interaction_bgd",  --ok
    x = 30, y = 30, w = 431, h = 110, heading = nil, --ok,ok,ok,ok,ok
    color = {0,0,255,150}, --ok
    textScale = 1.0, textFont = 0, --ok,ok
}

Config.Subtitle = {
    TextureDictionary = "commonmenu", 
    TextureName = "interaction_bgd", 
    x = 30, y = 109.5, w = 431, h = 75, heading = nil, --- y = banner.y + y / h = banner.h - h
    color = {0,0,0,200},
    textScale = 1.0, textFont = 0,
}

Config.Button = {
    Text = { X = 8, Y = 3, Scale = 0.28 },
    LeftBadge = { Y = -2, Width = 40, Height = 40 },
    RightBadge = { X = 385, Y = -2, Width = 40, Height = 40 },
    RightText = { X = 420, Y = 4, Scale = 0.27 },
    CenterText = { X = 230, Y = 4, Scale = 0.27 },
    SelectedSprite = { Dictionary = "commonmenu", Texture = "interaction_bgd", Y = 256, Width = 431, Height = 28, Space = 0}, --eviter de toucher au space pour le moment
}

Config.Navigation = {
    InNav = {
        Rectangle = { Width = 431, Height = 18 },
    },
    Rectangle = { Dictionary = "commonmenu", Texture = "interaction_bgd", X = 0, Y = -6, Width = 431, Height = 30, Color = {0,0,0,150} },
    Offset = 5,
    Arrows = { Dictionary = "commonmenu", Texture = "shop_arrows_upanddown", X = 185, Y = 1, Width = 50, Height = 30, Color = {255,255,255,255} },
}

Config.Controls = {
    Up = {
        Enabled = true,
        Active = false,
        Pressed = false,
        Keys = {
            { 0, 172 },
            { 1, 172 },
            { 2, 172 },
            { 0, 241 },
            { 1, 241 },
            { 2, 241 },
        },
    },
    Down = {
        Enabled = true,
        Active = false,
        Pressed = false,
        Keys = {
            { 0, 173 },
            { 1, 173 },
            { 2, 173 },
            { 0, 242 },
            { 1, 242 },
            { 2, 242 },
        },
    },
    Left = {
        Enabled = true,
        Active = false,
        Pressed = false,
        Keys = {
            { 0, 174 },
            { 1, 174 },
            { 2, 174 },
        },
    },
    Right = {
        Enabled = true,
        Pressed = false,
        Active = false,
        Keys = {
            { 0, 175 },
            { 1, 175 },
            { 2, 175 },
        },
    },
    SliderLeft = {
        Enabled = true,
        Active = false,
        Pressed = false,
        Keys = {
            { 0, 174 },
            { 1, 174 },
            { 2, 174 },
        },
    },
    SliderRight = {
        Enabled = true,
        Pressed = false,
        Active = false,
        Keys = {
            { 0, 175 },
            { 1, 175 },
            { 2, 175 },
        },
    },
    Select = {
        Enabled = true,
        Pressed = false,
        Active = false,
        Keys = {
            { 0, 201 },
            { 1, 201 },
            { 2, 201 },
        },
    },
    Back = {
        Enabled = true,
        Active = false,
        Pressed = false,
        Keys = {
            { 0, 177 },
            { 1, 177 },
            { 2, 177 },
            { 0, 199 },
            { 1, 199 },
            { 2, 199 },
        },
    },
    Click = {
        Enabled = true,
        Active = false,
        Pressed = false,
        Keys = {
            { 0, 24 },
        },
    },
    Enabled = {
        Controller = {
            { 0, 2 }, -- Look Up and Down
            { 0, 1 }, -- Look Left and Right
            { 0, 25 }, -- Aim
            { 0, 24 }, -- Attack
        },
        Keyboard = {
            { 0, 201 }, -- Select
            { 0, 195 }, -- X axis
            { 0, 196 }, -- Y axis
            { 0, 187 }, -- Down
            { 0, 188 }, -- Up
            { 0, 189 }, -- Left
            { 0, 190 }, -- Right
            { 0, 202 }, -- Back
            { 0, 217 }, -- Select
            { 0, 242 }, -- Scroll down
            { 0, 241 }, -- Scroll up
            { 0, 239 }, -- Cursor X
            { 0, 240 }, -- Cursor Y
            { 0, 31 }, -- Move Up and Down
            { 0, 30 }, -- Move Left and Right
            { 0, 21 }, -- Sprint
            { 0, 22 }, -- Jump
            { 0, 23 }, -- Enter
            { 0, 75 }, -- Exit Vehicle
            { 0, 71 }, -- Accelerate Vehicle
            { 0, 72 }, -- Vehicle Brake
            { 0, 59 }, -- Move Vehicle Left and Right
            { 0, 89 }, -- Fly Yaw Left
            { 0, 9 }, -- Fly Left and Right
            { 0, 8 }, -- Fly Up and Down
            { 0, 90 }, -- Fly Yaw Right
            { 0, 76 }, -- Vehicle Handbrake
        },
    },
}




--[[
    Sprite : 
        - commonmenu : gradient_bgd / interaction_bgd / gradient_nav
--]]