vim.opt.clipboard = "unnamedplus" -- sync yank with system clipboard
vim.cmd.colorscheme("tokyonight-storm")

vim.api.nvim_create_user_command('Fmt', function()
	vim.lsp.buf.format()
end, {})
