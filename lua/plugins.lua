local packer = require('packer')
packer.startup({
    function(use)
        -- Packer 可以管理自己本身
        use('wbthomason/packer.nvim')
        -- 你的插件列表...
        --------------------- colorschemes --------------------
        -- tokyonight
        use('folke/tokyonight.nvim')
        use('arcticicestudio/nord-vim')
        -------------------------------------------------------
        -- -- nvim-tree
        use({ 'nvim-tree/nvim-tree.lua', requires = 'nvim-tree/nvim-web-devicons' })
        -- bufferline
        use({ 'akinsho/bufferline.nvim', requires = { 'kyazdani42/nvim-web-devicons', 'moll/vim-bbye' } })
        -- lualine
        use({ 'nvim-lualine/lualine.nvim', requires = { 'kyazdani42/nvim-web-devicons' } })
        use('arkav/lualine-lsp-progress')
        -- telescope
        use({ 'nvim-telescope/telescope.nvim', tag = '0.1.0', requires = { 'nvim-lua/plenary.nvim' } })
        -- dashboard-nvim
        use('glepnir/dashboard-nvim')
        -- treesitter
        use({ 'nvim-treesitter/nvim-treesitter', run = ':TSUpdate' })
        --------------------- LSP --------------------
        use({ 'williamboman/mason.nvim' })
        use({ 'williamboman/mason-lspconfig.nvim' })
        -- Lspconfig
        use({ 'neovim/nvim-lspconfig' })

        -- 补全引擎
        use('hrsh7th/nvim-cmp')
        -- snippet 引擎
        use('hrsh7th/vim-vsnip')
        -- 补全源
        use('hrsh7th/cmp-vsnip')
        use('hrsh7th/cmp-nvim-lsp') -- { name = nvim_lsp }
        use('hrsh7th/cmp-buffer') -- { name = 'buffer' },
        use('hrsh7th/cmp-path') -- { name = 'path' }
        use('hrsh7th/cmp-cmdline') -- { name = 'cmdline' }

        -- 常见编程语言代码段
        use('rafamadriz/friendly-snippets')

        -- ui
        use('onsails/lspkind-nvim')
        -- indent-blankline
        use('lukas-reineke/indent-blankline.nvim')

        use('tami5/lspsaga.nvim')

        -- 代码格式化
        use('mhartington/formatter.nvim')

        -- terminal
        use('akinsho/toggleterm.nvim')
        -- comment
        use('numToStr/Comment.nvim')
        use('JoosepAlviste/nvim-ts-context-commentstring')
        -- autopairs
        use('windwp/nvim-autopairs')
        -- rainbow
        use('p00f/nvim-ts-rainbow')
        -- undotree
        use({ 'jiaoshijie/undotree', requires = { 'nvim-lua/plenary.nvim' } })
        -- marks
        -- use('chentoast/marks.nvim')
        -- fidget  lsp-ui
        use('j-hui/fidget.nvim')
        use({
            'iamcco/markdown-preview.nvim',
            run = function()
                vim.fn['mkdp#util#install']()
            end,
        })
        use('ekickx/clipboard-image.nvim')
    end,
    config = {
        -- 自定义源
        git = {
            -- default_url_format = "https://hub.fastgit.xyz/%s",
            -- default_url_format = "https://mirror.ghproxy.com/https://github.com/%s",
            -- default_url_format = "https://gitcode.net/mirrors/%s",
            -- default_url_format = "https://gitclone.com/github.com/%s",
            default_url_format = 'git@github.com:%s', -- 换用 git 协议
        },
    },
})

-- 每次保存 plugins.lua 自动安装插件
pcall(
    vim.cmd,
    [[
        augroup packer_user_config
        autocmd!
        autocmd BufWritePost plugins.lua source <afile> | PackerSync
        augroup end
      ]]
)
