return {
  'MeanderingProgrammer/render-markdown.nvim',
  dependencies = { 'nvim-treesitter/nvim-treesitter', 'nvim-mini/mini.nvim' }, -- if you use the mini.nvim suite
  -- dependencies = { 'nvim-treesitter/nvim-treesitter', 'nvim-mini/mini.icons' },        -- if you use standalone mini plugins
  -- dependencies = { 'nvim-treesitter/nvim-treesitter', 'nvim-tree/nvim-web-devicons' }, -- if you prefer nvim-web-devicons
  ---@module 'render-markdown'
  ---@type render.md.UserConfig
  opts = {
    completions = { lsp = { enabled = true } },
    checkbox = {
      custom = {
        current = {
          raw = '[>]',
          rendered = '󰐊 ',
          highlight = 'RenderMarkdownBullet',
          scope_highlight = nil,
        },
        question = {
          raw = '[?]',
          rendered = ' ',
          highlight = 'RenderMarkdownBullet',
          scope_highlight = nil,
        },
        answered_question = {
          raw = '[?-]',
          rendered = ' ',
          highlight = 'RenderMarkdownBullet',
          scope_highlight = '@markup.strikethrough',
        },
      },
    },
    quote = { repeat_linebreak = true },
    win_options = {
      showbreak = {
        default = '',
        rendered = '  ',
      },
      breakindent = {
        default = false,
        rendered = true,
      },
      breakindentopt = {
        default = '',
        rendered = '',
      },
    },
  },
}
