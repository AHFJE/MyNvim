local status, treesitter = pcall(require, 'nvim-treesitter.configs')
if not status then
    vim.notify('没有找到 nvim-treesitter')
    return
end

treesitter.setup({
    -- 安装 language parser
    -- :TSInstallInfo 命令查看支持的语言
    ensure_installed = {
        'json',
        'html',
        'css',
        'vim',
        'lua',
        'javascript',
        'typescript',
        'python',
        'cpp',
        'markdown',
        'go',
        'java',
        'latex',
        'c_sharp',
        'bash',
        'php',
        'rust',
        'scala',
        'sql',
        'swift',
        'vue',
    },
    -- 启用代码高亮模块
    highlight = {
        enable = true,
        disable = { 'python' }, -- 主要因为 python 的 highlight 效果没有原生的好 原因尚不清楚
        additional_vim_regex_highlighting = false,
    },
    -- 启用代码缩进模块 (=)
    indent = {
        enable = true,
    },
    -- comment module
    context_commentstring = {
        enable = true,
        enable_autocmd = false,
    },
    rainbow = {
        enable = true,
        -- disable = { "jsx", "cpp" }, list of languages you want to disable the plugin for
        extended_mode = true, -- Also highlight non-bracket delimiters like html tags, boolean or table: lang -> boolean
        max_file_lines = nil, -- Do not enable for files with more than n lines, int
        -- colors = {}, -- table of hex strings
        -- termcolors = {} -- table of colour name strings
    },
})

-- 开启 Folding 模块
vim.opt.foldmethod = 'expr'
vim.opt.foldexpr = 'nvim_treesitter#foldexpr()'
-- 默认不要折叠
-- https://stackoverflow.com/questions/8316139/how-to-set-the-default-to-unfolded-when-you-open-a-file
vim.opt.foldlevel = 99
