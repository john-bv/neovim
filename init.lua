require("config.lazy")
vim.cmd.colorscheme("ayu-dark")

vim.api.nvim_create_user_command('Fmt', function()
	vim.lsp.buf.format()
end, {})

vim.opt.clipboard = "unnamedplus"

