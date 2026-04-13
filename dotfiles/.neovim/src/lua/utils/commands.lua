local M = {}

M.command = function(lhs, rhs, desc)
	vim.api.nvim_create_user_command(lhs, rhs, { desc = desc })
end

return M
