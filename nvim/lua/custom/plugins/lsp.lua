return { -- LSP Configuration & Plugins
  'neovim/nvim-lspconfig',
  dependencies = {
    -- Automatically install LSPs and related tools to stdpath for neovim
    'williamboman/mason.nvim',
    'williamboman/mason-lspconfig.nvim',
    'WhoIsSethDaniel/mason-tool-installer.nvim',
    {
      'nvimtools/none-ls.nvim',
      dependencies = {
        'nvim-lua/plenary.nvim',
        'nvimtools/none-ls-extras.nvim',
      },
    },
    'jayp0521/mason-null-ls.nvim',
  },

  config = function()
    require('mason').setup()

    require('mason-tool-installer').setup {
      ensure_installed = {
        'lua_ls',
        'ts_ls',
        'jsonls',
        'bashls',
        'stylua',
        'prettierd',
        'eslint_d',
        'pint',
        'laravel_ls',
        'intelephense',
        'phpactor',
        'shfmt',
        'blade_formatter',
        'gdscript-formatter',
        'gdtoolkit',
        'emmet-language-server',
      },
    }

    local capabilities = vim.lsp.protocol.make_client_capabilities()
    local has_blink, blink_cmp = pcall(require, 'blink.cmp')
    if has_blink then
      capabilities = vim.tbl_deep_extend('force', capabilities, blink_cmp.get_lsp_capabilities())
    end

    vim.lsp.config('lua_ls', {
      capabilities = capabilities,
    })

    vim.lsp.config('intelephense', {
      capabilities = capabilities,
    })

    vim.lsp.config('phpactor', {
      capabilities = capabilities,
      on_init = function(client)
        -- Desabilita as funcionalidades que o Intelephense já faz
        client.server_capabilities.hoverProvider = false
        client.server_capabilities.completionProvider = false
        client.server_capabilities.definitionProvider = false
        client.server_capabilities.referencesProvider = false
        client.server_capabilities.documentHighlightProvider = false
        client.server_capabilities.documentSymbolProvider = false
        client.server_capabilities.signatureHelpProvider = false
        client.server_capabilities.documentFormattingProvider = false
      end,
    })

    vim.lsp.config('gdscript', {})
    vim.lsp.enable 'gdscript'

    require('mason-lspconfig').setup {}
    require('mason-null-ls').setup {}

    vim.api.nvim_create_autocmd('LspAttach', {
      callback = function(args)
        local bufnr = args.buf
        local map = function(mode, lhs, rhs, desc)
          vim.keymap.set(mode, lhs, rhs, { buffer = bufnr, desc = desc })
        end

        map('n', 'K', vim.lsp.buf.hover, 'LSP Hover')
        map('n', 'gd', vim.lsp.buf.definition, 'Go to definition')
        map('n', 'gD', vim.lsp.buf.declaration, 'Go to declaration')
        map('n', 'gi', vim.lsp.buf.implementation, 'Go to implementation')
        map('n', 'gr', function()
          Snacks.picker.lsp_references()
        end, 'Go to references')
        map('n', '<leader>rn', vim.lsp.buf.rename, 'Rename')
        map({ 'n', 'v' }, '<leader>ca', vim.lsp.buf.code_action, 'Code action')
        -- vim.keymap.set('n', '<leader>f', function()
        --   vim.lsp.buf.format { timeout_ms = 5000 }
        -- end, { noremap = true, silent = true, desc = 'Format buffer' })
      end,
    })
  end,
}
