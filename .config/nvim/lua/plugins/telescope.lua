return {
	"nvim-telescope/telescope.nvim",
	tag = "0.1.8",
	dependencies = {
		"nvim-lua/plenary.nvim",
		"debugloop/telescope-undo.nvim", -- undo tree extension
	},
	config = function()
		local builtin = require("telescope.builtin")
		vim.keymap.set("n", "<leader>ff", builtin.find_files, {})
		vim.keymap.set("n", "<C-p>", builtin.git_files, {})
		vim.keymap.set("n", "<leader>fg", builtin.live_grep, {})
		--vim.keymap.set('n', '<leader>fg', function()
		--builtin.grep_string({ search = vim.fn.input("Grep > ")})
		--end)

		require("telescope").load_extension("undo")
		vim.keymap.set("n", "<leader>u", "<cmd>Telescope undo<cr>")

		-- load refactoring Telescope extension
		require("telescope").load_extension("refactoring")

		vim.keymap.set({ "n", "x" }, "<leader>rr", function()
			require("telescope").extensions.refactoring.refactors()
		end)

		extensions = {
			undo = {
				mappings = {
					-- normal mode actions
					-- n = {
					-- 	["<leader>u"] = require("telescope-undo.actions").undo,
					-- },
				},
			},
		}
	end,
}
