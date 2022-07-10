Config = Config or {}

Config.Main = {
    
}

Config.Display = {
    glare = true
}

Config.Sprite = {

}

Config.Banner = {
    TextureDictionary = "commonmenu", 
    TextureName = "interaction_bgd", 
    x = 30, y = 30, w = 431, h = 110, heading = nil, 
    color = {0,0,255,150},
    textScale = 1.0, textFont = 0,
}

Config.Subtitle = {
    TextureDictionary = "commonmenu", 
    TextureName = "interaction_bgd", 
    x = 30, y = 109.5, w = 431, h = 75, heading = nil, --- y = banner.y + y / h = banner.h - h
    color = {0,0,0,200},
    textScale = 1.0, textFont = 0,
}



--[[
    Sprite : 
        - commonmenu : gradient_bgd / interaction_bgd
--]]