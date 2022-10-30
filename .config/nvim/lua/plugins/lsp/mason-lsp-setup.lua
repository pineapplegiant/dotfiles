------------------------------------
-- Mason.nvim
-- LSPConfig for the lazy
-------------------------------------
local status, mason = pcall(require, 'mason')
local config_status, mason_config = pcall(require, 'mason-lspconfig')
local rust_status, rust_tools = pcall(require, 'rust-tools')
local lspconfig_status, lsp_config = pcall(require, 'lspconfig')
if (not status) and (not config_status) and (not lspconfig_status) (not rust_status) then return end


-- Use an on_attach function to only map the following keys
-- after the language server attaches to the current buffer
local on_attach = function(client, bufnr)
	-- Mappings.
	-- See `:help vim.lsp.*` for documentation on any of the below functions
	local bufopts = { noremap=true, silent=true, buffer=bufnr }
	vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, bufopts)
	vim.keymap.set('n', 'gd', vim.lsp.buf.definition, bufopts)
	vim.keymap.set('n', 'K', vim.lsp.buf.hover, bufopts)
	vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, bufopts)
	vim.keymap.set('n', '<leader>D', vim.lsp.buf.type_definition, bufopts)
	vim.keymap.set('n', '<leader>rn', vim.lsp.buf.rename, bufopts)
	vim.keymap.set('n', '<leader>ca', vim.lsp.buf.code_action, bufopts)
	vim.keymap.set('n', 'gr', vim.lsp.buf.references, bufopts)
	vim.keymap.set('n', '<leader>f', function() vim.lsp.buf.format { async = true } end, bufopts)
end

-- Set up completion using nvim_cmp with LSP source
local capabilities = require('cmp_nvim_lsp').default_capabilities()

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
	automatic_installation = false,
})

mason_config.setup_handlers {
	-- The first entry (without a key) will be the default handler
	-- and will be called for each installed server that doesn't have
	-- a dedicated handler.
	function (server_name) -- default handler (optional)
		lsp_config[server_name].setup({
			on_attach = on_attach,
			capabilities = capabilities
	})
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
					},
					workspace = {
						-- Make the server aware of Neovim runtime files
						library = vim.api.nvim_get_runtime_file("", true),
						checkThirdParty = false
					},
				}
			}
		}
	end,
}

local mason_null_ls_status, mason_null_ls = pcall(require, "mason-null-ls")
if not mason_null_ls_status then return end

mason_null_ls.setup({
	ensure_installed = {
		"prettier",
		"stylua",
		"eslint_d",
	},
	automatic_installation = true,
})
