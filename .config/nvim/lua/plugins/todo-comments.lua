-------------------------------------
-- todo-comments.nvim
-- See `:h todo-comments`
-------------------------------------
return {
	"folke/todo-comments.nvim",
	lazy = false,
	dependencies = { 
		"nvim-lua/plenary.nvim",
		"nvim-telescope/telescope.nvim"
	},
	opts = {},
	-- :TodoTelescope cwd=~/projects/foobar
	-- :TodoTelescope keywords=TODO,FIX
}
