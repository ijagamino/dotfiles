for _, file in ipairs(vim.api.nvim_get_runtime_file("lua/languages/*.lua", true)) do
	local name = vim.fn.fnamemodify(file, ":t:r")
	if name ~= "init" then
		require("languages." .. name)
	end
end
