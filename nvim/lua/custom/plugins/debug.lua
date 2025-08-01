-- debug.lua
--
-- Shows how to use the DAP plugin to debug your code.
--
-- Primarily focused on configuring the debugger for Go, but can
-- be extended to other languages as well. That's why it's called
-- kickstart.nvim and not kitchen-sink.nvim ;)

return {
  'mfussenegger/nvim-dap',
  lazy = true,

  dependencies = {
    -- Creates a beautiful debugger UI
    'rcarriga/nvim-dap-ui',
    "nvim-neotest/nvim-nio",
    --
    'theHamsta/nvim-dap-virtual-text',
    "nvim-telescope/telescope-dap.nvim",

    -- Installs the debug adapters for you
    'williamboman/mason.nvim',
    'jay-babu/mason-nvim-dap.nvim',

    -- lazy spec to build "microsoft/vscode-js-debug" from source
    {
      "microsoft/vscode-js-debug",
      version = "1.x",
      build = "npm i && npm run compile vsDebugServerBundle && mv dist out"
    },
    "mxsdev/nvim-dap-vscode-js",
  },
  config = function()
    local dap = require 'dap'
    local dapui = require 'dapui'

    require('mason-nvim-dap').setup {
      -- Makes a best effort to setup the various debuggers with
      -- reasonable debug configurations
      automatic_setup = true,
      automatic_installation = false,

      -- You can provide additional configuration to the handlers,
      -- see mason-nvim-dap README for more information
      handlers = {},

      -- You'll need to check that you have the required things installed
      -- online, please don't ask me how to install them :)
      ensure_installed = {
        -- Update this to ensure that you have the debuggers for the langs you want
      },
    }

    require("dap-vscode-js").setup({
      debugger_path = vim.fn.stdpath("data") .. "/lazy/vscode-js-debug",
      adapters = { 'pwa-node', 'pwa-chrome', 'pwa-msedge', 'node-terminal', 'pwa-extensionHost' },
    })

    -- dap.adapters["pwa-chrome"] = {
    --   type = "server",
    --   host = "localhost",
    --   port = "${port}",
    --   executable = {
    --     command = "node",
    --     args = {
    --       os.getenv("HOME") .. "/.local/share/nvim/mason/packages/js-debug-adapter/js-debug/src/dapDebugServer.js",
    --       "${port}"
    --     }
    --   }
    -- }
    --
    -- dap.adapters.node2 = {
    --   type = 'executable',
    --   command = 'node',
    --   args = {
    --     os.getenv("HOME") .. '/.local/share/nvim/mason/packages/node-debug2-adapter/out/src/nodeDebug.js',
    --   },
    -- }
    --
    -- dap.configurations.javascriptreact = {
    --   {
    --     type = "pwa-chrome",
    --     name = "Attach to Vivaldi (Next.js)",
    --     request = "attach",
    --     port = 9222,
    --     cwd = vim.fn.getcwd(),
    --     webRoot = "${workspaceFolder}",
    --     urlFilter = "http://localhost:*",
    --     sourceMaps = true,
    --     protocol = "inspector",
    --   },
    --
    --   {
    --     name = "Attach to node process",
    --     type = "node2",
    --     request = "attach",
    --     port = 9229,
    --     restart = true,
    --     protocol = "inspector",
    --     sourceMaps = true,
    --     cwd = vim.fn.getcwd(),
    --     skipFiles = { "<node_internals>/**", "node_modules/**" },
    --   },
    --
    --   {
    --     name = "Attach to node process (9230 - App Router)",
    --     type = "node2",
    --     request = "attach",
    --     port = 9230,
    --     restart = true,
    --     protocol = "inspector",
    --     sourceMaps = true,
    --     cwd = vim.fn.getcwd(),
    --     skipFiles = { "<node_internals>/**", "node_modules/**" },
    --   },
    -- }
    --
    -- dap.configurations.typescriptreact = dap.configurations.javascriptreact
    -- dap.configurations.typescript = dap.configurations.javascriptreact

    local js_based_languages = {
      'typescript',
      'javascript',
      'typescriptreact',
      'javascriptreact',
    }
    for _, language in ipairs(js_based_languages) do
      dap.configurations[language] = {
        -- attach to a node process that has been started with
        -- `--inspect` for longrunning tasks or `--inspect-brk` for short tasks
        -- npm script -> `node --inspect-brk ./node_modules/.bin/vite dev`
        {
          -- use nvim-dap-vscode-js's pwa-node debug adapter
          type = "pwa-node",
          -- attach to an already running node process with --inspect flag
          -- default port: 9222
          request = "attach",
          port = 9229,
          -- allows us to pick the process using a picker
          processId = require 'dap.utils'.pick_process,
          -- name of the debug action you have to select for this config
          name = "Attach debugger to existing `node --inspect` process",
          -- for compiled languages like TypeScript or Svelte.js
          sourceMaps = true,
          -- resolve source maps in nested locations while ignoring node_modules
          resolveSourceMapLocations = {
            "${workspaceFolder}/**",
            "!**/node_modules/**" },
          -- path to src in vite based projects (and most other projects as well)
          cwd = "${workspaceFolder}/src",
          restart = true,
          -- we don't want to debug code inside node_modules, so skip it!
          skipFiles = { "${workspaceFolder}/node_modules/**/*.js" },
        },
        {
          name = "Attach to node process (9230 - App Router)",
          type = "pwa-node",
          request = "attach",
          processId = require 'dap.utils'.pick_process,
          port = 9230,
          restart = true,
          protocol = "inspector",
          sourceMaps = true,
          cwd = "${workspaceFolder}/src",
          skipFiles = { "<node_internals>/**", "node_modules/**" },
        },

        {
          type = "pwa-chrome",
          name = "Launch Vivaldi to debug client",
          request = "launch",
          url = function()
            local co = coroutine.running()
            return coroutine.create(function()
              vim.ui.input({
                prompt = "Enter URL: ",
                default = "http://localhost:3000",
              }, function(url)
                if url == nil or url == "" then
                  return
                else
                  coroutine.resume(co, url)
                end
              end)
            end)
          end,
          sourceMaps = true,
          protocol = "inspector",
          port = 9222,
          webRoot = "${workspaceFolder}/src",
          -- skip files from vite's hmr
          skipFiles = { "**/node_modules/**/*", "**/@vite/*", "**/src/client/*", "**/src/*" },
        },
        {
          type = "pwa-chrome",
          name = "Attach to Vivaldi to debug client (Next.js)",
          request = "attach",
          port = 9222,
          cwd = vim.fn.getcwd(),
          webRoot = "${workspaceFolder}",
          urlFilter = "http://localhost:*",
          sourceMaps = true,
          protocol = "inspector",
        },

      }
    end

    -- Basic debugging keymaps, feel free to change to your liking!
    vim.keymap.set('n', '<leader>dc', dap.continue, { desc = 'Debug: Start/Continue' })
    vim.keymap.set('n', '<leader>di', dap.step_into, { desc = 'Debug: Step Into' })
    vim.keymap.set('n', '<leader>do', dap.step_over, { desc = 'Debug: Step Over' })
    vim.keymap.set('n', '<leader>dO', dap.step_out, { desc = 'Debug: Step Out' })
    vim.keymap.set('n', '<leader>db', dap.toggle_breakpoint, { desc = 'Debug: Toggle Breakpoint' })
    vim.keymap.set('n', '<leader>dx', dap.clear_breakpoints, { desc = 'Debug: Clear Breakpoints' })
    -- vim.keymap.set('n', '<leader>dl', require("telescope").extensions.dap.list_breakpoints,
    --   { desc = 'Debug: List Breakpoints' })
    vim.keymap.set('n', '<leader>dr', dap.repl.toggle, { desc = 'Debug: Toggle REPL' })
    -- Toggle DAP UI
    vim.keymap.set('n', '<leader>du', dapui.toggle, { desc = 'Debug: Toggle UI' })

    -- Dap UI setup
    -- For more information, see |:help nvim-dap-ui|
    -- dapui.setup {
    -- Set icons to characters that are more likely to work in every terminal.
    --    Feel free to remove or use ones that you like more! :)
    --    Don't feel like these are good choices.
    --   icons = { expanded = '▾', collapsed = '▸', current_frame = '*' },
    --   controls = {
    --     icons = {
    --       pause = '⏸',
    --       play = '▶',
    --       step_into = '⏎',
    --       step_over = '⏭',
    --       step_out = '⏮',
    --       step_back = 'b',
    --       run_last = '▶▶',
    --       terminate = '⏹',
    --       disconnect = '⏏',
    --     },
    --   },
    -- }
    dapui.setup()
    require("nvim-dap-virtual-text").setup()

    -- Toggle to see last session result. Without this, you can't see session output in case of unhandled exception.

    -- dap.listeners.after.event_initialized['dapui_config'] = dapui.open
    dap.listeners.before.event_terminated['dapui_config'] = dapui.close
    dap.listeners.before.event_exited['dapui_config'] = dapui.close
  end,
}
