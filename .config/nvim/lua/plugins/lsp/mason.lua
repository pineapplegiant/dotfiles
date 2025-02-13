-- Mason.nvim
-- Installs LSP Servers, linters, formatters

return {
	"williamboman/mason.nvim",
  config = function()
    require("mason").setup({
			ui = {
				border = vim.g.border_enabled and "rounded" or "none",
				icons = {
					package_installed = "✓",
					package_pending = "➜",
					package_uninstalled = "✗",
				},
			},
    })
  end,
}
