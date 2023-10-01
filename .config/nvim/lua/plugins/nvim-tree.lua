return {
	"nvim-tree/nvim-tree.lua",
	version = "*",
	lazy = false,
	dependencies = {
		"nvim-tree/nvim-web-devicons",
	},
	config = function()
		local nvimtree = require("nvim-tree")
		local function my_on_attach(bufnr)
			local api = require("nvim-tree.api")

			local function opts(desc)
				return { desc = "nvim-tree: " .. desc, buffer = bufnr, noremap = true, silent = true, nowait = true }
			end

			-- default mappings
			api.config.mappings.default_on_attach(bufnr)

			-- custom mappings
			vim.keymap.set("n", "<CR>", api.node.open.edit, opts("Open"))
			vim.keymap.set("n", "<BS>", api.tree.change_root_to_parent, opts("Up"))
			vim.keymap.set("n", "L", api.tree.change_root_to_node, opts("CD"))
			vim.keymap.set("n", "n", api.fs.create, opts("Create"))
			vim.keymap.set("n", "x", api.fs.remove, opts("Delete"))
			vim.keymap.set("n", "h", api.node.navigate.parent_close, opts("Close Directory"))
			vim.keymap.set("n", "l", api.node.open.edit, opts("Open"))
			vim.keymap.set("n", "v", api.node.open.vertical, opts("Open: Vertical Split"))
			vim.keymap.set("n", "R", api.tree.reload, opts("Refresh"))
		end

		nvimtree.setup({
			on_attach = my_on_attach,
			sync_root_with_cwd = false,
			reload_on_bufenter = false,
			respect_buf_cwd = true,
      hijack_unnamed_buffer_when_opening = true,
			sort_by = "case_sensitive",
			view = {
				adaptive_size = false,
			},
			filters = {
				dotfiles = false,
			},
			git = {
				ignore = false,
				enable = true,
				timeout = 400, -- (in ms)
			},
			update_focused_file = {
				enable = true,
				update_cwd = true,
			},
		})
	end,
	keys = {
		{ "<C-n>", "<cmd>NvimTreeFindFileToggle<CR>", desc = "Toggle file explorer on current file" },
		-- { "<C-r>", "<cmd>NvimTreeFocus<CR>", desc = "Focus file explorer" },
	},
}
