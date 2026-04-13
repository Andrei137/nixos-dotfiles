local M = {}

M.autocmd = function(events, func)
	vim.api.nvim_create_autocmd(events, {
		callback = func,
	})
end

return M
