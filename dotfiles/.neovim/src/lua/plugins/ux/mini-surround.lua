return {
	"nvim-mini/mini.surround",
	version = false,
	config = function()
		local surround = require "mini.surround"
		surround.setup {
			s = { input = { "%[%[().-()%]%]" }, output = { left = "[[", right = "]]" } },
		}
	end,
}
