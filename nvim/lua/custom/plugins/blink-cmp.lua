return {
  'saghen/blink.cmp',
  enabled = true,
  dependencies = {
    'saghen/blink.lib',
  },
  build = function()
    -- build the fuzzy matcher, wait up to 60 seconds
    -- you can use `gb` in `:Lazy` to rebuild the plugin as needed
    require('blink.cmp').build():wait(60000)
  end,

  ---@module 'blink.cmp'
  ---@type blink.cmp.Config
  opts = {
    keymap = { preset = 'default' },

    completion = {
      -- Show documentation when selecting a completion item
      documentation = { auto_show = true, auto_show_delay_ms = 500 },
      accept = { auto_brackets = { enabled = true } },
    },

    -- Experimental signature help support
    signature = { enabled = true },
  },
}
