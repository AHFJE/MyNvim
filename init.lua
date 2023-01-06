-- 基础配置
require('basic')
-- Packer插件管理
require('plugins')
-- 快捷键映射
require('keybindings')
-- 主题设置
require('colorscheme')
-- 插件配置
require('plugin-config.nvim-tree')
require('plugin-config.bufferline')
require('plugin-config.lualine')
require('plugin-config.telescope')
require('plugin-config.dashboard')
require('plugin-config.nvim-treesitter')
require('plugin-config.indent-blankline')
require('plugin-config.toggleterm')
require('plugin-config.comment')
require('plugin-config.autopairs')
require('plugin-config.undotree')
-- require('plugin-config.marks')
require('plugin-config.fidget')
require('plugin-config.markdown-preview')

-- 内置LSP
require('lsp.setup')
require('lsp.cmp')
require('lsp.ui')

require('lsp.formatter')

-- 设置自动保存
vim.api.nvim_create_autocmd({ 'InsertLeave', 'BufLeave', 'FocusLost' }, {
    callback = function()
        vim.fn.execute('silent! write')
        vim.notify('Autosaved!', vim.log.levels.INFO, {})
    end,
})

-- 设置 undotree 的历史文件夹
vim.cmd([[
    set undofile " Maintain undo history between sessions
    set undodir=~/.config/nvim/.undodir
]])
