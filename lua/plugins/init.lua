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
		},
	},
	{
		'LukasPietzschmann/telescope-tabs',
		dependencies = { 'nvim-telescope/telescope.nvim' },
		config = function()
			require("usr.conf.telescope-tabs")
		end,
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
	-- Themes
	{ 'Shatur/neovim-ayu' },
	{ 'folke/tokyonight.nvim' },
	{ 'navarasu/onedark.nvim' },
}
