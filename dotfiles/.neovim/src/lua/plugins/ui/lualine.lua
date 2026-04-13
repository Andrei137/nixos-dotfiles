return {
	"nvim-lualine/lualine.nvim",
	config = function()
		local mode = { "mode" }

		local hide_in_width = function()
			return vim.fn.winwidth(0) > 100
		end

		local diagnostics = {
			"diagnostics",
			symbols = { error = " ", warn = " ", info = " ", hint = " " },
			colored = true,
			cond = hide_in_width,
		}

		local diff = {
			"diff",
			colored = true,
			symbols = { added = " ", modified = " ", removed = " " },
			cond = hide_in_width,
		}

		require("lualine").setup {
			options = {
				icons_enabled = true,
				theme = "ayu",
				section_separators = { left = "", right = "" },
				component_separators = { left = "", right = "" },
				disabled_filetypes = { "alpha", "neo-tree" },
				always_divide_middle = true,
			},
			sections = {
				lualine_a = { mode },
				lualine_b = { "branch", diff },
				lualine_c = {},
				lualine_x = { diagnostics, { "filetype", cond = hide_in_width } },
				lualine_y = { "location" },
				lualine_z = { "progress" },
			},
			inactive_sections = {
				lualine_a = {},
				lualine_b = {},
				lualine_c = { { "filename", path = 1 } },
				lualine_x = { { "location", padding = 0 } },
				lualine_y = {},
				lualine_z = {},
			},
			tabline = {},
			extensions = { "fugitive" },
		}

		vim.api.nvim_create_autocmd("FileType", {
			pattern = "lualine",
			callback = function()
				vim.opt_local.winfixheight = true
			end,
		})
	end,
}
