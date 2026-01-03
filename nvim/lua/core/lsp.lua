vim.lsp.enable({
  "gopls",
  "lua_ls"
})

-- Fix global warnings with indefined vim in lua files
vim.lsp.config("lua_ls", {
  settings = {
    Lua = {
      workspace = {
        library = vim.api.nvim_get_runtime_file("", true)
      }
    }
  }
})
