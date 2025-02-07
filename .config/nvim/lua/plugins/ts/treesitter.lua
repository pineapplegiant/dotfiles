-------------------------------------
-- Tresitter
-- Configure Treesitter
-- See `:help nvim-treesitter`
-------------------------------------
--local status, ts = pcall(require, 'nvim-treesitter.configs')
-- if (not status) then return end

-- TBH Not sure what everything does rip
return {
	{
		"nvim-treesitter/nvim-treesitter",
		event = { "BufReadPre", "BufNewFile" },
		build = ":TSUpdate",
		dependencies = {
			"nvim-treesitter/nvim-treesitter-textobjects",
			"nvim-treesitter/nvim-tree-docs",
			"nvim-treesitter/nvim-treesitter-refactor",
			"windwp/nvim-ts-autotag",
		},
		config = function()
			local treesitter = require("nvim-treesitter.configs")

			-- configure treesitter
			treesitter.setup({
				highlight = {
					enable = true,
				},

				tree_docs = { enable = true },

				-- enable indentation
				indent = { enable = true },

				-- enable
				ensure_installed = "all",

				refactor = {
					smart_rename = {
						enable = true,
						-- Assign keymaps to false to disable them, e.g. `smart_rename = false`.
						-- keymaps = {
						-- 	smart_rename = "grr",
						-- },
					},
					highlight_definitions = {
						enable = true,
						-- Set to false if you have an `updatetime` of ~100.
						clear_on_cursor_move = true,
					},
				},

				incremental_selection = {
					enable = true,
					keymaps = {
						init_selection = "<C-space>",
						node_incremental = "<C-space>",
						scope_incremental = false,
						node_decremental = "<bs>",
					},
				},

				-- auto install above language parsers
				auto_install = true,

				disable = function(lang, buf)
					local max_filesize = 100 * 1024 -- 100 KB
					local ok, stats = pcall(vim.loop.fs_stat, vim.api.nvim_buf_get_name(buf))
					if ok and stats and stats.size > max_filesize then
						return true
					end
				end,
			})
		end,
	},
}
