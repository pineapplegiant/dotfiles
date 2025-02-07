------------------------------------
-- Completion engine - Nvim-cmp
-- Complete the things
-- :h `nvim-cmp`
-------------------------------------

return {
	"hrsh7th/nvim-cmp",
	event = "InsertEnter",
	dependencies = {
		"hrsh7th/cmp-buffer", -- source for text in buffer
		"hrsh7th/cmp-path", -- source for file system paths
		"hrsh7th/cmp-nvim-lsp", -- nvim-cmp source for displaying function signatures with the current parameter emphasized:
		"hrsh7th/cmp-cmdline", --nvim-cmp source for vim's cmdline.
		"hrsh7th/cmp-nvim-lua", -- Lua API
		"David-Kunz/cmp-npm", -- Complete NPM packages
		"onsails/lspkind.nvim", --vs-code like pictograms
		"L3MON4D3/LuaSnip", -- snippet engine
		"saadparwaiz1/cmp_luasnip", -- for autocompletion
		"rafamadriz/friendly-snippets", -- useful snippets
	},
	config = function()
		local cmp = require("cmp")
		local luasnip = require("luasnip")
		local lspkind = require("lspkind")

		-- load vs-code like snippets from plugins (e.g. friendly-snippets)
		require("luasnip.loaders.from_vscode").lazy_load()

		-- load snippets from my path of /nvim/config/my-cool-snippets
		require("luasnip.loaders.from_vscode").load({ paths = { "./lua_snippets" } })

		vim.opt.completeopt = "menu,menuone,noselect"
		cmp.setup({
			snippet = {
				expand = function(args)
					luasnip.lsp_expand(args.body)
				end,
			},
			mapping = cmp.mapping.preset.insert({
				["<C-n>"] = cmp.mapping.select_next_item(), -- next suggestion
				["<C-p>"] = cmp.mapping.select_prev_item(), -- previous suggestion
				["<C-d>"] = cmp.mapping.scroll_docs(-4),
				["<C-u>"] = cmp.mapping.scroll_docs(4),
				["<C-e>"] = cmp.mapping.abort(), -- close completion window
				["<CR>"] = cmp.mapping.confirm({
					behavior = cmp.ConfirmBehavior.Replace,
					select = true,
				}),
				["<TAB>"] = cmp.mapping.confirm({
					behavior = cmp.ConfirmBehavior.Replace,
					select = true,
				}),
			}),
			-- sources for autocompletion
			sources = cmp.config.sources({
				{ name = "nvim_lsp" }, -- lsp
				{ name = "nvim_lsp_signature_help" },
				{ name = "nvim_lua", priority = 100 },
				{ name = "npm", keyword_length = 4 },
				{ name = "luasnip" }, -- snippets
				{ name = "buffer" }, -- text within current buffer
				{ name = "path" }, -- file system paths
				{ name = "calc" },
			}),

			-- configure lspkind for vs-code like icons
			formatting = {
				format = lspkind.cmp_format({
					mode = "symbol",
					maxwidth = 50,
					symbol_map = { Supermaven = "" },
					ellipsis_char = "...",
				}),
			},

			-- Set configuration for specific filetype.
			cmp.setup.filetype("gitcommit", {
				sources = cmp.config.sources({
					{ name = "cmp_git" }, -- You can specify the `cmp_git` source if you were installed it.
				}, {
					{ name = "buffer" },
				}),
			}),

			-- -- `/` cmdline setup.
			-- cmp.setup.cmdline({ "/", "?" }, {
			-- 	mapping = cmp.mapping.preset.cmdline(),
			-- 	sources = {
			-- 		{ name = "buffer" },
			-- 	},
			-- 	performance = { max_view_entries = 10 },
			-- }),

			-- `:` cmdline setup.
			cmp.setup.cmdline(":", {
				mapping = cmp.mapping.preset.cmdline(),
				sources = cmp.config.sources({ { name = "path" } }, {
					{
						name = "cmdline",
					},
					matching = { disallow_symbol_nonprefix_matching = false },
					performance = { max_view_entries = 15 },
				}),
			}),

			confirm_opts = {
				behavior = cmp.ConfirmBehavior.Replace,
				select = false,
			},

			window = {
				completion = cmp.config.window.bordered(),
				documentation = cmp.config.window.bordered(),
			},

			experimental = {
				ghost_text = false,
				native_menu = false,
			},
		})
	end,
}
