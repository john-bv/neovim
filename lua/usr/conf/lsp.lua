require("mason").setup()

require("mason-lspconfig").setup({
  ensure_installed = {
    "rust_analyzer", -- used by rustaceanvim, not enabled via lsp.enable
    "lua_ls",
  },
  automatic_installation = true,
})

-- Lua LSP
vim.lsp.config('lua_ls', {
  settings = {
    Lua = {
      runtime = { version = "LuaJIT" },
      workspace = {
        checkThirdParty = false,
        library = vim.api.nvim_get_runtime_file("", true),
      },
      diagnostics = { globals = { "vim" } },
      telemetry = { enable = false },
    },
  },
})

vim.lsp.enable('lua_ls')

-- Note: rust-analyzer is managed by rustaceanvim, not enabled here
