local u = require "utils"

return {
	"zbirenbaum/copilot.lua",
	cmd = "Copilot",
	event = "InsertEnter",
	config = function()
		local copilot = require "copilot"
		copilot.setup {
			panel = { enabled = false },
			suggestion = {
				enabled = true,
				auto_trigger = false,
				accept = false,
				keymap = {
					next = "<A-]>",
					prev = "<A-[>",
				},
			},
		}

		local opts = { noremap = true, silent = true }
		local suggestion = require "copilot.suggestion"

		u.map("i", "<A-BS>", function()
			if suggestion.is_visible() then
				suggestion.dismiss()
			else
				vim.schedule(function()
					suggestion.next()
				end)
			end
		end, opts)

		u.map("i", "<A-CR>", function()
			if suggestion.is_visible() then
				suggestion.accept()
				vim.schedule(function()
					if suggestion.is_visible() then
						suggestion.next()
					end
				end)
			end
		end, opts)
	end,
}
