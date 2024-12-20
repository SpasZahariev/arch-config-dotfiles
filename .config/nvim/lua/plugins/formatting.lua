return {
	"stevearc/conform.nvim",
	event = { "BufReadPre", "BufNewFile" },
	-- formatting file contents
	config = function()
		local conform = require("conform")

		conform.setup({
			formatters_by_ft = {
				javascript = { "prettier" },
				typescript = { "prettier" },
				typescriptreact = { "prettier" },
				css = { "prettier" },
				html = { "prettier" },
				json = { "prettier" },
				yaml = { "prettier" },
				markdown = { "prettier" },
				graphql = { "prettier" },
				lua = { "stylua" },
				python = { "isort", "black" },
				java = { "google-java-format" },
			},
			format_on_save = {
				lsp_fallback = true,
				async = false,
				timeout_ms = 1000,
			},
		})

		-- FORMATS a Visualy selected block of Code
		-- vim.keymap.set({ "n", "v" }, "<leader>mp", function()
		--   conform.format({
		--     lsp_fallback = true,
		--     async = false,
		--     timeout_ms = 1000,
		--   })
		-- end, { desc = "Format file or range (in visual mode)" })
	end,
}
