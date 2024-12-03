return { -- Highlight, edit, and navigate code
  'nvim-treesitter/nvim-treesitter',
  event = 'VeryLazy',
  build = function()
    require('nvim-treesitter.install').update { with_sync = true }
  end,
  opts = {
    ensure_installed = 'all',
    -- Autoinstall languages that are not installed
    auto_install = true,
    highlight = { enable = true },
    indent = {
      enable = true,
      disabled = { 'yaml' },
    },
    context_commentstring = {
      enable = true,
    },
    rainbow = {
      enable = true,
    },
    textobjects = {
      select = {
        enable = true,
        lookahead = true,
        keymaps = {
          ['if'] = '@function.inner',
          ['af'] = '@function.outer',
          ['ia'] = '@parameter.inner',
          ['aa'] = '@parameter.outer',
        },
      },
    },
  },
  dependencies = {
    {
      'JoosepAlviste/nvim-ts-context-commentstring',
      opts = {
        enable_autocmd = false,
        custom_calculation = function(node, language_tree)
          if vim.bo.filetype == 'blade' and language_tree._lang ~= 'javascript' then
            return '{{-- %s --}}'
          end
        end,
      },
    },
    'nvim-treesitter/nvim-treesitter-textobjects',
  },
  config = function(_, opts)
    -- [[ Configure Treesitter ]] See `:help nvim-treesitter`
    require('ts_context_commentstring').setup(opts)
    vim.g.skip_ts_context_commentstring_module = true

    local parser_config = require('nvim-treesitter.parsers').get_parser_configs()
    parser_config.blade = {
      install_info = {
        url = 'https://github.com/EmranMR/tree-sitter-blade',
        files = { 'src/parser.c' },
        branch = 'main',
      },
      filetype = 'blade',
    }
    vim.filetype.add {
      pattern = {
        ['.*%.blade%.php'] = 'blade',
      },
    }
  end,
}
