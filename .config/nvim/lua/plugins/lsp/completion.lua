return {
	"saghen/blink.cmp",
	-- optional: provides snippets for the snippet source
	dependencies = {
		"rafamadriz/friendly-snippets",
		{ "L3MON4D3/LuaSnip", version = "v2.*" },
		"moyiz/blink-emoji.nvim",
		"Kaiser-Yang/blink-cmp-dictionary",
		"echasnovski/mini.nvim",
	},
	-- use a release tag to download pre-built binaries
	-- check out recipes - https://cmp.saghen.dev/recipes
	version = "*",
	opts = {

		enabled = function()
			return not vim.tbl_contains({ "markdown" }, vim.bo.filetype)
				and vim.bo.buftype ~= "prompt"
				and vim.b.completion ~= false
		end,
		-- 'default' for mappings similar to built-in completion
		-- 'super-tab' for mappings similar to vscode (tab to accept, arrow keys to navigate)
		-- 'enter' for mappings similar to 'super-tab' but with 'enter' to accept
		completion = {
			menu = {
				-- Add Mini icons
				draw = {
					components = {
						kind_icon = {
							ellipsis = false,
							text = function(ctx)
								local kind_icon, _, _ = require("mini.icons").get("lsp", ctx.kind)
								return kind_icon
							end,
							-- Optionally, you may also use the highlights from mini.icons
							highlight = function(ctx)
								local _, hl, _ = require("mini.icons").get("lsp", ctx.kind)
								return hl
							end,
						},
					},

					-- Make it look more like cmp
					columns = { { "label", "label_description", gap = 1 }, { "kind_icon", "kind" } },
				},

				-- Add border
				border = "single",

				-- Don't show in search
				auto_show = function(ctx)
					return ctx.mode ~= "cmdline" or not vim.tbl_contains({ "/", "?" }, vim.fn.getcmdtype())
				end,
			},
			documentation = {
				auto_show = true,
				window = {
					border = "single",
				},
			},
		},

		signature = { window = { border = "single" } },

		-- See the full "keymap" documentation for information on defining your own keymap.
		keymap = {
			preset = "super-tab",
			["<CR>"] = { "accept", "fallback" },
		},

		-- Default list of enabled providers defined so that you can extend it
		-- elsewhere in your config, without redefining it, due to `opts_extend`
		sources = {
			default = { "lsp", "path", "snippets", "buffer", "emoji", "dictionary" },
			providers = {
				emoji = {
					module = "blink-emoji",
					name = "Emoji",
					score_offset = 15, -- Tune by preference
					opts = { insert = true }, -- Insert emoji (default) or complete its name
					should_show_items = function()
						return vim.tbl_contains(
							-- Enable emoji completion only for git commits and markdown.
							-- By default, enabled for all file-types.
							{ "gitcommit" },
							vim.o.filetype
						)
					end,
				},
				dictionary = {
					module = "blink-cmp-dictionary",
					name = "Dict",
					-- Make sure this is at least 2.
					-- 3 is recommended
					min_keyword_length = 3,
					opts = {
						-- options for blink-cmp-dictionary
					},
				},
			},
		},

		snippets = { preset = "luasnip" },
	},
	opts_extend = { "sources.default" },
}
