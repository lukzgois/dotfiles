-- Icons from font bundled with kitty, as shown by `kitty
-- --debug-font-fallback`:
--
--      [3.235] U+eb62 Face(family=Symbols Nerd Font Mono,
--      full_name=Symbols Nerd Font Mono, postscript_name=SymbolsNFM,
--      path=/Applications/kitty.app/Contents/Resources/kitty/fonts/SymbolsNerdFontMono-Regular.ttf,
--      units_per_em=2048, ascent=22.4, descent=5.6, leading=0.0,
--      scaled_point_sz=28.0, underline_position=-3.5 underline_thickness=1.4)
--
local lsp_kinds = {
  Class = ' ',
  Color = ' ',
  Constant = ' ',
  Constructor = ' ',
  Enum = ' ',
  EnumMember = ' ',
  Event = ' ',
  Field = ' ',
  File = ' ',
  Folder = ' ',
  Function = ' ',
  Interface = ' ',
  Keyword = ' ',
  Method = ' ',
  Module = ' ',
  Operator = ' ',
  Property = ' ',
  Reference = ' ',
  Snippet = ' ',
  Struct = ' ',
  Text = ' ',
  TypeParameter = ' ',
  Unit = ' ',
  Value = ' ',
  Variable = ' ',
  Supermaven = '󱚣 ',
}

return { -- Autocompletion
  'hrsh7th/nvim-cmp',
  event = 'InsertEnter',
  dependencies = {
    -- Snippet Engine & its associated nvim-cmp source
    {
      'L3MON4D3/LuaSnip',
      build = (function()
        -- Build Step is needed for regex support in snippets
        -- This step is not supported in many windows environments
        -- Remove the below condition to re-enable on windows
        if vim.fn.has 'win32' == 1 or vim.fn.executable 'make' == 0 then
          return
        end
        return 'make install_jsregexp'
      end)(),
    },
    'saadparwaiz1/cmp_luasnip',

    -- Adds other completion capabilities.
    --  nvim-cmp does not ship with all sources by default. They are split
    --  into multiple repos for maintenance purposes.
    'hrsh7th/cmp-nvim-lsp',
    'hrsh7th/cmp-nvim-lsp-signature-help',
    'hrsh7th/cmp-path',

    -- If you want to add a bunch of pre-configured snippets,
    --    you can use this plugin to help you. It even has snippets
    --    for various frameworks/libraries/etc. but you will have to
    --    set up the ones that are useful for you.
    -- 'rafamadriz/friendly-snippets',
    --
    'onsails/lspkind-nvim',
  },
  config = function()
    -- See `:help cmp`
    local cmp = require 'cmp'
    local has_luasnip, luasnip = pcall(require, 'luasnip')

    require("luasnip.loaders.from_snipmate").lazy_load()

    -- Until https://github.com/hrsh7th/nvim-cmp/issues/1716
    -- (cmp.ConfirmBehavior.MatchSuffix) gets implemented, use this local wrapper
    -- to choose between `cmp.ConfirmBehavior.Insert` and
    -- `cmp.ConfirmBehavior.Replace`
    --
    local confirm = function(entry)
      local behavior = cmp.ConfirmBehavior.Replace

      if entry then
        local completion_item = entry.completion_item
        local newText = ''
        if completion_item.textEdit then
          newText = completion_item.textEdit.newText
        elseif type(completion_item.insertText) == 'string' and completion_item.insertText ~= '' then
          newText = completion_item.insertText
        else
          newText = completion_item.word or completion_item.label or ''
        end

        -- How many characters will be different after the cursor position if we
        -- replace?
        local diff_after = math.max(0, entry.replace_range['end'].character + 1) - entry.context.cursor.col

        -- Does the text that will be replaced after the cursor match the suffix
        -- of the `newText` to be inserted? If not, we should `Insert` instead.
        if entry.context.cursor_after_line:sub(1, diff_after) ~= newText:sub(-diff_after) then
          behavior = cmp.ConfirmBehavior.Insert
        end
      end
      cmp.confirm({ select = true, behavior = behavior })
    end

    cmp.setup {
      snippet = {
        expand = function(args)
          if has_luasnip then
            luasnip.lsp_expand(args.body)
          end
        end,
      },

      -- completion = { completeopt = 'menuone,longest,preview' },
      completion = { completeopt = 'menu,menuone,noinsert' },

      formatting = {
        fields = { 'kind', 'abbr', 'menu' },

        expandable_indicator = true,
        format = function(entry, vim_item)
          -- Set `kind` to "$icon $kind".
          vim_item.kind = string.format('%s %s', lsp_kinds[vim_item.kind], vim_item.kind)
          vim_item.menu = ({
            supermaven = '[SuperMaven]',
            buffer = '[Buffer]',
            nvim_lsp = '[LSP]',
            luasnip = '[LuaSnip]',
            nvim_lua = '[Lua]',
            latex_symbols = '[LaTeX]',
          })[entry.source.name]
          return vim_item
        end,
      },

      -- For an understanding of why these mappings were
      -- chosen, you will need to read `:help ins-completion`
      --
      -- No, but seriously. Please read `:help ins-completion`, it is really good!
      mapping = cmp.mapping.preset.insert {
        -- Select the [n]ext item
        ['<C-n>'] = cmp.mapping.select_next_item(),
        -- Select the [p]revious item
        ['<C-p>'] = cmp.mapping.select_prev_item(),

        -- Accept ([y]es) the completion.
        --  This will auto-import if your LSP supports it.
        --  This will expand snippets if the LSP sent a snippet.
        -- ['<C-y>'] = cmp.mapping.confirm { select = true },
        ['<C-y>'] = cmp.mapping(function(fallback)
          if cmp.visible() then
            local entry = cmp.get_selected_entry()
            confirm(entry)
          else
            fallback()
          end
        end, { 'i', 's' }),

        ['<C-e>'] = cmp.mapping(function(fallback)
          if cmp.visible() then
            cmp.close()
          elseif has_luasnip and luasnip.choice_active() then
            luasnip.jump(1)
          else
            fallback()
          end
        end, { 'i', 's' }),

        -- Manually trigger a completion from nvim-cmp.
        --  Generally you don't need this, because nvim-cmp will display
        --  completions whenever it has completion options available.
        ['<C-k>'] = cmp.mapping.complete {},

        -- Think of <c-l> as moving to the right of your snippet expansion.
        --  So if you have a snippet that's like:
        --  function $name($args)
        --    $body
        --  end
        --
        -- <c-l> will move you to the right of each of the expansion locations.
        -- <c-h> is similar, except moving you backwards.
        ['<C-l>'] = cmp.mapping(function()
          if luasnip.expand_or_locally_jumpable() then
            luasnip.expand_or_jump()
          end
        end, { 'i', 's' }),

        ['<C-h>'] = cmp.mapping(function()
          if luasnip.locally_jumpable(-1) then
            luasnip.jump(-1)
          end
        end, { 'i', 's' }),
      },

      sources = {
        { name = 'luasnip' },
        { name = 'supermaven' },
        { name = 'nvim_lsp' },
        { name = 'nvim_lsp_signature_help' },
        { name = 'buffer' },
        { name = 'calc' },
        { name = 'emoji' },
        { name = 'path' },
      },

      experimental = {
        ghost_text = true,
      },
    }
    -- Only show ghost text at word boundaries, not inside keywords. Based on idea
    -- from: https://github.com/hrsh7th/nvim-cmp/issues/2035#issuecomment-2347186210

    local config = require('cmp.config')

    local toggle_ghost_text = function()
      if vim.api.nvim_get_mode().mode ~= 'i' then
        return
      end

      local cursor_column = vim.fn.col('.')
      local current_line_contents = vim.fn.getline('.')
      local character_after_cursor = current_line_contents:sub(cursor_column, cursor_column)

      local should_enable_ghost_text = character_after_cursor == '' or vim.fn.match(character_after_cursor, [[\k]]) == -1

      local current = config.get().experimental.ghost_text
      if current ~= should_enable_ghost_text then
        config.set_global({
          experimental = {
            ghost_text = should_enable_ghost_text,
          },
        })
      end
    end

    vim.api.nvim_create_autocmd({ 'InsertEnter', 'CursorMovedI' }, {
      callback = toggle_ghost_text,
    })
  end,
}
