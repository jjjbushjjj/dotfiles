-- 1. Подгружаем плагин (если он в pack/vendor/start/...)
local ok, ts = pcall(require, "nvim-treesitter")
if not ok then return end

local ensure_installed = { "lua", "vim", "vimdoc", "query", "markdown", "markdown_inline", "hcl", "yaml", "json" }

ts.install(ensure_installed)

-- 3. Эмуляция auto_install (установка при открытии нового типа файла)
vim.api.nvim_create_autocmd("FileType", {
  group = vim.api.nvim_create_augroup("TSAutoInstall", { clear = true }),
  callback = function()
    local lang = vim.treesitter.language.get_lang(vim.bo.filetype) or vim.bo.filetype
    -- Пытаемся запустить Treesitter. Если парсера нет — пробуем установить.
    local ok_start = pcall(vim.treesitter.start)
    if not ok_start then
        -- Если парсера нет, вызываем установку
        -- (проверка наличия парсера в новых версиях через ts.install)
        ts.install(lang)
    end
  end,
})
vim.opt.foldmethod = "expr"
vim.opt.foldexpr = "v:lua.vim.treesitter.foldexpr()"
vim.opt.foldlevel = 99
vim.opt.foldlevelstart = 99
vim.opt.foldtext = "v:lua.MyFoldText()"
vim.opt.fillchars:append({ fold = " " })

vim.api.nvim_set_hl(0, "Folded", { fg = "#7aa2f7", bg = "#1e222a", italic = true })
