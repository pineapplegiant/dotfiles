-------------------------------------
-- Lualine:
-- See `:help lualine.txt`
-------------------------------------
--local status, lualine = pcall(require, 'lualine')
--if (not status) then return end
local function get_attached_clients()
	-- Get active clients for current buffer
	local buf_clients = vim.lsp.get_clients({ bufnr = 0 })
	if #buf_clients == 0 then
		return "No client active"
	end
	local buf_ft = vim.bo.filetype
	local buf_client_names = {}
	local num_client_names = #buf_client_names

	-- Add lsp-clients active in the current buffer
	for _, client in pairs(buf_clients) do
		num_client_names = num_client_names + 1
		buf_client_names[num_client_names] = client.name
	end

	-- Add linters for the current filetype (nvim-lint)
	local lint_success, lint = pcall(require, "lint")
	if lint_success then
		for ft, ft_linters in pairs(lint.linters_by_ft) do
			if ft == buf_ft then
				if type(ft_linters) == "table" then
					for _, linter in pairs(ft_linters) do
						num_client_names = num_client_names + 1
						buf_client_names[num_client_names] = linter
					end
				else
					num_client_names = num_client_names + 1
					buf_client_names[num_client_names] = ft_linters
				end
			end
		end
	end

	-- Add formatters (conform.nvim)
	local conform_success, conform = pcall(require, "conform")
	if conform_success then
		for _, formatter in pairs(conform.list_formatters_for_buffer(0)) do
			if formatter then
				num_client_names = num_client_names + 1
				buf_client_names[num_client_names] = formatter
			end
		end
	end

	local client_names_str = table.concat(buf_client_names, ", ")
	local language_servers = string.format("[%s]", client_names_str)

	return language_servers
end

return {
	"nvim-lualine/lualine.nvim",
	dependencies = { "nvim-tree/nvim-web-devicons", "mfussenegger/nvim-lint", "stevearc/conform.nvim" },
	config = function()
		local attached_clients = {
			get_attached_clients,
			color = {
				gui = "bold",
			},
		}
		local lualine = require("lualine")
		local lazy_status = require("lazy.status") -- to configure lazy pending updates count

		lualine.setup({
			options = {
				icons_enabled = true,
				--theme = 'spaceduck',
				-- theme = 'tokyonight',
				theme = "auto",
				section_separators = { left = "", right = "" },
				component_separators = { left = "", right = "" },
				disabled_filetypes = {
					statusline = {},
					winbar = {},
				},
				ignore_focus = {},
				always_divide_middle = true,
				globalstatus = true,
				refresh = {
					statusline = 100,
					tabline = 100,
					winbar = 100,
				},
			},
			sections = {
				lualine_a = { "mode" },
				lualine_b = { { "branch", icon = { "" } }, "diff", "diagnostics" },
				lualine_c = { "filename" },
				lualine_x = {
					{ lazy_status.updates, cond = lazy_status.has_updates },
					{ get_attached_clients },
					{ "encoding" },
					{ "filetype" },
				},
				lualine_y = { "progress" },
				lualine_z = { "location" },
			},
			inactive_sections = {
				lualine_a = {},
				lualine_b = {},
				lualine_c = { "filename" },
				lualine_x = { "location" },
				lualine_y = {},
				lualine_z = {},
			},
			tabline = {},
			winbar = {},
			inactive_winbar = {},
			extensions = { "fzf", "lazy", "mason", "oil", "quickfix" },
		})
	end,
}
