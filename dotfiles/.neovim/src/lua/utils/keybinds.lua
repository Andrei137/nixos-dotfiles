local M = {}

local m = (function(modes)
	local mod_table = {}

	local function helper(combo, start)
		for i = start, #modes do
			local new_combo = combo .. modes[i]
			local value = {}
			for c in new_combo:gmatch(".") do
				table.insert(value, c)
			end
			table.sort(value)
			mod_table[table.concat(value)] = (#value == 1) and value[1] or value
			helper(new_combo, i + 1)
		end
	end

	helper("", 1)
	return mod_table
end)({ "n", "v", "i", "t", "x" })

local function sort(str)
	local chars = {}
	for c in str:gmatch(".") do
		table.insert(chars, c)
	end
	table.sort(chars)
	return table.concat(chars)
end

M.opts = function(desc)
	return { noremap = true, silent = true, desc = desc }
end

M.map = function(mode, lhs, rhs, opts)
	vim.keymap.set(m[sort(mode)], lhs, rhs, opts)
end

return M
