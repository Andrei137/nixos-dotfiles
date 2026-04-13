return {
	"folke/noice.nvim",
	lazy = false,
	priority = 1000,
	dependencies = {
		"MunifTanjim/nui.nvim",
		{
			"rcarriga/nvim-notify",
			config = function()
				require("notify").setup {
					render = "minimal",
					stages = "fade",
					timeout = 1000,
					background_colour = "#000000",
					minimum_width = 5,
				}
			end,
		},
	},
	opts = {
		lsp = {
			signature = {
				enabled = false,
			},
			override = {
				["vim.lsp.util.convert_input_to_markdown_lines"] = true,
				["vim.lsp.util.stylize_markdown"] = true,
				["cmp.entry.get_documentation"] = true,
			},
		},
		presets = {
			bottom_search = false,
			command_palette = true,
			long_message_to_split = true,
			inc_rename = false,
			lsp_doc_border = false,
		},
		routes = {
			{
				view = "notify",
				filter = {
					event = "msg_show",
					kind = "shell_out",
				},
			},
		},
		messages = {
			view_history = false,
			view_search = false,
		},
	},
}
