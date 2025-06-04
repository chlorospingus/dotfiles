return {
	'nvim-lualine/lualine.nvim',
	dependencies = {
		'nvim-tree/nvim-web-devicons',
	},
	opts = {
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
}
