local u = require "utils"

return {
	"stevearc/oil.nvim",
	dependencies = {
		"nvim-tree/nvim-web-devicons",
	},
	lazy = false,
	priority = 1000,
	opts = {
		default_file_explorer = true,
		columns = {
			"icon",
		},
		delete_to_trash = true,
		skip_confirm_for_simple_edits = true,
		keymaps = {
			["g?"] = { "actions.show_help", mode = "n" },
			["<CR>"] = "actions.select",
			["<C-s>"] = { "actions.select", opts = { vertical = true } },
			["<C-h>"] = { "actions.select", opts = { horizontal = true } },
			["<C-t>"] = { "actions.select", opts = { tab = true } },
			["<C-p>"] = "actions.preview",
			["<C-c>"] = { "actions.close", mode = "n" },
			["<C-l>"] = "actions.refresh",
			["-"] = { "actions.parent", mode = "n" },
			["_"] = { "actions.open_cwd", mode = "n" },
			["`"] = { "actions.cd", mode = "n" },
			["~"] = { "actions.cd", opts = { scope = "tab" }, mode = "n" },
			["gs"] = { "actions.change_sort", mode = "n" },
			["gx"] = "actions.open_external",
			["g."] = { "actions.toggle_hidden", mode = "n" },
			["g\\"] = { "actions.toggle_trash", mode = "n" },
		},
		use_default_keymaps = true,
		view_options = {
			show_hidden = true,
			natural_order = true,
			is_always_hidden = function(name, _)
				return name == ".." or name == ".git"
			end,
		},
		win_options = {
			wrap = true,
		},
	},
	config = function(_, opts)
		require("oil").setup(opts)
		u.map("n", "-", "<cmd>Oil<CR>", u.opts "Call Oil")
	end,
}
