-- Lua
return {
  "folke/zen-mode.nvim",
  opts = {
    window = {
      backdrop = 0.95
    },
    plugins = {
      twilight = { enabled = false },
    }
    -- your configuration comes here
    -- or leave it empty to use the default settings
    -- refer to the configuration section below
  },
  keys = {
    { "<leader>zz", ":ZenMode<CR>", desc = "ZenMode" }
  }
}
