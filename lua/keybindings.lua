vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

local map = vim.api.nvim_set_keymap
-- 复用 opt 参数
local opt = { noremap = true, silent = true }

map('n', ';', ':', opt)
-- 取消 s 默认功能
map('n', 's', '', opt)

map('n', '<C-a>', '0', opt)
map('n', '<C-e>', '$', opt)
-- insert 模式下，跳到行首行尾
map('i', '<C-a>', '<ESC>I', opt)
map('i', '<C-e>', '<ESC>A', opt)
map('i', '<M-w>', '<ESC>ciw', opt)
map('n', '<M-w>', 'ciw', opt)

map('n', '<C-w>', ':Bdelete!<CR>', opt) -- 关闭标签页
map('n', '<LEADER>m', '<C-w>c', opt) -- 关闭分屏
map('n', '<LEADER>n', ':noh<CR>', opt) -- 关闭搜索之后的高亮

map('n', '<M-s>', ':w<CR>', opt)
map('i', '<M-s>', '<ESC>:w<CR>', opt)
map('n', '<M-a>', 'gg0vG$', opt) -- 全选
map('v', '<M-c>', '"+y', opt)
map('v', '(', 'di()<ESC>hp', opt)
-- map('v', '(', '<ESC><ESC>`>a)<ESC>`<i(', opt)
map('v', "'", "di''<ESC>hp", opt)
map('v', '"', 'di""<ESC>hp', opt)
map('v', '[', 'di[]<ESC>hp', opt)
map('v', '{', 'di{}<ESC>hp', opt)

-- windows 分屏快捷键
map('n', 'sv', ':vsp<CR>', opt)
map('n', 'sh', ':sp<CR>', opt)
-- 关闭当前
map('n', 'sc', '<C-w>c', opt)
-- 关闭其他
map('n', 'so', '<C-w>o', opt)
-- Alt + hjkl  窗口之间跳转
map('n', '<LEADER>h', '<C-w>h', opt)
map('n', '<LEADER>j', '<C-w>j', opt)
map('n', '<LEADER>k', '<C-w>k', opt)
map('n', '<LEADER>l', '<C-w>l', opt)

-- 左右比例控制
map('n', '<C-h>', ':vertical resize -5<CR>', opt)
map('n', '<C-l>', ':vertical resize +5<CR>', opt)
-- 上下比例
map('n', '<C-k>', ':resize +5<CR>', opt)
map('n', '<C-j>', ':resize -5<CR>', opt)
-- 等比例
map('n', 's=', '<C-w>=', opt)

-- visual模式下缩进代码
map('v', '<', '<gv', opt)
map('v', '>', '>gv', opt)
-- 上下移动选中文本
map('v', 'J', ":move '>+1<CR>gv-gv", opt)
map('v', 'K', ":move '<-2<CR>gv-gv", opt)

-- ctrl u / ctrl + d  只移动9行，默认移动半屏
map('n', '<C-u>', '9k', opt)
map('n', '<C-d>', '9j', opt)

-- 插件快捷键
local pluginKeys = {}

-- nvim-tree
-- Tab 键打开关闭tree
map('n', '<Tab>', ':NvimTreeToggle<CR>', opt)
-- 列表快捷键
pluginKeys.nvimTreeList = {
    -- 打开文件或文件夹
    { key = { '<CR>', 'o', '<2-LeftMouse>' }, action = 'newtab' },
    { key = '<Tab>', action = ':NvimTreeToggle<CR>' },
    -- 分屏打开文件
    { key = 'v', action = 'vsplit' },
    { key = 'h', action = 'split' },
    -- 显示隐藏文件
    { key = 'i', action = 'toggle_custom' }, -- 对应 filters 中的 custom (node_modules)
    { key = '.', action = 'toggle_dotfiles' }, -- Hide (dotfiles)
    -- 文件操作
    { key = '<F5>', action = 'refresh' },
    { key = 'a', action = 'create' },
    { key = 'd', action = 'remove' },
    { key = 'r', action = 'rename' },
    { key = 'x', action = 'cut' },
    { key = 'c', action = 'copy' },
    { key = 'p', action = 'paste' },
    { key = 's', action = 'system_open' },
}

-- bufferline
-- 关闭
--"moll/vim-bbye"
map('n', '<LEADER>bl', ':BufferLineCloseRight<CR>', opt)
map('n', '<LEADER>bh', ':BufferLineCloseLeft<CR>', opt)
map('n', '<LEADER>bc', ':BufferLinePickClose<CR>', opt)

-- Telescope
-- 查找文件
map('n', '<C-p>', ':Telescope find_files<CR>', opt)
map('n', '<M-o>', ':Telescope oldfiles<CR>', opt)
-- 全局搜索
map('n', '<M-f>', ':Telescope live_grep<CR>', opt)
-- 查看 register
map('n', 're', ':Telescope registers<CR>', opt)
-- change colorsheme
map('n', 'col', ':Telescope colorscheme<CR>', opt)
-- Telescope 列表中 插入模式快捷键
pluginKeys.telescopeList = {
    i = {
        -- 上下移动
        ['<C-j>'] = 'move_selection_next',
        ['<C-k>'] = 'move_selection_previous',
        ['<Down>'] = 'move_selection_next',
        ['<Up>'] = 'move_selection_previous',
        -- 历史记录
        ['<C-n>'] = 'cycle_history_next',
        ['<C-p>'] = 'cycle_history_prev',
        -- 关闭窗口
        ['<C-c>'] = 'close',
        -- 预览窗口上下滚动
        ['<C-u>'] = 'preview_scrolling_up',
        ['<C-d>'] = 'preview_scrolling_down',
    },
}

-- comment
-- map('n', '<M-/>', 'gc', opt)
-- map('i', '<M-/>', '<ESC>gci', opt)

-- 在iterm里面设置快捷键 使得按下CMD+/的效果为Vgc

-- rename
-- map("n", "<LEADER>r", "<cmd>Lspsaga rename<CR>", opt)
-- code action
-- map("n", "<LEADER>ca", "<cmd>Lspsaga code_action<CR>", opt)
-- -- go xx
-- map("n", "gd", "<cmd>Lspsaga preview_definition<CR>", opt)
-- map("n", "gh", "<cmd>Lspsaga hover_doc<cr>", opt)
-- map("n", "gD", "<cmd>lua vim.lsp.buf.declaration()<CR>", opt)
-- map("n", "gi", "<cmd>lua vim.lsp.buf.implementation()<CR>", opt)
-- map("n", "gr", "cmd>Lspsaga lsp_finder<CR>", opt)
-- -- diagnostic
-- map("n", "gp", "<cmd>Lspsaga show_line_diagnostics<CR>", opt)
-- map("n", "gk", "<cmd>Lspsaga diagnostic_jump_next<cr>", opt)
-- map("n", "gj", "<cmd>Lspsaga diagnostic_jump_prev<cr>", opt)
map('n', '<LEADER>f', ':Format<CR>', opt)

-- undotree
map('n', '<LEADER>u', "<cmd>lua require('undotree').toggle()<CR>", opt)

-- lsp 回调函数快捷键设置
pluginKeys.mapLSP = function(mapbuf)
    -- rename
    mapbuf('n', '<LEADER>r', '<cmd>Lspsaga rename<CR>', opt)
    -- code action
    mapbuf('n', '<LEADER>ca', '<cmd>Lspsaga code_action<CR>', opt)
    -- go xx
    mapbuf('n', 'gd', '<cmd>Lspsaga preview_definition<CR>', opt)
    mapbuf('n', '<LEADER>d', '<cmd>lua vim.lsp.buf.declaration()<CR>', opt)

    mapbuf('n', 'gh', '<cmd>Lspsaga hover_doc<cr>', opt)
    mapbuf('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>', opt)
    mapbuf('n', 'gr', 'cmd>Lspsaga lsp_finder<CR>', opt)
    -- diagnostic
    mapbuf('n', 'gp', '<cmd>Lspsaga show_line_diagnostics<CR>', opt)
    mapbuf('n', 'gk', '<cmd>Lspsaga diagnostic_jump_next<cr>', opt)
    mapbuf('n', 'gj', '<cmd>Lspsaga diagnostic_jump_prev<cr>', opt)
    -- mapbuf("n", "<LEADER>f", "<cmd>lua vim.lsp.buf.format()<CR>", opt)
end

-- nvim-cmp 自动补全
pluginKeys.cmp = function(cmp)
    return {
        -- 出现补全
        ['<C-,>'] = cmp.mapping(cmp.mapping.complete(), { 'i', 'c' }),
        -- 取消
        ['<C-.>'] = cmp.mapping({
            i = cmp.mapping.abort(),
            c = cmp.mapping.close(),
        }),
        -- 上一个
        ['<C-k>'] = cmp.mapping.select_prev_item(),
        -- 下一个
        ['<C-j>'] = cmp.mapping.select_next_item(),
        -- 确认
        ['<CR>'] = cmp.mapping.confirm({
            select = true,
            behavior = cmp.ConfirmBehavior.Replace,
        }),
        -- 如果窗口内容太多，可以滚动
        ['<C-u>'] = cmp.mapping(cmp.mapping.scroll_docs(-4), { 'i', 'c' }),
        ['<C-d>'] = cmp.mapping(cmp.mapping.scroll_docs(4), { 'i', 'c' }),
    }
end

-- file keymap
vim.cmd('source ~/.config/nvim/lua/file_keymap.vim')

return pluginKeys
