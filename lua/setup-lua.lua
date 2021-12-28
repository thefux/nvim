local all = { '^completion', '^lsp-lua', '^lsp-rust', '^lsp-python'}


for k in pairs(package.loaded) do
    for _, value in ipairs(all) do
        if k:match(value) then
            package.loaded[k] = nil
        end
    end
end


require("lsp-lua")
require("lsp-rust")
require("lsp-python")
require("completion")
