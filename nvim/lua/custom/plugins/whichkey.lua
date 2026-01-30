return { -- Useful plugin to show you pending keybinds.
  'folke/which-key.nvim',
  event = 'VeryLazy', -- Sets the loading event to 'VimEnter'
  opts = {
    preset = 'classic'
  },
  config = function() -- This is the function that runs, AFTER loading
    -- Document existing key chains
    require('which-key').add {
      { "<leader>d", group = "+[D]ebug"},

      { "<leader>g", group = "+[G]it"},
      { "<leader>gh", group = "+[H]unk"},
      { "<leader>gt", group = "+[T]oggle"},
      { "<leader>gc", group = "+[C]onflicts"},
    }
  end,
}
