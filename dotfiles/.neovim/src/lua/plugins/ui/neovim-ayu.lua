return {
	"Shatur/neovim-ayu",
	lazy = false,
	priority = 1000,
	config = function()
		local function update_colors()
			local main = "NONE"
			local panel = "NONE"

			require("ayu").setup {
				mirage = false,
				overrides = function()
					return {
						Normal = { fg = "#c8d3f5", bg = main },
						SpecialKey = { fg = "#497ce3", bg = main },
						Comment = { fg = "#888888", bg = main },
						NormalFloat = { bg = panel },
						LineNr = { fg = "#bbbbbb" },
						LineNrAbove = { fg = "#888888" },
						LineNrBelow = { fg = "#888888" },
						NeoTreeCursorLine = { bg = panel },
						SignColumn = { bg = main },
						TabLineSel = { bg = main },
						TabLineFill = { bg = main },
						CursorLineNr = { bg = main, bold = true },
						StatusLine = { bg = main },
						StatusLineNC = { bg = main },
					}
				end,
			}
			vim.cmd.colorscheme "ayu"
			vim.o.fillchars = "eob: "
		end

		update_colors()
	end,
}
