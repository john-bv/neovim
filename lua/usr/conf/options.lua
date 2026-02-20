vim.opt.clipboard = "unnamedplus" -- sync yank with system clipboard
vim.cmd.colorscheme("ayu-dark")

vim.api.nvim_create_user_command('Fmt', function()
	vim.lsp.buf.format()
end, {})
