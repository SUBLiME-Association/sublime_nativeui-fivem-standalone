SublimeUI = SublimeUI or {}

SublimeUI.LastControl = false

local ControlActions = {
    'Left',
    'Right',
    'Select',
    'Click',
}

local function OnSwitchIndex(index)
    return index
end

function SublimeUI.GoUp(self, options)
    if self.visible then
        if options ~= 0 then
            if options > self.pagination.total then
                if self.currentIndex == 1 then
                    self.pagination.min = options - (self.pagination.total - 1)
                    self.pagination.max = options
                    self.currentIndex = options
                else
                    self.pagination.min -= 1
                    self.pagination.max -= 1
                    self.currentIndex -= 1
                end
            else
                if self.currentIndex == 1 then
                    self.pagination.min = options - (self.pagination.total - 1)
                    self.pagination.max = options
                    self.currentIndex = options
                else
                    self.currentIndex -= 1
                end
                --local audio =
                --playsound
                SublimeUI.LastControl = true
                CreateThread(function()
                    print(self.currentIndex)
                    OnSwitchIndex(self.currentIndex)
                end)
            end
            print(self.currentIndex, 'up')
        end
    end
    
end

function SublimeUI.GoDown(self, options)
    if self.visible then
        if options ~= 0 then
            if options > self.pagination.total then
                if self.currentIndex >= self.pagination.max then
                    if self.currentIndex == options then
                        self.pagination.min = 1
                        self.pagination.max = self.pagination.total
                        self.currentIndex = 1
                    else
                        self.pagination.max += 1
                        self.pagination.min = self.pagination.max - (self.pagination.total - 1)
                        self.currentIndex += 1
                    end
                else
                    self.currentIndex += 1
                end
            else
                if self.currentIndex == options then
                    self.pagination.min = 1
                    self.pagination.max = self.pagination.total
                    self.currentIndex = 1
                else
                    self.currentIndex += 1
                end
                -- local audio
                -- sublime.playsound ..
                SublimeUI.LastControl = false
                --if self.onChangeIndex ~= nil then
                    CreateThread(function()
                        OnSwitchIndex(self.currentIndex)
                    end)
                --end
                --local audio
                --playsound error
            end
            print(self.currentIndex, 'down')
        end
    end
end

function SublimeUI.GoActionControl(Controls, Action)
    if Controls[Action or 'Left'].Enabled then
        for Index = 1, #Controls[Action or 'Left'].Keys do
            if not Controls[Action or 'Left'].Pressed then
                if IsDisabledControlJustPressed(Controls[Action or 'Left'].Keys[Index][1], Controls[Action or 'Left'].Keys[Index][2]) then
                    Controls[Action or 'Left'].Pressed = true
                    Citizen.CreateThread(function()
                        Controls[Action or 'Left'].Active = true
                        Citizen.Wait(0.01)
                        Controls[Action or 'Left'].Active = false
                        Citizen.Wait(175)
                        while Controls[Action or 'Left'].Enabled and IsDisabledControlPressed(Controls[Action or 'Left'].Keys[Index][1], Controls[Action or 'Left'].Keys[Index][2]) do
                            Controls[Action or 'Left'].Active = true
                            Citizen.Wait(1)
                            Controls[Action or 'Left'].Active = false
                            Citizen.Wait(124)
                        end
                        Controls[Action or 'Left'].Pressed = false
                        if (Action ~= ControlActions[5]) then
                            Citizen.Wait(10)
                        end
                    end)
                    break
                end
            end
        end
    end
end

function SublimeUI.Controls(self)
    if self.visible then
        local Controls = self.controls;
        local Options = self.items_count
        SublimeUI.Options = self.items_count
        --print(SublimeUI.Options)
        --if CurrentMenu.EnableMouse then
        --    DisableAllControlActions(2)
        --end

        if not IsInputDisabled(2) then
            for i = 1, #Controls.Enabled.Controller do
                EnableControlAction(Controls.Enabled.Controller[i][1], Controls.Enabled.Controller[i][2], true)
            end
        else
            for i = 1, #Controls.Enabled.Keyboard do
                EnableControlAction(Controls.Enabled.Keyboard[i][1], Controls.Enabled.Keyboard[i][2], true)
            end
        end

        if Controls.Up.Enabled then
            for i = 1, #Controls.Up.Keys do
                if not Controls.Up.Pressed then
                    if IsDisabledControlJustPressed(Controls.Up.Keys[i][1], Controls.Up.Keys[i][2]) then
                        Controls.Up.Pressed = true
                        Citizen.CreateThread(function()
                            SublimeUI.GoUp(self, Options)
                            Citizen.Wait(175)
                            while Controls.Up.Enabled and IsDisabledControlPressed(Controls.Up.Keys[i][1], Controls.Up.Keys[i][2]) do
                                SublimeUI.GoUp(self, Options)
                                Citizen.Wait(50)
                            end
                            Controls.Up.Pressed = false
                        end)
                        break
                    end
                end
            end
        end

        if Controls.Down.Enabled then
            for i = 1, #Controls.Down.Keys do
                if not Controls.Down.Pressed then
                    if IsDisabledControlJustPressed(Controls.Down.Keys[i][1], Controls.Down.Keys[i][2]) then
                        Controls.Down.Pressed = true
                        Citizen.CreateThread(function()
                            SublimeUI.GoDown(self, Options)
                            Citizen.Wait(175)
                            while Controls.Down.Enabled and IsDisabledControlPressed(Controls.Down.Keys[i][1], Controls.Down.Keys[i][2]) do
                                SublimeUI.GoDown(self, Options)
                                Citizen.Wait(50)
                            end
                            Controls.Down.Pressed = false
                        end)
                        break
                    end
                end
            end
        end

        for i = 1, #ControlActions do
            SublimeUI.GoActionControl(Controls, ControlActions[i])
        end

        --SublimeUI.GoActionControlSlider(Controls, 'SliderLeft')
        --SublimeUI.GoActionControlSlider(Controls, 'SliderRight')

        if Controls.Back.Enabled then
            for i = 1, #Controls.Back.Keys do
                if not Controls.Back.Pressed then
                    if IsDisabledControlJustPressed(Controls.Back.Keys[i][1], Controls.Back.Keys[i][2]) then
                        Controls.Back.Pressed = true
                        Citizen.CreateThread(function()
                            Citizen.Wait(175)
                            Controls.Down.Pressed = false
                        end)
                        break
                    end
                end
            end
        end

    end
end

function SublimeUI.Navigation(self)
    drawSprite(Config.Navigation.Rectangle.Dictionary, Config.Navigation.Rectangle.Texture,
        self.setting.x + Config.Navigation.Rectangle.X + SublimeUI.ItemOffSet,
        self.setting.y + Config.Navigation.Rectangle.Y + self.widthOffset, 
        Config.Navigation.InNav.Rectangle.Width, 
        Config.Navigation.InNav.Rectangle.Height,
        {0, 0, 0, 200}, 0.0
    )
    --RenderRectangle(
    --    CurrentMenu.X, 
    --    CurrentMenu.Y + CurrentMenu.SubtitleHeight + RageUI.ItemOffset, 
    --    RageUI.Settings.Items.Navigation.Rectangle.Width + CurrentMenu.WidthOffset, 
    --    RageUI.Settings.Items.Navigation.Rectangle.Height
    --    , 0, 0, 0, 200)
    --drawSprite(self.setting.x, self.setting.y + Config.Navigation.InNav.Rectangle.Height + 0 + 0, Config.Navigation.InNav.Rectangle.Width -500, Config.Navigation.InNav.Rectangle.Height, {0, --0, 0, 200})
    self.nav_visible = false   
    if self.nav_visible then
        drawSprite(Config.Navigation.Rectangle.Dictionary, Config.Navigation.Rectangle.Texture, self.setting.x + Config.Navigation.Rectangle.X + (0 / 2), self.setting.y + Config.Navigation.Rectangle.Y + 150 + self.itemsOffSetH, Config.Navigation.Rectangle.Width, Config.Navigation.Rectangle.Height, Config.Navigation.Rectangle.Color, 0.0)
        drawSprite(Config.Navigation.Arrows.Dictionary, Config.Navigation.Arrows.Texture, self.setting.x + Config.Navigation.Arrows.X + (0 / 2), self.setting.y + Config.Navigation.Arrows.Y + 140 + self.itemsOffSetH, Config.Navigation.Arrows.Width, Config.Navigation.Arrows.Height, Config.Navigation.Arrows.Color, 0.0)
        --self.itemsOffSetH = self.itemsOffSetH + (Config.Navigation.Rectangle.Height * 2)
    end
end
