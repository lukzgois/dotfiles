return { -- Autoformat
  'stevearc/conform.nvim',
  event = { 'BufReadPre', 'BufNewFile' },
  opts = {
    format_on_save = {
      timeout_ms = 500,
      lsp_fallback = true,
    },
    formatters_by_ft = {
      lua = { 'stylua' },
      javascript = { 'prettierd' },
      typescript = { 'prettierd' },
      json = { 'prettierd' },
      typescriptreact = { 'prettierd' },
      html = { 'prettierd' },
      blade = { 'blade-formatter' },
      php = { 'pint' },
      gdscript = { 'gdscript-formatter' },
      ['_'] = { 'trim_whitespace' },
    },

    vim.keymap.set({ 'n', 'v' }, '<leader>f', function()
      require('conform').format {
        lsp_fallback = true,
        async = true,
        timeout_ms = 500,
      }
    end, { desc = 'Format file or range (in visual mode)' }),
  },
}
