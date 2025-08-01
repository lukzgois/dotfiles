return {
  -- Smooth scrolling for ANY command 🤯. A highly customizable Neovim plugin written in Lua!
  "declancm/cinnamon.nvim",
  version = "*", -- use latest release
  opts = {
    -- Enable all provided keymaps
    keymaps = {
      basic = true,
      extra = true,
    },
    -- Only scroll the window
    options = { mode = "window" },
  }
}
