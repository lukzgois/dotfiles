return {
  "preservim/vimux",
  keys = {
    { "<leader>vz", ":VimuxZoomRunner<CR>" },
    { "<leader>vi", ":VimuxInspectRunner<CR>" },
    { "<leader>vl", ":VimuxRunLastCommand<CR>" },
    { "<leader>vp", ":VimuxPromptCommand<CR>" },
    { "<leader>vc", ":VimuxCloseRunner<CR>" },
  },
  init = function()
    vim.g.VimuxOrientation = "h"
    vim.g.VimuxOpenExtraArgs = "-b"
  end,
}
