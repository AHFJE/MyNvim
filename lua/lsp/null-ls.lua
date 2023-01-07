local status, null_ls = pcall(require, 'null-ls')
if not status then
    vim.notify('没有找到 null-ls')
    return
end

local formatting = null_ls.builtins.formatting

null_ls.setup({
    debug = false,
    sources = {
        -- Formatting ---------------------
        --  brew install shfmt   shell
        formatting.shfmt,
        -- clang_format
        formatting.clang_format,
        -- python
        formatting.autopep8,
        -- StyLua
        formatting.stylua,
        -- frontend
        formatting.prettier.with({ -- 只比默认配置少了 markdown
            filetypes = {
                'javascript',
                'javascriptreact',
                'typescript',
                'typescriptreact',
                'vue',
                'css',
                'scss',
                'less',
                'html',
                'json',
                'yaml',
                'graphql',
                'markdown',
            },
            prefer_local = 'node_modules/.bin',
        }),
        -- formatting.fixjson,
        -- formatting.black.with({ extra_args = { "--fast" } }),
    },
    -- 保存自动格式化
    on_attach = function(client)
        if client.resolved_capabilities.document_formatting then
            vim.cmd('autocmd BufWritePre <buffer> lua vim.lsp.buf.formatting_sync()')
        end
    end,
})
