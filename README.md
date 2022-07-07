# sublime_nativeui

<h1> NE PAS UTILISEZ EN COURS DE DEVELOPPEMENT </h1>

<h3> Documentation [pour teste] </h3>

```lua
-- Lua 5.4 

---CreateMenu (SublimeUI:CreateMenu)
---@param title string|nil
---@param subtitle string|nil
---@param x number|nil 
---@param y number|nil
---@param w number|nil
---@param h number|nil
---@param color table|nil
---@return table
local menu = SublimeUI:CreateMenu("Title", "Subtitle", nil, nil, nil, nil, {0,0,0,150})

CreateThread(function()
    while true do
        Wait(0)
        menu:show()
    end
end
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
