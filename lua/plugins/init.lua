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
		},
	},
	{
		'LukasPietzschmann/telescope-tabs',
		config = function()
			require('telescope').load_extension 'telescope-tabs'
			require('telescope-tabs').setup {
				-- Your custom config :^)
			}
		end,
		dependencies = { 'nvim-telescope/telescope.nvim' },
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
			require('crates').setup()
		end,
	},
	{
		"ThePrimeagen/99",
		config = function()
			local _99 = require("99")

			local cwd = vim.uv.cwd()
			local basename = vim.fs.basename(cwd)
			_99.setup({
				provider = _99.Providers.ClaudeCodeProvider,
				logger = {
					level = _99.DEBUG,
					path = "/tmp/" .. basename .. ".99.debug",
					print_on_error = true,
				},
				tmp_dir = "./tmp",
				completion = {
					custom_rules = {
						"scratch/custom_rules/",
					},
					files = {},
					source = "cmp",
				},
				md_files = {
					"AGENT.md",
				},
			})

			-- visual selection mode: send selected text as prompt
			vim.keymap.set("v", "<leader>9v", function()
				_99.visual()
			end)

			-- cancel all in-flight requests
			vim.keymap.set("n", "<leader>9x", function()
				_99.stop_all_requests()
			end)

			vim.keymap.set("n", "<leader>9s", function()
				_99.search()
			end)
		end,
	},
	-- Themes
	{ 'Shatur/neovim-ayu' },
	{ 'navarasu/onedark.nvim' },
}
