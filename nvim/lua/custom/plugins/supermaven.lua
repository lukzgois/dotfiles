return {
  "supermaven-inc/supermaven-nvim",
  enabled = true,
  config = function()
    require("supermaven-nvim").setup({
      keymaps = {
        accept_suggestion = "<C-y>",
        clear_suggestion = "<C-c>",
      },
      disable_inline_completion = true, -- disables inline completion for use with cmp
    })
  end,
}
