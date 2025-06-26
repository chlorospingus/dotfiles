require('config.lazy')

vim.lsp.enable("rust_analyzer")
vim.lsp.enable("jdtls")
vim.lsp.enable("clangd")
vim.lsp.enable("csharp_ls")
vim.lsp.enable("lua_ls")
vim.lsp.enable("html")
vim.lsp.enable("ts_ls")
vim.lsp.enable("css_ls")
vim.lsp.enable("tinymist")


vim.keymap.set({'n', 'x', 'o'}, ',', vim.diagnostic.open_float)
vim.keymap.set({'n', 'x', 'o', 'i'}, '<c-s>', "<cmd>up<cr>")

vim.cmd([[
	no e <c-r>
	no : ,

	no a i
	no i a
	no A I
	no I A
	no k o
	no j J
	no m q
	no M Q
	no q t
	no Q T

	no h <left>
	no t <up>
	no n <down>
	no s <right>
	no T <C-y>
	no N <C-e>
	no / ^
	no = <end>

	ino <c-bs> <c-w>
	ino <c-v> <esc><c-v>
	no <c-h> <esc>
	ino <c-h> <esc>
	no <c-t> :
	ino <c-t> <c-o>:
	cno <c-h> <esc>
	no + "
	
	no <c-f> /
	nn <enter> :noh<enter>
	nn <c-enter> n

	set number
	set relativenumber
	hi LineNr ctermfg=67
	set expandtab
	set tabstop=4
	set shiftwidth=4
	set cmdheight=0

	let g:vsnip_snippet_dir = '~/.config/nvim/vsnip'
	colorscheme catppuccin
]])

vim.api.nvim_set_hl(0, "Pmenu", { bg = nil })
vim.api.nvim_set_hl(0, "NormalFloat", { bg = nil })
