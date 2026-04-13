local u = require "utils"

return {
	"nvim-telescope/telescope.nvim",
	event = "VimEnter",
	branch = "master",
	dependencies = {
		"nvim-lua/plenary.nvim",
		{
			"nvim-telescope/telescope-fzf-native.nvim",
			build = "make",
			cond = function()
				return vim.fn.executable "make" == 1
			end,
		},
		{ "nvim-telescope/telescope-ui-select.nvim" },
		{ "nvim-tree/nvim-web-devicons", enabled = vim.g.have_nerd_font },
	},
	config = function()
		local telescope = require "telescope"
		local actions = require "telescope.actions"
		local builtin = require "telescope.builtin"
		local themes = require "telescope.themes"

		telescope.setup {
			defaults = {
				mappings = {
					i = {
						["<C-k>"] = actions.move_selection_previous,
						["<C-j>"] = actions.move_selection_next,
						["<C-o>"] = actions.select_default,
					},
					n = {
						["d"] = actions.delete_buffer,
						["q"] = actions.close,
					},
				},
				layout_strategy = "horizontal",
				layout_config = {
					horizontal = {
						preview_width = 0.6,
						prompt_position = "top",
					},
					vertical = {
						preview_height = 0.5,
					},
				},
				sorting_strategy = "ascending",
				preview_cutoff = 1, 
				initial_mode = "normal",
			},
			pickers = {
				find_files = {
					file_ignore_patterns = { "node_modules", "%.git", "%.venv" },
					hidden = true,
					previewer = true,
				},
				live_grep = {
					file_ignore_patterns = { "node_modules", "%.git", "%.venv" },
					additional_args = function(_)
						return { "--hidden" }
					end,
					previewer = true,
				},
			},
			extensions = {
				["ui-select"] = {
					themes.get_dropdown(),
				},
			},
		}

		pcall(telescope.load_extension, "fzf")
		pcall(telescope.load_extension, "ui-select")

		u.map("n", "<leader>sh", builtin.help_tags, { desc = "[S]earch [H]elp" })
		u.map("n", "<leader>sk", builtin.keymaps, { desc = "[S]earch [K]eymaps" })
		u.map("n", "<leader>sf", builtin.find_files, { desc = "[S]earch [F]iles" })
		u.map("n", "<leader>sw", builtin.grep_string, { desc = "[S]earch current [W]ord" })
		u.map("n", "<leader>sg", builtin.live_grep, { desc = "[S]earch by [G]rep" })
		u.map("n", "<leader>sd", builtin.diagnostics, { desc = "[S]earch [D]iagnostics" })
		u.map("n", "<leader>sr", builtin.resume, { desc = "[S]earch [R]esume" })
		u.map("n", "<leader>s.", builtin.oldfiles, { desc = '[S]earch Recent Files ("." for repeat)' })
		u.map("n", "<leader><leader>", "<cmd>Telescope buffers sort_mru=true sort_lastused=true initial_mode=normal<CR>")
		u.map("n", "<leader>/", function()
			builtin.current_buffer_fuzzy_find(themes.get_dropdown {
				winblend = 10,
				previewer = false,
			})
		end, { desc = "[/] Fuzzily search in current buffer" })
		u.map("n", "<leader>s/", function()
			builtin.live_grep {
				grep_open_files = true,
				prompt_title = "Live Grep in Open Files",
			}
		end, { desc = "[S]earch [/] in Open Files" })
	end,
}
