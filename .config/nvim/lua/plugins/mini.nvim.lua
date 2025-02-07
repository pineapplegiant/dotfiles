return {
	-- Collection of various small independent plugins/modules
	"echasnovski/mini.nvim",
	config = function()
		-- Better Around/Inside textobjects
		--
		-- Examples:
		--  - va)  - [V]isually select [A]round [)]paren
		--  - yinq - [Y]ank [I]nside [N]ext [Q]uote
		--  - ci'  - [C]hange [I]nside [']quote
		require("mini.ai").setup({ n_lines = 500 })

		-- Add/delete/replace surroundings (brackets, quotes, etc.)
		--
		-- - saiw) - [S]urround [A]dd [I]nner [W]ord [)]Paren
		-- - sd'   - [S]urround [D]elete [']quotes
		-- - sr)'  - [S]urround [R]eplace [)] [']
		require("mini.surround").setup({
			custom_surroundings = {
				["("] = { output = { left = "( ", right = " )" } },
				["["] = { output = { left = "[ ", right = " ]" } },
				["{"] = { output = { left = "{ ", right = " }" } },
				["<"] = { output = { left = "< ", right = " >" } },
			},
			mappings = {
				add = "",
				delete = "ds",
				find = "",
				find_left = "",
				highlight = "",
				replace = "cs",
				update_n_lines = "",
			},
			search_method = "cover_or_next",
		})

		-- Remap adding surrounding to Visual mode selection
		vim.api.nvim_set_keymap("x", "S", [[:<C-u>lua MiniSurround.add('visual')<CR>]], { noremap = true })

		-- Make special mapping for "add surrounding for line"
		-- vim.api.nvim_set_keymap("n", "yss", "ys_", { noremap = false })
		--  Check out: https://github.com/echasnovski/mini.nvim
	end,
}
