return {
	{
		"ellisonleao/gruvbox.nvim",
		init = function()
			vim.o.background = "dark"
			vim.cmd([[colorscheme gruvbox]])
		end,
	},
	{
		"nvim-lualine/lualine.nvim",
		dependencies = { "nvim-tree/nvim-web-devicons" },
		opts = {
			sections = {
				lualine_c = {
					"filename",
					"lsp_status",
					-- Copilot LSP status (plain text, no icon)
					{
						function()
							for _, client in ipairs(vim.lsp.get_clients({ bufnr = 0 })) do
								if client.name == "copilot" then
									return "[copilot]"
								end
							end
							return ""
						end,
					},
					-- Sidekick NES + CLI status (plain text, no icon)
					{
						function()
							local ok, status = pcall(require, "sidekick.status")
							if not ok then
								return ""
							end
							local parts = {}
							local nes = status.get()
							if nes and nes ~= "" then
								parts[#parts + 1] = "[sidekick:" .. nes .. "]"
							end
							local cli = status.cli()
							if cli and cli ~= "" then
								parts[#parts + 1] = "[sidekick-cli:" .. cli .. "]"
							end
							return table.concat(parts, " ")
						end,
					},
				},
			},
		},
	},
	"xiyaowong/transparent.nvim",
}
