------------------------------------
-- Mason.nvim
-- LSPConfig for the lazy
-------------------------------------
local deps_ok, mason, mason_config, rust_tools, lsp_config, mason_null_ls = pcall(function()
	return require("mason"), require("mason-lspconfig"), require("rust-tools"), require("lspconfig"), require ("mason-null-ls")
end)
if not deps_ok then
	return
end

-- Use an on_attach function to only map the following keys
-- after the language server attaches to the current buffer
local on_attach = function(client, bufnr)
	-- Mappings.
	-- See `:help vim.lsp.*` for documentation on any of the below functions
	local bufopts = { noremap = true, silent = true, buffer = bufnr }
	vim.keymap.set("n", "gD", vim.lsp.buf.declaration, bufopts)
	vim.keymap.set("n", "gd", vim.lsp.buf.definition, bufopts)
	vim.keymap.set("n", "K", vim.lsp.buf.hover, bufopts)
	vim.keymap.set("n", "gi", vim.lsp.buf.implementation, bufopts)
	vim.keymap.set("n", "<leader>D", vim.lsp.buf.type_definition, bufopts)
	vim.keymap.set("n", "<leader>r", vim.lsp.buf.rename, bufopts)
	vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, bufopts)
	vim.keymap.set("n", "gr", vim.lsp.buf.references, bufopts)
	vim.keymap.set("n", "<leader>f", function()
		vim.lsp.buf.format({ async = true })
	end, bufopts)
end

-- Set up completion using nvim_cmp with LSP source
local capabilities = require("cmp_nvim_lsp").default_capabilities()

-- Initial Servers Used for Mason
local servers = {
	"lua_ls",
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

mason_config.setup_handlers({
	-- The first entry (without a key) will be the default handler
	-- and will be called for each installed server that doesn't have
	-- a dedicated handler.
	function(server_name) -- default handler (optional)
		lsp_config[server_name].setup({
			on_attach = on_attach,
			capabilities = capabilities,
		})
	end,
	-- Next, you can provide a dedicated handler for specific servers.
	-- For example, a handler override for the `rust_analyzer`:
	["rust_analyzer"] = function()
		rust_tools.setup({})
	end,
	["lua_ls"] = function()
		lsp_config["lua_ls"].setup({
			settings = {
				Lua = {
					diagnostics = {
						globals = { "vim" },
					},
					workspace = {
						-- Make the server aware of Neovim runtime files
						library = vim.api.nvim_get_runtime_file("", true),
						checkThirdParty = false,
					},
				},
			},
		})
	end,
})

-- Normal Null-ls
local status, null_ls = pcall(require, "null-ls")
if (not status) then return end

mason_null_ls.setup({
    ensure_installed = {
        -- Opt to list sources here, when available in mason.
    },
    automatic_installation = false,
    handlers = {},
})

local formatting = null_ls.builtins.formatting
local diagnostics = null_ls.builtins.diagnostics
local completion = null_ls.builtins.completion


null_ls.setup({
	-- Anything not supported by mason.
	debug = true,
	sources = {
		-- formatting.prettier.with({ extra_args = { "--no-semi", "--single-quote", "--jsx-single-quote" } }),
		-- formatting.eslint,
		-- formatting.autopep8,
		-- formatting.stylua,
		-- formatting.clang_format,
		-- diagnostics.eslint,
		-- completion.spell,
		-- formatting.prettierd,
		-- formatting.latexindent,
	}
})
