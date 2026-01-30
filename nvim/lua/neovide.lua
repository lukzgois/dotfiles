if vim.g.neovide then
    -- Put anything you want to happen only in Neovide here
    vim.opt.linespace = 8
    vim.g.neovide_padding_top = 20
    vim.g.neovide_hide_mouse_when_typing = true

    vim.g.neovide_padding_top = 8
    vim.g.neovide_padding_bottom = 8
    vim.g.neovide_padding_right = 8
    vim.g.neovide_padding_left = 8

    -- Allow clipboard copy paste in neovim
    vim.keymap.set('v', '<C-S-c>', '"+y')         -- Copy
    vim.keymap.set('n', '<C-S-v>', '"+P')         -- Paste normal mode
    vim.keymap.set('v', '<C-S-v>', '"+P')         -- Paste visual mode
    vim.keymap.set('c', '<C-S-v>', '<C-R>+')      -- Paste command mode
    vim.keymap.set('i', '<C-S-v>', '<ESC>l"+Pli') -- Paste insert mode

    vim.api.nvim_set_keymap('', '<C-S-v>', '+p<CR>', { noremap = true, silent = true })
    vim.api.nvim_set_keymap('!', '<C-S-v>', '<C-R>+', { noremap = true, silent = true })
    vim.api.nvim_set_keymap('t', '<C-S-v>', '<C-R>+', { noremap = true, silent = true })
    vim.api.nvim_set_keymap('v', '<C-S-v>', '<C-R>+', { noremap = true, silent = true })

    vim.g.neovide_cursor_vfx_mode = "pixiedust"
end
