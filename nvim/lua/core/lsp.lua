vim.lsp.enable({
  "gopls",
  "lua_ls",
  "yamlls",
  "ansiblels",
  "groovyls",
  "jsonls",
  "rust_analyzer"
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

-- Turn on auto completion menu to suggest auto-import packages in Golang
vim.lsp.config("gopls", {
  settings = {
    gopls = {
      completeUnimported = true,
      usePlaceholders = true,
      analyses = {
        unusedparams = true,
      },
    },
  },
})
