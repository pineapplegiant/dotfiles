-- Lightweight yet powerful formatter plugin for Neovim
return {
	"stevearc/conform.nvim",
	event = { "BufReadPre", "BufNewFile" },
	config = function()
		local conform = require("conform")

		conform.setup({
			formatters_by_ft = {
				javascript = { "prettier" },
				typescript = { "prettier" },
				javascriptreact = { "prettier" },
				typescriptreact = { "prettier" },
				svelte = { "prettier" },
				css = { "prettier", "stylelint" },
				html = { "prettier" },
				json = { "prettier", "jsonls" },
				yaml = { "prettier", "yamlfmt" },
				markdown = { "prettier" },
				ruby = { "rubyfmt" },
				graphql = { "prettier" },
				sql = { "sqlfmt" },
				lua = { "stylua" },
				python = { "isort", "black" },
				bash = { "beautysh" },
				go = { "crlfmt" },
			},
			-- format_on_save = {
			--   lsp_fallback = true,
			--   async = false,
			--   timeout_ms = 1000,
			-- },
		})

		vim.keymap.set({ "n", "v" }, "<leader>f", function()
			conform.format({
				lsp_fallback = true,
				async = false,
				timeout_ms = 1000,
			})
		end, { desc = "Format file or range (in visual mode)" })
	end,
}
