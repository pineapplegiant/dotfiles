------------------------------------
-- Null Ls
-- Diagnostics & Things
-------------------------------------
local status, null_ls = pcall(require, "null-ls")
if (not status) then return end

local formatting = null_ls.builtins.formatting
local diagnostics = null_ls.builtins.diagnostics
local completion = null_ls.builtins.completion

local sources = {
	formatting.prettier.with({ extra_args = { "--no-semi", "--single-quote", "--jsx-single-quote" } }),
	formatting.eslint,
	formatting.autopep8,
	formatting.stylua,
	formatting.clang_format,
	diagnostics.eslint,
	completion.spell,
	-- formatting.prettier,
	-- formatting.latexindent,
}

null_ls.setup({
	debug = false,
	sources = sources
})
