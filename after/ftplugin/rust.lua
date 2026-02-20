local bufnr = vim.api.nvim_get_current_buf()

-- Code actions with rust-analyzer grouping
vim.keymap.set(
  "n",
  "<leader>a",
  function()
    vim.cmd.RustLsp('codeAction')
  end,
  { silent = true, buffer = bufnr }
)

-- Override hover with rustaceanvim's hover actions
vim.keymap.set(
  "n",
  "K",
  function()
    vim.cmd.RustLsp({ 'hover', 'actions' })
  end,
  { silent = true, buffer = bufnr }
)
