
function LOAD_MODULES(dir, module)
    assert(type(dir) == 'string')
    if type(module) ~= 'table'  then
        assert(type(module) == 'string')
        chunk = LoadResourceFile('sublime_nativeui', ("%s/%s.lua"):format(dir, module))
        chunk = load(chunk, ('@@sublime_nativeui/%s/%s.lua'):format(dir, module))
        chunk()
    else
        for _,v in pairs(module)do
            chunk = LoadResourceFile('sublime_nativeui', ("%s/%s.lua"):format(dir, v))
            chunk = load(chunk, ('@@sublime_nativeui/%s/%s.lua'):format(dir, v))
            chunk()
        end
    end
end

LOAD_MODULES('utils', {'drawSprite', 'drawRect'})
LOAD_MODULES('menu', 'main')