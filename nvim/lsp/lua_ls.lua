return {
  settings = {
    globals = { 'vim ' },
    Lua = {
      diagnostics = {
        globals = { 'vim', 'hl' },
      },
      telemetry = {
        enable = false,
      },
      completion = {
        callSnippet = 'Replace',
      },
    },
  },
}
