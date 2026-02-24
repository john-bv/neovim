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

-- Explicitly set LSP keymaps when any LSP attaches
vim.api.nvim_create_autocmd('LspAttach', {
  callback = function(args)
    local bufnr = args.buf
    vim.keymap.set('n', 'gd', require('telescope.builtin').lsp_definitions,  { buffer = bufnr })
    vim.keymap.set('n', 'gD', vim.lsp.buf.declaration,                        { buffer = bufnr })
    vim.keymap.set('n', 'gr', require('telescope.builtin').lsp_references,   { buffer = bufnr })
    vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, { buffer = bufnr })
    vim.keymap.set('n', 'K',  vim.lsp.buf.hover,         { buffer = bufnr }) -- overridden in rust by rustaceanvim
    vim.keymap.set('n', '<C-k>', vim.lsp.buf.code_action, { buffer = bufnr })
    vim.keymap.set('v', '<C-k>', vim.lsp.buf.code_action, { buffer = bufnr })
    vim.keymap.set('n', '[d', function() vim.diagnostic.goto_prev({ border = "single" }) end, { buffer = bufnr })
    vim.keymap.set('n', ']d', function() vim.diagnostic.goto_next({ border = "single" }) end, { buffer = bufnr })
  end,
})
