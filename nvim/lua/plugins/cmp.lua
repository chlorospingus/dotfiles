return {
  'saghen/blink.cmp',
  dependencies = {
	  "neovim/nvim-lspconfig",
  },

  version = '1.*',
  ---@module 'blink.cmp'
  ---@type blink.cmp.Config
  opts = {
    -- 'default' (recommended) for mappings similar to built-in completions (C-y to accept)
    -- 'super-tab' for mappings similar to vscode (tab to accept)
    -- 'enter' for enter to accept
    -- 'none' for no mappings
    --
    -- All presets have the following mappings:
    -- C-space: Open menu or open docs if already open
    -- C-n/C-p or Up/Down: Select next/previous item
    -- C-e: Hide menu
    -- C-k: Toggle signature help (if signature.enabled = true)
    --
    -- See :h blink-cmp-config-keymap for defining your own keymap
    keymap = { preset = 'enter' },

    appearance = {
      nerd_font_variant = 'mono'
    },

    completion = {
		menu = {
			border = {'╭', '─', '╮', '│', '╯', '─', '╰', '│'},
			-- border = {'╓', '─', '╖', '║', '╜', '─', '╙', '║'},
			draw = {
				columns = { {
					"label",
					"label_description",
					gap = 1
				}, {
					"kind",
				} }
			},
			components = {
				label = {
					text = {
						background = "#ffffff"
					},
				}
			}
		},
		documentation = {
			auto_show = true,
			treesitter_highlighting = true,
			window = {
				border = {'╭', '─', '╮', '│', '╯', '─', '╰', '│'},
			}
		},
		ghost_text = {
			enabled = true,
		}
	},

    sources = {
      default = { 'lsp' },
    },

    fuzzy = { implementation = "prefer_rust_with_warning" }
  },
  opts_extend = { "sources.default" }
}
