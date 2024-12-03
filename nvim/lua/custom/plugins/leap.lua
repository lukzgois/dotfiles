return {
  'ggandor/leap.nvim',
  config = function ()
    vim.keymap.set({'n', 'o'}, 's',  '<Plug>(leap-forward)')
    vim.keymap.set({'n', 'o'}, 'S',  '<Plug>(leap-backward)')
  end
}
