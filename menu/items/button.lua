SublimeUI = SublimeUI or {}
function SublimeUI.CreateButton(self, texte, description, style, enable, action, submenu)
    --SublimeUI.Options += 1
    --print(self, texte, description, style, enable, action, submenu)
    print(SublimeUI.ItemOffSet..' offset') 
    local id = self.items_count + 1
    self.items_count += 1
    --if self.pagination.min <= id and id <= self.pagination.max then
        self.items.button[id] = {}
        self.items.button[id].index = id
        self.items.button[id].texte = texte or nil
        self.items.button[id].description = description or nil
        self.items.button[id].style = {}
        self.items.button[id].style.color = style.color
        self.items.button[id].action = {}
        self.items.button[id].action.selected = action.onSelected
        self.items.button[id].submenu = submenu or nil
        self.items.button[id].offSet = SublimeUI.ItemOffSet

        --self.items.button[id].offsetY = self.itemsOffSetY
        --self.items.button[id].textoffsetY = self.itemTextOffSetY 
        --print(self.items.button[id], self.items.button[id].name, self.items.button[id].label)
        
        --if selected then
        --    CreateThread(function()
        --        action.onSelected()
        --    end)
        --end
        
        self.items.button[id].render = function()
            --drawRect(self.setting.x, self.setting.y + Config.Button.SelectedSprite.Y + 134 +  self.items.button[id].submenu , Config.Button.SelectedSprite.Width + self.widthOffset, Config.--Button.SelectedSprite.Height, {0,0,0,200})
            local Active = self.currentIndex == self.items.button[id].index
            local Selected = self.controls.Select.Active and Active
            if Active then
                drawSprite(Config.Button.SelectedSprite.Dictionary, Config.Button.SelectedSprite.Texture,
                    self.setting.x,
                    (self.setting.y + Config.Button.SelectedSprite.Y) + (self.items.button[id].offSet - SublimeUI.ItemOffSet),
                    Config.Button.SelectedSprite.Width + 0,
                    Config.Button.SelectedSprite.Height,
                    {0;0;0;120}
                )
                if action.onActive ~= nil then
                    action.onActive()
                end
            end
            if Selected then
                CreateThread(function()
                    action.onSelected()
                end)
            end
            
            drawSprite(Config.Button.SelectedSprite.Dictionary, Config.Button.SelectedSprite.Texture,
                self.setting.x,
                (self.setting.y + Config.Button.SelectedSprite.Y) + (self.items.button[id].offSet - SublimeUI.ItemOffSet),
                Config.Button.SelectedSprite.Width + 0,
                Config.Button.SelectedSprite.Height,
                self.items.button[id].style.color
            )
            --drawSprite(Config.Button.SelectedSprite.Dictionary, Config.Button.SelectedSprite.Texture, self.setting.x, self.setting.y + Config.Button.SelectedSprite.Y + self.items.button[id].--offsetY + SublimeUI.ItemOffSet, Config.Button.SelectedSprite.Width + 0, Config.Button.SelectedSprite.Height, self.items.button[id].style.color, 0.0) 
            drawText(self.items.button[id].texte, 
                self.setting.x + 8, 
                (self.setting.y + Config.Button.SelectedSprite.Y) + (self.items.button[id].offSet - SublimeUI.ItemOffSet), 
                0, 0.30, {0,0,0,255}, nil, false, false, 
                0
            )
        end
    --end
    SublimeUI.ItemOffSet = SublimeUI.ItemOffSet + Config.Button.SelectedSprite.Height + Config.Button.SelectedSprite.Space
    SublimeUI.Options += 1
    print(SublimeUI.Options)
     
end