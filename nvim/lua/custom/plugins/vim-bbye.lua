return {
  'moll/vim-bbye',
  config = function ()
    vim.keymap.set('n', '<leader>bcc', ':Bwipeout<CR>', { desc = '[B]uffer [C]lose [C]urrent' })
    vim.keymap.set('n', '<leader>bcf', ':Bwipeout!<CR>', { desc = '[B]uffer [C]lose [F]orce' })
    vim.keymap.set('n', '<leader>bca', ':bufdo Bwipeout<CR>', { desc = '[B]uffer [C]lose [A]ll' })
  end
}
