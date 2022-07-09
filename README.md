# sublime_nativeui

<h1> NE PAS UTILISEZ EN COURS DE DEVELOPPEMENT </h1>

<h3> Documentation [pour teste] </h3>

```lua
-- Lua 5.4 

---CreateMenu (SublimeUI:CreateMenu)
---@param parent nil
---@param title string|nil
---@param subtitle string|nil
---@param x number|nil 
---@param y number|nil
---@param w number|nil
---@param h number|nil
---@param color table|nil
---@return table
local example = SublimeUI.CreateMenu(nil, nil, nil, nil, nil, nil, nil, nil)

------------------------------------------------------------------------------
local menu1,menu2 -- init var like it if you want use it local and not global 

--function CreateMenu(args) -- Your own function to create menu when you open it
function OpenMenu(menu)
    if menu == 1 and not menu1 then
        menu1 = SublimeUI.CreateMenu(nil, "test1", "test", 500, 500, nil, nil, {255,0,0,100})
        function menu1:isVisible()-- Loop active when you use menu1:open(true)
            print(("id : %s, title : %s, subtitle : %s, x : %s, y : %s, w : %s, h : %s, color : %s, parent : %s, menu_table_ref : %s"):format(self.id, self.title, self.subtitle, self.x, self.y, self.w, self.h, json.encode(self.color), self.parent, self))
        end
    end
    if menu == 2 and not menu2 then
        menu2 = SublimeUI.CreateMenu(nil, "test2", "test", 900, 900, nil, nil, {255,255,255,100})


        function menu2:isVisible() -- Loop active when you use menu2:open(true)
            print(("id : %s, title : %s, subtitle : %s, x : %s, y : %s, w : %s, h : %s, color : %s, parent : %s, menu_table_ref : %s"):format(self.id, self.title, self.subtitle, self.x, self.y, self.w, self.h, json.encode(self.color), self.parent, self))
        end
    end
end   

RegisterCommand('open1', function()
    OpenMenu(1)
    SublimeUI.OpenMenu(menu1)
end, false)

RegisterCommand('open2', function()
    OpenMenu(2)
    SublimeUI.OpenMenu(menu2)
end, false)

RegisterCommand('close1', function()
    menu1 = menu1:open(false)
end, false)

RegisterCommand('close2', function()
    menu2 = menu2:open(false)
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
