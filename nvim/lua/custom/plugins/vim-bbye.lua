return {
  'moll/vim-bbye',
  config = function ()
    vim.keymap.set('n', '<leader>bc', ':Bdelete<CR>', { desc = '[B]uffer [C]close' })
  end
}
