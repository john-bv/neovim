-- disable netrw at the very start of your init.lua
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- optionally enable 24-bit colour
vim.opt.termguicolors = true

---@type nvim_tree.config
local config = {
  sort = {
    sorter = "case_sensitive",
  },
  view = {
    width = 30,
  },
  renderer = {
    group_empty = true,
  },
  filters = {
    dotfiles = false,
  },
}

require("nvim-tree").setup(config)

vim.keymap.set("n", "<D-b>", "<cmd>NvimTreeToggle<CR>")
vim.keymap.set("i", "<D-b>", "<cmd>NvimTreeToggle<CR>")

-- Auto-open the tree when nvim is launched with a directory (e.g. `nvim .`)
vim.api.nvim_create_autocmd("VimEnter", {
  callback = function(data)
    if vim.fn.isdirectory(data.file) ~= 1 then return end

    vim.cmd.cd(data.file)
    require("nvim-tree.api").tree.open()
    vim.cmd("vnew")
  end,
})
