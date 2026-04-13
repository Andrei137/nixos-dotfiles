-- Dynamically load all core modules
for _, file in ipairs(vim.fn.readdir(vim.fn.stdpath "config" .. "/lua/core")) do
	if file:match "%.lua$" and file ~= "init.lua" then
		require("core." .. file:gsub("%.lua$", ""))
	end
end
