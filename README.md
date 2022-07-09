# sublime_nativeui

<h1> NE PAS UTILISEZ EN COURS DE DEVELOPPEMENT </h1>

<h3> Documentation [pour teste] </h3>

```lua
-- Lua 5.4 

---CreateMenu (SublimeUI:CreateMenu)
---@param parent object|nil
---@param title string|nil
---@param subtitle string|nil
---@param x number|nil 
---@param y number|nil
---@param w number|nil
---@param h number|nil
---@param color table|nil
---@return table
local exemple = SublimeUI.CreateMenu(nil, nil, nil, nil, nil, nil, nil, nil)
----------------------------------------------------------------------------
local menu1,menu2 -- init var like it if you want use it local and not global 
--function ToggleMenu(args) -- Your own function to create menu when you open it
function ToggleMenu(menu)

    -- Menu 1
    if menu == 1 and not menu1 then
        menu1 = SublimeUI.CreateMenu(nil, "test1", "test", 500, 500, nil, nil, {255,0,0,100})
        if menu1 then
            menu1:open(true)
            function menu1:beVisible() -- before you are in loop
                print(("id : %s, title : %s, subtitle : %s, x : %s, y : %s, w : %s, h : %s, color : %s, parent : %s, menu_table_ref : %s"):format(self.id, self.title, self.subtitle, self.x, self.y, self.w, self.h, json.encode(self.color), self.parent, self))
                print(self.title) -- = test1
                Wait(5000) -- wait 5sec
                self.color = {0,0,255,150}
                self.title = "NewTitle"
                print(self.title) -- = NewTitle
                -- you can set what you want with self class from object menu1 (self.color = {0,0,0,255} or self.options.banner = false)
            end
            function menu1:isVisible()-- Loop active when you use menu1:open(true)
                --print(("id : %s, title : %s, subtitle : %s, x : %s, y : %s, w : %s, h : %s, color : %s, parent : %s, menu_table_ref : %s"):format(self.id, self.title, self.subtitle, self.x, self.y, self.w, self.h, json.encode(self.color), self.parent, self))
            end
        end
    elseif menu == 1 and menu1 then
        menu1 = menu1:open(false)
    end

    -- Menu 2
    if menu == 2 and not menu2 then
        menu2 = SublimeUI.CreateMenu(nil, "test2", "test", 900, 900, nil, nil, {255,255,255,100})
        if menu2 then
            menu2:open(true)
            function menu2:beVisible() -- before you are in loop
                --print(("id : %s, title : %s, subtitle : %s, x : %s, y : %s, w : %s, h : %s, color : %s, parent : %s, menu_table_ref : %s"):format(self.id, self.title, self.subtitle, self.x, self.y, self.w, self.h, json.encode(self.color), self.parent, self))
            end
            function menu2:isVisible() -- in loop
                print(("id : %s, title : %s, subtitle : %s, x : %s, y : %s, w : %s, h : %s, color : %s, parent : %s, menu_table_ref : %s"):format(self.id, self.title, self.subtitle, self.x, self.y, self.w, self.h, json.encode(self.color), self.  parent, self))
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
