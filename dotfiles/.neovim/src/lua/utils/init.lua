local M = {}

-- Dynamically load all utility modules
for _, file in ipairs(vim.fn.readdir(vim.fn.stdpath "config" .. "/lua/utils")) do
	if file:match "%.lua$" and file ~= "init.lua" then
		local module_name = "utils." .. file:gsub("%.lua$", "")
		local ok, mod = pcall(require, module_name)
		if ok and type(mod) == "table" then
			for k, v in pairs(mod) do
				M[k] = v
			end
		end
	end
end

return M
