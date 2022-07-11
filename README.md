# sublime_nativeui

<h1> NE PAS UTILISEZ EN COURS DE DEVELOPPEMENT </h1>

<h3> Documentation [pour teste] </h3>

```lua
-- Lua 5.4 

----------------------------------------------------------------------------
local menu1,menu2 -- init var like it if you want use it local and not global 
--function ToggleMenu(args) -- Your own function to create menu when you open it
function ToggleMenu(menu)

    -- Menu 1
    if menu == 1 and not menu1 then
        menu1 = SublimeUI.CreateMenu(nil, "Titre 1", "Sous-Titre 1",
            nil,
            {
                color = {
                    banner = {255,0,0,120}
                },
                texture = {}
                
            }
        )
        if menu1 then
            --menu1:glare(false) -- work
            menu1:open(true)
            function menu1:beVisible() -- before you are in loop
                print(("id : %s, title : %s, subtitle : %s, x : %s, y : %s, w : %s, h : %s, color : %s, parent : %s, menu_table_ref : %s"):format(self.id, self.title, self.subtitle, self.setting.x, self.setting.y, self.setting.w, self.setting.h, json.encode(self.options.color.banner), self.parent, self))
                --print(self.title)
                --self.display.background = false
                self.options.color.subtitle = {255,255,255,120}
                self.title = "NewTitle"
                self:addButton("~y~boutton1", 'description1', {color = {255,255,255,80}}, true, {
                    onActive = function()
                        print("onActive .. 1")
                    end,
                    onSelected = function()
                        print("onSelected .. 1")
                    end
                })
                self:addButton("~w~boutton2", 'description2', {color = {255,255,255,80}}, true, {
                    onActive = function()
                        --print("onActive .. 2")
                    end,
                    onSelected = function()
                        print("onSelected .. 2")
                    end
                })
                self:addButton("~w~boutton3", 'description3', {color = {255,255,255,80}}, true, {
                    onActive = function()
                        print("onActive .. 3")
                    end,
                    onSelected = function()
                        print("onSelected .. 3")
                    end
                })
                self:addButton("~w~boutton4", 'description4', {color = {255,255,255,80}}, true, {
                    onActive = function()
                        --print("onActive .. 4")
                    end,
                    onSelected = function()
                        print("onSelected .. 4")
                    end
                })
                print(self.items.button[1].texte, self.items.button[1].texte, json.encode(self.items.button[1].style.color))
                --for i = 1, 10 do
                --    self:addButton("~g~#~w~"..(i+4), i, {color = {(i*4+100),(i*4+100),(i*4+100),80+(i*2+4)}}, true, {
                --        onActive = function()
                --            --print("onActive .. 4")
                --        end,
                --        onSelected = function()
                --            print("onSelected .. 4")
                --        end
                --    })
                --end
            end
            function menu1:isVisible()-- Loop active when you use menu1:open(true)
                
                --print(("id : %s, title : %s, subtitle : %s, x : %s, y : %s, w : %s, h : %s, color : %s, parent : %s, menu_table_ref : %s"):format(self.id, self.title, self.subtitle, self.x, self.y, self.w, self.h, json.encode(self.color), self.  parent, self))
            end
        end
    elseif menu == 1 and menu1 then
        menu1 = menu1:open(false)
    end

    -- Menu 2
    if menu == 2 and not menu2 then
        menu2 = SublimeUI.CreateMenu(nil, "Titre 2", "Sous-titre 2", {x = 500, y = 500})
        if menu2 then
            menu2:open(true)
            function menu2:beVisible() -- before you are in loop
                --print(("id : %s, title : %s, subtitle : %s, x : %s, y : %s, w : %s, h : %s, color : %s, parent : %s, menu_table_ref : %s"):format(self.id, self.title, self.subtitle, self.x, self.y, self.w, self.h, json.encode(self.color), self.parent, self))
                for i = 1, 5 do
                    self:addButton("~s~Button #"..i, i, {color = {0,0,0,80}})
                end
            end
            function menu2:isVisible() -- in loop
                --print(("id : %s, title : %s, subtitle : %s, x : %s, y : %s, w : %s, h : %s, color : %s, parent : %s, menu_table_ref : %s"):format(self.id, self.title, self.subtitle, self.setting.x, self.setting.y, self.setting.w, self.setting.h, json.encode(self.options.color.banner), self.parent, self))
            end
        end
    elseif menu == 2 and menu2 then
        menu2 = menu2:open(false)
    end
end   

RegisterCommand('toggle1', function()
    ToggleMenu(1)
end, false)

RegisterCommand('toggle2', function()
    ToggleMenu(2)
end, false)

RegisterCommand('title', function()
    menu1.title = "Salut Chouhou"
end, false)

RegisterCommand('stitle', function()
    menu1.subtitle = "long sous titre sa mère la pute"
end, false)
```

<h3> Documentation [final] </h3>

```cfg
#start script

ensure sublime_nativeui
```

```lua
-- fxmanifest
lua54 'yes'

client_script '@sublime_nativeui/import.lua'
```
