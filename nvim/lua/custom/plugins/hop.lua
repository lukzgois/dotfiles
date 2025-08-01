return {
  'smoka7/hop.nvim',
  version = "*",
  opts = {
    keys = 'etovxqpdygfblzhckisuran'
  },
  config = function(_, opts)
    local hop = require('hop')
    local directions = require('hop.hint').HintDirection

    hop.setup(opts) -- Inicializa o Hop com as opções passadas via Lazy.nvim

    vim.keymap.set('', 'f', function()
      hop.hint_char1({ direction = directions.AFTER_CURSOR, current_line_only = true })
    end, { remap = true })

    vim.keymap.set('', 'F', function()
      hop.hint_char1({ direction = directions.BEFORE_CURSOR, current_line_only = true })
    end, { remap = true })

    vim.keymap.set('', 't', function()
      hop.hint_char1({ direction = directions.AFTER_CURSOR, current_line_only = true, hint_offset = -1 })
    end, { remap = true })

    vim.keymap.set('', 'T', function()
      hop.hint_char1({ direction = directions.BEFORE_CURSOR, current_line_only = true, hint_offset = 1 })
    end, { remap = true })

    vim.keymap.set('n', '<leader>hw', function()
      hop.hint_words()
    end, { desc = '[Hop] Jump to Word' })

    vim.keymap.set('n', '<leader>hl', function()
      hop.hint_lines()
    end, { desc = '[Hop] Jump to Line' })

    vim.keymap.set('n', '<leader>hc', function()
      hop.hint_char1()
    end, { desc = '[Hop] Jump to Char' })
  end
}
