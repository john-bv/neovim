vim.opt.number = true
vim.opt.clipboard = "unnamedplus" -- sync yank with system clipboard
vim.cmd.colorscheme("ayu-mirage")

-- This toggles relative line numbers, because sometimes i don't like it.
vim.keymap.set("n", "<leader>rt", function()
	vim.opt.relativenumber = not vim.opt.relativenumber:get()
end)


-- Just nice hotkeys thanks to @nick
vim.keymap.set("n", "<leader>w", "<cmd>w<cr>")
vim.keymap.set("n", "<leader>q", "<cmd>q<cr>")

-- I decided this was a good idea but it doesnt need to exist tbh
vim.api.nvim_create_user_command('Fmt', function()
	vim.lsp.buf.format()
end, {})
