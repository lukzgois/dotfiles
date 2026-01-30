return {
  { -- Adds git related signs to the gutter, as well as utilities for managing changes
    'lewis6991/gitsigns.nvim',
    config = function()
      require('gitsigns').setup {
        current_line_blame = true,
        on_attach = function(bufnr)
          local gitsigns = require('gitsigns')

          local function map(mode, l, r, opts)
            opts = opts or {}
            opts.buffer = bufnr
            vim.keymap.set(mode, l, r, opts)
          end

          -- Navigation
          map('n', ']c', function()
            if vim.wo.diff then
              vim.cmd.normal({ ']c', bang = true })
            else
              gitsigns.nav_hunk('next')
            end
          end)

          map('n', '[c', function()
            if vim.wo.diff then
              vim.cmd.normal({ '[c', bang = true })
            else
              gitsigns.nav_hunk('prev')
            end
          end)

          -- Actions
          map('n', '<leader>ghs', gitsigns.stage_hunk, { desc = '[S]tage' })
          map('n', '<leader>ghr', gitsigns.reset_hunk, { desc = '[R]eset' })

          map('v', '<leader>ghs', function()
            gitsigns.stage_hunk({ vim.fn.line('.'), vim.fn.line('v') })
          end, { desc = '[G]it [H]unk [S]tage' })

          map('v', '<leader>ghr', function()
            gitsigns.reset_hunk({ vim.fn.line('.'), vim.fn.line('v') })
          end, { desc = '[G]it [H]unk [R]eset' })

          map('n', '<leader>ghS', gitsigns.stage_buffer, { desc = '[S]tage Bufer' })
          map('n', '<leader>ghR', gitsigns.reset_buffer, { desc = '[R]eset Buffer' })
          map('n', '<leader>ghp', gitsigns.preview_hunk, { desc = '[P]review' })
          map('n', '<leader>ghi', gitsigns.preview_hunk_inline, { desc = 'Preview [I]nline' })

          map('n', '<leader>ghb', function()
            gitsigns.blame_line({ full = true })
          end, { desc = '[B]lame line' })

          map('n', '<leader>ghd', gitsigns.diffthis, { desc = '[D]iff' })

          map('n', '<leader>ghD', function()
            gitsigns.diffthis('~')
          end, { desc = '[D]iff ~' })

          map('n', '<leader>ghQ', function() gitsigns.setqflist('all') end, { desc = 'Set all hunks to [Q]uickfix' })
          map('n', '<leader>ghq', gitsigns.setqflist, { desc = 'Set buffer hunks to [Q]uickfix' })

          -- Toggles
          map('n', '<leader>gtb', gitsigns.toggle_current_line_blame, { desc = 'Currrent line [B]lame' })
          map('n', '<leader>gtw', gitsigns.toggle_word_diff, { desc = '[W]ord diff' })

          -- Text object
          map({ 'o', 'x' }, 'ghS', gitsigns.select_hunk, { desc = '[S]elect' })
        end
      }
    end
  },

  {
    'sindrets/diffview.nvim'
  },

  {
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

}
