return {
  "folke/snacks.nvim",
  priority = 1000,
  lazy = false,
  ---@type snacks.Config
  opts = {
    dashboard = { enabled = true },
    animate = { enabled = true },
    bigfile = { enabled = true },
    lazygit = { enabled = true },
    dim = { enabled = true },
    notifier = {
      enabled = true,
      timeout = 3000
    },
    quickfile = { enabled = true },
    toggle = { enabled = true },
    terminal = { enabled = true },
  },
  keys = {
    { "<leader>gl", function() Snacks.lazygit() end, desc = "Lazygit" },
    { "<C-/>", function() Snacks.terminal() end, desc = "Terminal" },
  }
}
