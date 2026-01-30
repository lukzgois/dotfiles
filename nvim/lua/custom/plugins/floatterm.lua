--- Floating terminal

return {
  'voldikss/vim-floaterm',
  keys = {
    { '<F1>', ':FloatermToggle<CR>' },
    { '<F1>', '<Esc>:FloatermToggle<CR>', mode = 'i' },
    { '<F1>', '<C-\\><C-n>:FloatermToggle<CR>', mode = 't' },
  },
  cmd = { 'FloatermToggle' },
  init = function()
    vim.g.floaterm_width = 0.95
    vim.g.floaterm_height = 0.95
  end,
  -- config = function()
  --   vim.cmd [[
  --     highligh link Floaterm CursorLine
  --     highligh link FloatermBorder CursorLineBg
  --   ]]
  -- end,
}
