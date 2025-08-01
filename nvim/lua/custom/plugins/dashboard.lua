return {
  'nvimdev/dashboard-nvim',
  event = 'VimEnter',
  opts = {
    theme = 'hyper',
    config = {
      week_header = {
        enable = true
      },
      shortcut = {
        { desc = '󰊳 Update', group = '@property', action = 'Lazy update', key = 'u' },
        { desc = ' Load Session', group = '@property', action = "lua require('persistence').load()", key = 'l' },
        { desc = ' Select a session', group = '@property', action = "lua require('persistence').select()", key = 's' },
        { desc = ' Restore Last Session', group = '@property', action = "lua require('persistence').load({ last = true })", key = 'r' }
      }
    }
  },
  dependencies = { { 'nvim-tree/nvim-web-devicons' } }
}
