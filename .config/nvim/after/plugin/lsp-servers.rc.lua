------------------------------------
-- Mason.nvim
-- LSP for the lazy
-------------------------------------
local status, mason = pcall(require, 'mason')
local config_status, mason_config = pcall(require, 'mason-lspconfig')
local rust_status, rust_tools = pcall(require, 'rust-tools')
local lspconfig_status, lsp_config = pcall(require, 'lspconfig')
if (not status) and (not config_status) and (not lspconfig_status) (not rust_status) then return end

-- Initial Servers Used for Mason
local servers = {
	"sumneko_lua",
	"cssls",
	"html",
	"tsserver",
	"pyright",
	"bashls",
	"jsonls",
	"yamlls",
}

-- Mason Setup
mason.setup()
mason_config.setup({
	ensure_installed = servers,
	automatic_installation = true,
})

-- Check out lspconfig docs 4 help https://github.com/neovim/nvim-lspconfig

require("mason-lspconfig").setup_handlers {
	-- The first entry (without a key) will be the default handler
	-- and will be called for each installed server that doesn't have
	-- a dedicated handler.
	function (server_name) -- default handler (optional)
		lsp_config[server_name].setup {}
	end,
	-- Next, you can provide a dedicated handler for specific servers.
	-- For example, a handler override for the `rust_analyzer`:
	["rust_analyzer"] = function ()
		rust_tools.setup {}
	end,
	["sumneko_lua"] = function ()
		lsp_config["sumneko_lua"].setup {
			settings = {
				Lua = {
					diagnostics = {
						globals = { 'vim' }
					}
				}
			}
		}
	end,
}
