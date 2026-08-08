vim.api.nvim_create_user_command("Pack", function()
	print("Showing all packages...")
	vim.pack.update(nil, { offline = true })
end, { nargs = 0 }) -- '?' means 0 or 1 argument is allowed
