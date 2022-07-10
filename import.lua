
function LOAD_MODULES(dir, module)
    assert(type(dir) == 'string')
    if type(module) ~= 'table' then
        assert(type(module) == 'string')
        local chunk = LoadResourceFile('sublime_nativeui', ("%s/%s.lua"):format(dir, module))
        chunk = load(chunk, ('@@sublime_nativeui/%s/%s.lua'):format(dir, module))
        chunk()
    else
        for _,v in ipairs(module) do
            local chunk = LoadResourceFile('sublime_nativeui', ("%s/%s.lua"):format(dir, v))
            chunk = load(chunk, ('@@sublime_nativeui/%s/%s.lua'):format(dir, v))
            chunk()
        end
    end
end

LOAD_MODULES('utils', {'drawSprite', 'drawRect', 'drawText', 'math'})
LOAD_MODULES('menu', {'main', 'config'})