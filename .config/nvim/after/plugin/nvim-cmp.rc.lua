-------------------------------------
-- Nvim-Cmp
-- See `:help nvim-cmp`
-------------------------------------
local status, cmp = pcall(require, 'cmp')
if (not status) then return end
-- local lspkind = require 'lspkind'

-- Completion Sources
local cmp_sources = {
	{ name = 'nvim_lsp' },
	{ name = 'nvim_lua' },
	{ name = 'luasnip' },
	{ name = 'buffer' },
	{ name = 'path' },
}

-- Check NPM Completion exists
local npmStatus, cmp_npm = pcall(require,'cmp-npm')
if (npmStatus) then
	cmp_npm.setup({})
	table.insert(cmp_sources, {name = 'npm', keyword_length = 4})
end

local luasnip = require 'luasnip'



cmp.setup({
	snippet = {
		expand = function(args)
			require('luasnip').lsp_expand(args.body)
		end,
	},
	mapping = cmp.mapping.preset.insert({
		['<C-d>'] = cmp.mapping.scroll_docs(-4),
		['<C-f>'] = cmp.mapping.scroll_docs(4),
		['<C-Space>'] = cmp.mapping.complete(),
		['<C-e>'] = cmp.mapping.close(),
		['<TAB>'] = cmp.mapping.confirm({
			behavior = cmp.ConfirmBehavior.Replace,
			select = true
		}),
	}),
	-- Sources for cmp
	sources = cmp.config.sources(cmp_sources),
	-- formatting = {
	-- 	format = lspkind.cmp_format({ with_text = false, maxwidth = 50 })
	-- }
})

vim.cmd [[
  set completeopt=menuone,noinsert,noselect
  highlight! default link CmpItemKind CmpItemMenuDefault
]]

-- " Use <Tab> and <S-Tab> to navigate through popup menu
-- inoremap <expr> <Tab>   pumvisible() ? "\<C-n>" : "\<Tab>"
-- inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
