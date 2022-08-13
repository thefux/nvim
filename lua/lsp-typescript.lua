require'lspconfig'.tsserver.setup{}
-- local nvim_lsp = require'lspconfig'
-- -- local nvim_lsp = require('nvim_lsp')

-- nvim_lsp.tsserver.setup{
--   on_attach=custom_attach;
--   on_new_config=function (new_config)
--     local pnp_root = nvim_lsp.util.search_ancestors(new_config.root_dir, function(path)
--       local bin = nvim_lsp.util.path.join(path, ".yarn", "sdks", "typescript", "bin", "tsserver")
--       if nvim_lsp.util.path.is_file(bin) then
--         return bin
--       end
--     end)

--     if pnp_root then
--       local pnp_tsserver = nvim_lsp.util.path.join(pnp_root, ".yarn", "sdks", "typescript", "bin", "tsserver")
--       table.insert(new_config.cmd, "--tsserver-path")
--       table.insert(new_config.cmd, pnp_tsserver)
--     end
--   end;
-- }
