local status, mason = pcall(require, 'mason')
if not status then
    vim.notify('没有找到 mason')
    return
end

local status, mason_config = pcall(require, 'mason-lspconfig')
if not status then
    vim.notify('没有找到 mason-lspconfig')
    return
end

local status, lspconfig = pcall(require, 'lspconfig')
if not status then
    vim.notify('没有找到 lspconfig')
    return
end

-- :h mason-default-settings
-- ~/.local/share/nvim/mason
mason.setup({
    ui = {
        icons = {
            package_installed = '✓',
            package_pending = '➜',
            package_uninstalled = '✗',
        },
    },
})

-- mason-lspconfig uses the `lspconfig` server names in the APIs it exposes - not `mason.nvim` package names
-- https://github.com/williamboman/mason-lspconfig.nvim/blob/main/doc/server-mapping.md
mason_config.setup({
    ensure_installed = {
        'sumneko_lua',
        'clangd',
        'pyright',
        'marksman',
        'remark_ls',

        'cssls',
        'html',
        'jsonls',
        'dockerls',
        -- 'gopls',
        'rust_analyzer',
        'bashls',
        -- 'ltex-ls',
        'sqlls',
        -- 'phpactor',
        -- 'csharp_ls',
        'jdtls', --  JAVA
        'vuels',
        'tsserver', -- javascript
    },
})

-- 安装列表
-- { key: 服务器名， value: 配置文件 }
-- key 必须为下列网址列出的 server name，不可以随便写
-- https://github.com/williamboman/nvim-lsp-installer#available-lsps
local servers = {
    sumneko_lua = require('lsp.config.lua'), -- lua/lsp/config/lua.lua
    clangd = require('lsp.config.clangd'),
    pyright = require('lsp.config.pyright'),
    marksman = require('lsp.config.general'),
    remark_ls = require('lsp.config.general'),

    cssls = require('lsp.config.general'),
    html = require('lsp.config.general'),
    jsonls = require('lsp.config.general'),
    dockerls = require('lsp.config.general'),
    -- gopls = require('lsp.config.general'),
    rust_analyzer = require('lsp.config.general'),
    bashls = require('lsp.config.general'),
    -- ltex-ls = require('lsp.config.general'),
    sqlls = require('lsp.config.general'),
    -- phpactor = require('lsp.config.general'),
    -- csharp_ls = require('lsp.config.general'),
    jdtls = require('lsp.config.general'),
    vuels = require('lsp.config.general'),
    tsserver = require('lsp.config.general'),
    -- emmet_ls = require("lsp.config.emmet"),
    -- tsserver = require("lsp.config.typescript"),
    -- yamlls = require("lsp.config.yamlls"),
    -- tailwindcss = require("lsp.config.tailwindcss"),
    -- taplo = require("lsp.config.taplo"), -- toml
    -- cmake = require("lsp.config.cmake"),
}

for name, config in pairs(servers) do
    if config ~= nil and type(config) == 'table' then
        -- 自定义初始化配置文件必须实现on_setup 方法
        config.on_setup(lspconfig[name])
    else
        -- 使用默认参数
        lspconfig[name].setup({})
    end
end

require('lsp.ui')
