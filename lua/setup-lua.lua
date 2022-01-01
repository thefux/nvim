local all = {
    'completion',
    'lsp-lua',
    'lsp-rust',
    'lsp-python',
    'lsp-config',
    'debug-python',
    'debug-config',
    'debug-rust',
    'status-line-config',
}


-- TODO: put in a function and automate loading a reloading
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
require("lsp-config")

require("debug-config")
require("debug-python")
require("debug-rust")
require("status-line-config")

