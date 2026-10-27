return {
  'kevinhwang91/nvim-ufo',
  dependencies = 'kevinhwang91/promise-async',
  config = function()
    -- Using ufo provider need remap `zR` and `zM`. If Neovim is 0.6.1, remap yourself
    vim.keymap.set('n', 'zR', require('ufo').openAllFolds)
    vim.keymap.set('n', 'zM', require('ufo').closeAllFolds)
    vim.keymap.set('n', 'zK', function()
      local winid = require('ufo').peekFoldedLinesUnderCursor()
      if not winid then
        -- choose one of coc.nvim and nvim lsp
        vim.fn.CocActionAsync 'definitionHover' -- coc.nvim
        vim.lsp.buf.hover()
      end
    end)

    -- Option 2: nvim lsp as LSP client
    -- Tell the server the capability of foldingRange,
    -- Neovim hasn't added foldingRange to default capabilities, users must add it manually
    local capabilities = vim.lsp.protocol.make_client_capabilities()
    capabilities.textDocument.foldingRange = {
      dynamicRegistration = false,
      lineFoldingOnly = true,
    }
    local language_servers = vim.lsp.get_clients() -- or list servers manually like {'gopls', 'clangd'}
    for _, ls in ipairs(language_servers) do
      require('lspconfig')[ls].setup {
        capabilities = capabilities,
        -- you can add other fields for setting up lsp server in this table
      }
    end

    require('ufo').setup {
      provider_selector = function(bufnr, filetype, buftype)
        return { 'lsp', 'indent' }
      end,
    }
  end,
}
