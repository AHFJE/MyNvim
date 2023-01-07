local status, formatter = pcall(require, 'formatter')
if not status then
    vim.notify('没有找到 formatter')
    return
end

formatter.setup({
    filetype = {
        lua = {
            function()
                return {
                    exe = 'stylua',
                    args = {
                        '--config-path ',
                        --   .. os.getenv("XDG_CONFIG_HOME")
                        '~/.config/nvim/.stylua.toml',
                        '-',
                    },
                    stdin = true,
                }
            end,
        },
        python = {
            function()
                return {
                    exe = 'python3 -m autopep8',
                    args = {
                        '--in-place --aggressive --aggressive',
                        vim.fn.fnameescape(vim.api.nvim_buf_get_name(0)),
                    },
                    stdin = false,
                }
            end,
        },

        -- cpp = {
        --     -- clang-format
        --     function()
        --         return {
        --             exe = 'clang-format',
        --             args = { '--assume-filename', vim.api.nvim_buf_get_name(0) },
        --             stdin = true,
        --             cwd = vim.fn.expand('%:p:h'), -- Run clang-format in cwd of the file.
        --         }
        --     end,
        -- },
        c = {
            -- clang-format
            function()
                return {
                    exe = 'clang-format',
                    args = { '--assume-filename', vim.api.nvim_buf_get_name(0) },
                    stdin = true,
                    cwd = vim.fn.expand('%:p:h'), -- Run clang-format in cwd of the file.
                }
            end,
        },
    },
})

-- format on save
vim.api.nvim_exec(
    [[
    augroup FormatAutogroup
    autocmd!
    autocmd BufWritePost *.lua,*.cpp,*.c,*.py FormatWrite
    augroup END
]],
    true
)
