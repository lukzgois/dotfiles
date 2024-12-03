return { -- Adds git related signs to the gutter, as well as utilities for managing changes
  'lewis6991/gitsigns.nvim',
  keys = {
    { ']h', ':Gitsigns next_hunk<CR>' },
    { '[h', ':Gitsigns prev_hunk<CR>' },
    { 'gs', ':Gitsigns stage_hunk<CR>' },
    { 'gS', ':Gitsigns undo_stage_hunk<CR>' },
    { 'gp', ':Gitsigns preview_hunk<CR>' },
    { 'gb', ':Gitsigns blame_line<CR>' },
  },
  opts = {
    signs = {
      add = { text = '+' },
      change = { text = '~' },
      delete = { text = '_' },
      topdelete = { text = '‾' },
      changedelete = { text = '~' },
    },
  },
}
