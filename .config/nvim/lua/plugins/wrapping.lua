-------------------------------------
-- Wrapping
-- See `:h wrapping`
-------------------------------------
return {
	"andrewferrier/wrapping.nvim",
	config = true,
	opts = {
		auto_set_mode_filetype_allowlist = {
			"asciidoc",
			"gitcommit",
			"latex",
			"mail",
			"markdown",
			"rst",
			"tex",
			"text",
		},
	},
}
