return {
  'folke/snacks.nvim',
  priority = 1000,
  lazy = false,
  opts = {
    dashboard = {
      enabled = true,
      sections = {
        { section = 'header' },
        { section = 'keys', padding = 1 },
        { icon = ' ', title = 'Recent Files', section = 'recent_files', indent = 2, padding = 1 },
        { icon = ' ', title = 'Projects', section = 'projects', indent = 2, padding = 1 },
        { section = 'startup' },
      },
    },
    animate = { enabled = true },
    bigfile = { enabled = true },
    lazygit = { enabled = true },
    dim = { enabled = true },
    notifier = {
      enabled = true,
      timeout = 3000,
    },
    quickfile = { enabled = true },
    toggle = { enabled = true },
    terminal = { enabled = true },
    picker = {
      sources = {
        explorer = {
          replace_netrw = true,
          hidden = true,
          ignored = true,
        },
      },
    },
    scroll = {
      enabled = true,
    },
    scratch = {
      ft = function()
        return 'markdown'
      end,
      win = { style = 'float' },
    },
  },
  keys = {
    {
      '<leader>gl',
      function()
        Snacks.lazygit()
      end,
      desc = 'Lazygit',
    },
    {
      '<C-/>',
      function()
        Snacks.terminal()
      end,
      desc = 'Terminal',
    },
    {
      '<leader>e',
      function()
        Snacks.explorer.open()
      end,
      desc = 'Open filetree',
    },
    {
      '<leader><leader>',
      function()
        Snacks.picker.buffers()
      end,
    },
    {
      '<leader>sf',
      function()
        Snacks.picker.files()
      end,
    },
    {
      '<leader>ss',
      function()
        Snacks.picker.lsp_symbols()
      end,
    },
    {
      '<leader>sr',
      function()
        Snacks.picker.resume()
      end,
      desc = '[S]earch [R]esume',
    },
    {
      '<leader>.',
      function()
        Snacks.scratch()
      end,
      desc = 'Toggle Scratch Buffer',
    },
    {
      '<leader>S',
      function()
        Snacks.scratch.select()
      end,
      desc = 'Select Scratch Buffer',
    },
  },
}
