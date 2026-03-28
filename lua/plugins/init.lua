return {
	{
		'mrcjkb/rustaceanvim',
		version = '^8', -- Recommended
		lazy = false,
	},
	{
		"nvim-tree/nvim-tree.lua",
		version = "*",
		lazy = false,
		dependencies = {
			"nvim-tree/nvim-web-devicons",
		},
		config = function()
			require("usr.conf.nvim-tree")
		end,
	},
	{
		'nvim-telescope/telescope.nvim',
		version = '*',
		dependencies = {
			'nvim-lua/plenary.nvim',
			{ 'nvim-telescope/telescope-fzf-native.nvim', build = 'make' },
		},
		keys = {
			{ '<leader>f', '<cmd>Telescope find_files<cr>', desc = 'Find files' },
			{ '<leader>F', '<cmd>Telescope live_grep<cr>', desc = 'Find in file' },
			{ '<leader>t', '<cmd>Telescope colorscheme enable_preview=true<cr>', desc = 'Theme picker' },
		},
	},
	{
		'LukasPietzschmann/telescope-tabs',
		dependencies = { 'nvim-telescope/telescope.nvim' },
		config = function()
			require("usr.conf.telescope-tabs")
		end,
	},
	-- Treesitter
	{
		'nvim-treesitter/nvim-treesitter',
		lazy = false,
		build = ':TSUpdate',
		config = function()
			require('nvim-treesitter').install({
				'svelte', 'javascript', 'typescript', 'html', 'css',
				'markdown', 'markdown_inline',
				'php', 'toml', 'vue',
				'python', 'ninja', 'rst',
				'java',
				'go', 'gomod', 'gowork', 'gosum',
				'dockerfile',
				'lua',
			})
			vim.api.nvim_create_autocmd('FileType', {
				callback = function(ev)
					pcall(vim.treesitter.start, ev.buf)
				end,
			})
		end,
	},
	{
		"pmizio/typescript-tools.nvim",
		dependencies = { "nvim-lua/plenary.nvim", "neovim/nvim-lspconfig" },
		opts = {},
	},
	-- LSP
	{ 'williamboman/mason.nvim' },
	{ 'williamboman/mason-lspconfig.nvim' },
	{
		'neovim/nvim-lspconfig',
		config = function()
			require("usr.conf.lsp")
		end,
	},
	-- Completion
	{
		'hrsh7th/nvim-cmp',
		dependencies = {
			'hrsh7th/cmp-nvim-lsp',
			'hrsh7th/cmp-buffer',
			'hrsh7th/cmp-path',
			'L3MON4D3/LuaSnip',
			'saadparwaiz1/cmp_luasnip',
		},
		config = function()
			require("usr.conf.cmp")
		end,
	},
	{
		'saecki/crates.nvim',
		event = { "BufRead Cargo.toml" },
		config = function()
			require("usr.conf.crates")
		end,
	},
	{
		"ThePrimeagen/99",
		config = function()
			require("usr.conf.99")
		end,
	},
	{
		'nvim-lualine/lualine.nvim',
		dependencies = { 'nvim-tree/nvim-web-devicons' },
		config = function()
			local function lsp_status()
				local clients = vim.lsp.get_clients({ bufnr = 0 })
				if #clients == 0 then return 'no lsp' end
				local names = {}
				for _, c in ipairs(clients) do
					table.insert(names, c.name)
				end
				return ' ' .. table.concat(names, ', ')
			end

			require('lualine').setup({
				options = { section_separators = '', component_separators = '' },
				sections = {
					lualine_a = { 'mode' },
					lualine_b = { 'branch', 'diff', 'diagnostics' },
					lualine_c = { lsp_status },
					lualine_x = { 'filetype' },
					lualine_y = { 'progress' },
					lualine_z = { 'location' },
				},
			})
		end,
	},
	{ 'nvim-mini/mini.nvim', version = false },
	-- Themes
	{ 'Shatur/neovim-ayu' },
	{ 'folke/tokyonight.nvim' },
	{ 'navarasu/onedark.nvim' },
}
