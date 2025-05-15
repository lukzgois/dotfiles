return {
  'nvim-neo-tree/neo-tree.nvim',
  version = '*',
  dependencies = {
    'nvim-lua/plenary.nvim',
    'nvim-tree/nvim-web-devicons', -- not strictly required, but recommended
    'MunifTanjim/nui.nvim',
  },
  config = function()
    require('neo-tree').setup {
      close_if_last_window = true,
      window = {
        width = 35,
      },
      filesystem = {
        follow_current_file = {
          enabled = true,
        },
      },
      event_handlers = {
        {
          event = 'file_opened',
          handler = function(file_path)
            -- auto close
            -- vimc.cmd("Neotree close")
            -- OR
            require('neo-tree.command').execute { action = 'close' }
          end,
        },
      },
    }

    vim.keymap.set('n', '<leader>e', ':Neotree toggle<CR>')
  end,
}
