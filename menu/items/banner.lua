SublimeUI = SublimeUI or {}
function SublimeUI.CreateBanner(self)
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