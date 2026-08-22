-- Only start LSP on Laravel projects (has "artisan")
-- vim.lsp.enable("laravel_ls") starts LSP even before checking for root marker ("artisan")
vim.api.nvim_create_autocmd("FileType", {
	pattern = { "php", "blade" },
	callback = function(args)
		local root = vim.fs.root(args.buf, "artisan")
		if not root then
			return
		end

		local base_config = vim.lsp.config.laravel_ls

		if not base_config then
			vim.notify("laravel_ls config not found", vim.log.levels.WARN)
			return
		end

		local config = vim.deepcopy(base_config)
		config.root_dir = root

		vim.lsp.start(config, { bufnr = args.buf })
	end,
})
