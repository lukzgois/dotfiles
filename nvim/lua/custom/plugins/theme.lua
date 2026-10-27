return {
  {
    'catppuccin/nvim',
    name = 'catppuccin',
    priority = 1000,
    config = function()
      require('catppuccin').setup {
        flavour = 'macchiato',
        term_colors = true,
        transparent_background = false,
      }

      vim.cmd.colorscheme 'catppuccin-nvim'
      require('vim._core.ui2').enable()
    end,
  },
}
