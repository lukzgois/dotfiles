return {
  "rcarriga/nvim-notify",
  enabled = false,
  lazy = false,
  config = function()
    local notify = require("notify")

    notify.setup({
      stages = "fade_in_slide_out",
      timeout = 2000,
      render = "default",
    })

    vim.notify = notify
  end,
}
