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

require('screenkey').setup{}

-- The setup config table shows all available config options with their default values:
require("neocord").setup({
    -- General options
    logo                = "auto",                     -- "auto" or url
    logo_tooltip        = nil,                        -- nil or string
    main_image          = "language",                 -- "language" or "logo"
    client_id           = "1157438221865717891",      -- Use your own Discord application client id (not recommended)
    log_level           = nil,                        -- Log messages at or above this level (one of the following: "debug", "info", "warn", "error")
    debounce_timeout    = 10,                         -- Number of seconds to debounce events (or calls to `:lua package.loaded.presence:update(<filename>, true)`)
    blacklist           = {},                         -- A list of strings or Lua patterns that disable Rich Presence if the current file name, path, or workspace matches
    file_assets         = {},                         -- Custom file asset definitions keyed by file names and extensions (see default config at `lua/presence/file_assets.lua` for reference)
    show_time           = true,                       -- Show the timer
    global_timer        = false,                      -- if set true, timer won't update when any event are triggered

    -- Rich Presence text options
    editing_text        = "Editing %s",               -- Format string rendered when an editable file is loaded in the buffer (either string or function(filename: string): string)
    file_explorer_text  = "Browsing %s",              -- Format string rendered when browsing a file explorer (either string or function(file_explorer_name: string): string)
    git_commit_text     = "Committing changes",       -- Format string rendered when committing changes in git (either string or function(filename: string): string)
    plugin_manager_text = "Managing plugins",         -- Format string rendered when managing plugins (either string or function(plugin_manager_name: string): string)
    reading_text        = "Reading %s",               -- Format string rendered when a read-only or unmodifiable file is loaded in the buffer (either string or function(filename: string): string)
    workspace_text      = "Working on %s",            -- Format string rendered when in a git repository (either string or function(project_name: string|nil, filename: string): string)
    line_number_text    = "Line %s out of %s",        -- Format string rendered when `enable_line_number` is set to true (either string or function(line_number: number, line_count: number): string)
    terminal_text       = "Using Terminal",           -- Format string rendered when in terminal mode.
})

vim.keymap.set({'n', 'x', 'o'}, ',', vim.diagnostic.open_float)
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
	ino <c-bs> <c-w>

	no h <left>
	no t <up>
	no n <down>
	no s <right>
	no T <pageup>
	no N <pagedown>
	no / ^
	no = <end>

	no <c-h> <esc>
	ino <c-h> <esc>
	no <c-t> :
	ino <c-t> <c-o>:
	cno <c-h> <esc>
	nn <c-b> :bn<enter>
	nn <c-u> :UndotreeToggle<enter>
	
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
