require('config.lazy')

local capabilities = require('cmp_nvim_lsp').default_capabilities()

-- Set up lspconfig.
local lspconfig = require('lspconfig')
local servers = { 'jdtls', 'rust_analyzer', 'csharp_ls', 'html', 'marksman', 'ts_ls', 'clangd', 'cssls', 'tinymist'}
for _, lsp in ipairs(servers) do
  lspconfig[lsp].setup {
    capabilities = capabilities,
  }
end
lspconfig.pylsp.setup({settings={pylsp={plugins={pylint={enabled = true,}}}}})

local cmp = require('cmp')
cmp.setup({
	snippet = {
	  expand = function(args)
		vim.fn["vsnip#anonymous"](args.body)
	  end,
	},
	window = {
	  completion = cmp.config.window.bordered(),
	  documentation = cmp.config.window.bordered(),
	},
	-- formatting = {
	--   format = require('lspkind').cmp_format(),
	-- },
	mapping = cmp.mapping.preset.insert({
		['<CR>'] = cmp.mapping.confirm {
      behavior = cmp.ConfirmBehavior.Replace,
      select = true,
    },
  	}),
	sources = cmp.config.sources({
		{ name = 'nvim_lsp' },
		{ name = 'vsnip' },
	})
})

require('autoclose').setup{}

require('lualine').setup {
  options = {
    icons_enabled = true,
    theme = 'auto',
    component_separators = { left = '', right = ''},
    section_separators = { left = '', right = ''},
    disabled_filetypes = {
      statusline = {},
      winbar = {},
    },
    ignore_focus = {},
    always_divide_middle = true,
    globalstatus = false,
    refresh = {
      statusline = 1000,
      tabline = 1000,
      winbar = 1000,
    }
  },
  sections = {
    lualine_a = {{'mode', separator = {left = '', right = ''}, padding = 0}},
    lualine_b = {'branch'},
    lualine_c = {'diagnostics'},
    lualine_x = {},
	lualine_y = {'filetype'},
    lualine_z = {{'filename', separator = {left = '', right = ''}, padding = 0}}
  },
  tabline = {},
  winbar = {},
  inactive_winbar = {},
  extensions = {}
}

require('presence').setup({
	neovim_image_text = 'Because emacs was too intimidating',
	editing_text = 'Typing away...',
	reading_text = 'Reading the man pages'
})

require('screenkey').setup{}

vim.keymap.set({'n', 'x', 'o'}, 'z', vim.diagnostic.open_float)
vim.keymap.set({'n', 'x', 'o', 'i'}, '<c-s>', "<cmd>up<cr>")


if vim.g.neovide then
	vim.o.guifont = 'ComicShannsMono Nerd Font:h14'
	vim.g.neovide_transparency = 0.85
	vim.g.neovide_cursor_animation_length = 0.05
	vim.g.neovide_cursor_trail_size = 0.5
end

vim.cmd([[
	no e <c-r>

	no a i
	no i a
	no A I
	no I A
	no k o
	no <c-f> /
	ino <c-v> <esc><c-v>

	no h <left>
	no t <up>
	no n <down>
	no s <right>
	no / ^
	no = <end>

	no <c-h> <esc>
	ino <c-h> <esc>
	no <c-t> :
	ino <c-t> <c-o>:
	cno <c-h> <esc>
	nn <c-b> :bn<enter>
	nn <c-u> :UndotreeToggle<enter>
	
	ino <c-bs> <c-w>
	no j J
	nn <enter> :noh<enter>
	nn <c-enter> n
	set number
	set relativenumber
	hi LineNr ctermfg=67
	set tabstop=4
	set shiftwidth=4
	set cmdheight=0

	let g:vsnip_snippet_dir = '~/.config/nvim/vsnip'

	colorscheme catppuccin
]])	

