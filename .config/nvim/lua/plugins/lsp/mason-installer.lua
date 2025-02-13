return {
	"WhoIsSethDaniel/mason-tool-installer.nvim",
	config = function()
		require("mason-tool-installer").setup{
			-- a list of all tools you want to ensure are installed upon start
			ensure_installed = {
        "css-lsp",
        "emmet-ls",
        "html-lsp",
				"lua-language-server",
        "typescript-language-server",
        "tailwindcss-language-server",
        "pyright",
        "golangci-lint",
				"bash-language-server",
        "gopls",
				"vim-language-server",
				"stylua",
				"editorconfig-checker",
				"json-to-struct",
				"luacheck",
				"misspell",
        "cspell",
				"shellcheck",
			},
			auto_update = false,
			run_on_start = true,
			start_delay = 3000, -- 3 second delay
			debounce_hours = 5, -- at least 5 hours between attempts to install/update
			integrations = {
				["mason-lspconfig"] = true,
			},
		}
	end,
}
