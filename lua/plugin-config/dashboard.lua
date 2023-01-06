local status, db = pcall(require, 'dashboard')
if not status then
    vim.notify('没有找到 dashboard')
    return
end

db.custom_footer = {
    '',
    '',
    '  Welcome to the Best editor in the World!!',
    '      _   _ __  ____   __ ',
    '     | | | |  \\/  \\ \\ / / ',
    '     | |_| | |\\/| |\\ V /  ',
    '     |  _  | |  | | | |   ',
    '     |_| |_|_|  |_| |_|   ',
}

db.custom_center = {
    {
        icon = '             ',
        desc = 'Recently files                      ',
        action = 'Telescope oldfiles',
    },
    {
        icon = '             ',
        desc = 'Find file                           ',
        action = 'Telescope find_files',
    },
    {
        icon = '             ',
        desc = 'Edit keybindings                    ',
        action = 'edit ~/.config/nvim/lua/keybindings.lua',
    },
    -- {
    --   icon = "  ",
    --   desc = "Edit .bashrc                        ",
    --   action = "edit ~/.bashrc",
    -- },
    {
        icon = '             ',
        desc = 'Change colorscheme                  ',
        action = 'Telescope colorscheme',
    },
    -- {
    --   icon = "  ",
    --   desc = "Edit init.lua                       ",
    --   action = "edit ~/.config/nvim/init.lua",
    -- },
    -- {
    --   icon = "  ",
    --   desc = "Find text                           ",
    --   action = "Telescopecope live_grep",
    -- },
}

db.custom_header = {
    [[                                   ]],
    [[                                   ]],
    [[                                   ]],
    [[                                   ]],
    [[                                   ]],
    [[          ▀████▀▄▄              ▄█ ]],
    [[            █▀    ▀▀▄▄▄▄▄    ▄▄▀▀█ ]],
    [[    ▄        █          ▀▀▀▀▄  ▄▀  ]],
    [[   ▄▀ ▀▄      ▀▄              ▀▄▀  ]],
    [[  ▄▀    █     █▀   ▄█▀▄      ▄█    ]],
    [[  ▀▄     ▀▄  █     ▀██▀     ██▄█   ]],
    [[   ▀▄    ▄▀ █   ▄██▄   ▄  ▄  ▀▀ █  ]],
    [[    █  ▄▀  █    ▀██▀    ▀▀ ▀▀  ▄▀  ]],
    [[   █   █  █      ▄▄           ▄▀   ]],
}
