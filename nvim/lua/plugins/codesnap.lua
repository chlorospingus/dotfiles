return {
	'mistricky/codesnap.nvim',
	lazy = false,
	build = 'make',
	keys = {
		{'<F2>', '<cmd>CodeSnap<cr>', mode = 'x'},
	},
	opts = {
		bg_theme			= "sea",
		has_line_number		= true,
		bg_padding 			= 0,
		code_font_family	= "ComicShannsMono Nerd Font";
		mac_window_bar		= false,
		watermark			= ""
	}
}
