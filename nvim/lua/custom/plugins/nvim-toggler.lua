return {
  'nguyenvukhang/nvim-toggler',
  config = function()
    require('nvim-toggler').setup {
      inverses = {
        ['- [ ]'] = '- [x]',
      },
    }
  end,
}
