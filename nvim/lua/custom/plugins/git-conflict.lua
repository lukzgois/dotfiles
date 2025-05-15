return {
  'akinsho/git-conflict.nvim',
  version = "*",
  config = function()
    require("git-conflict").setup({
      default_mappings = false, -- Desativa os atalhos padrão
    })

    -- Mapeando atalhos personalizados
    local map = vim.keymap.set
    map("n", "<leader>gco", ":GitConflictChooseOurs<CR>", { desc = "Choose ours" })
    map("n", "<leader>gct", ":GitConflictChooseTheirs<CR>", { desc = "Choose theirs" })
    map("n", "<leader>gcb", ":GitConflictChooseBoth<CR>", { desc = "Choose both" })
    map("n", "<leader>gcn", ":GitConflictNextConflict<CR>", { desc = "Go to next conflict" })
    map("n", "<leader>gcp", ":GitConflictPrevConflict<CR>", { desc = "Go to previous conflict" })
    map("n", "<leader>gcx", ":GitConflictChooseNone<CR>", { desc = "Remove conflict without resolving" })
  end
}
