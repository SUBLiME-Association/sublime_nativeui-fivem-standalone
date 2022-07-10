Config = Config or {}

-- Attenttion le config est loins d'être complet (tout n'est pas encore relié au code source)

Config.Main = {
    
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
    SelectedSprite = { Dictionary = "commonmenu", Texture = "interaction_bgd", Y = 0, Width = 431, Height = 28 },
}

Config.Navigation = {
    Rectangle = { Dictionary = "commonmenu", Texture = "interaction_bgd", X = 0, Y = -6, Width = 431, Height = 30, Color = {0,0,0,150} },
    Offset = 5,
    Arrows = { Dictionary = "commonmenu", Texture = "shop_arrows_upanddown", X = 185, Y = 1, Width = 50, Height = 30, Color = {255,255,255,255} },
}




--[[
    Sprite : 
        - commonmenu : gradient_bgd / interaction_bgd / gradient_nav
--]]