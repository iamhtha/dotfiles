return {
	-- mini.nvim
	{
		"echasnovski/mini.pairs",
		version = false,
		opts = {},
	},
	{
		"echasnovski/mini.surround",
		version = false,
		opts = {},
	},
	-- twilight
	{
		"folke/twilight.nvim",
		opts = {},
	},

	-- Treesitter
	{
		"nvim-treesitter/nvim-treesitter",
		build = ":TSUpdate",
		dependencies = {
			"nvim-treesitter/nvim-treesitter-refactor",
			"nvim-treesitter/nvim-treesitter-context",
		},
		config = function()
			require("nvim-treesitter.configs").setup({
				ensure_installed = {
					"bash",
					"c",
					"cpp",
					"css",
					"go",
					"html",
					"javascript",
					"lua",
					"markdown",
					"markdown_inline",
					"python",
					"rust",
					"typescript",
				},
				refactor = {
					highlight_definition = { enable = true },
					highlight_current_scope = { enable = true },
					navigation = {
						enable = true,
						keymaps = {
							goto_definition = "gnd",
							list_definitions = "gnD",
							list_definitions_toc = "gnO",
							goto_next_usage = "gnn",
							goto_previous_usage = "gnp",
						},
					},
				},
			})
		end,
	},

	-- LuaSnip
	{
		"L3MON4D3/LuaSnip",
		version = "v2.*",
		build = "make install_jsregexp",
		dependencies = {
			"rafamadriz/friendly-snippets",
		},
		config = function()
			local ls = require("luasnip")
			require("luasnip.loaders.from_vscode").lazy_load()
			ls.setup({
				update_events = { "TextChanged", "TextChangedI" },
			})
		end,
	},

	-- blink.cmp
	{
		"saghen/blink.cmp",
		version = "*",
		opts = {
			keymap = {
				preset = "default",
				-- Alt-number to accept nth completion item
				["<A-1>"] = {
					function(cmp)
						cmp.accept({ index = 1 })
					end,
				},
				["<A-2>"] = {
					function(cmp)
						cmp.accept({ index = 2 })
					end,
				},
				["<A-3>"] = {
					function(cmp)
						cmp.accept({ index = 3 })
					end,
				},
				["<A-4>"] = {
					function(cmp)
						cmp.accept({ index = 4 })
					end,
				},
				["<A-5>"] = {
					function(cmp)
						cmp.accept({ index = 5 })
					end,
				},
				["<A-6>"] = {
					function(cmp)
						cmp.accept({ index = 6 })
					end,
				},
				["<A-7>"] = {
					function(cmp)
						cmp.accept({ index = 7 })
					end,
				},
				["<A-8>"] = {
					function(cmp)
						cmp.accept({ index = 8 })
					end,
				},
				["<A-9>"] = {
					function(cmp)
						cmp.accept({ index = 9 })
					end,
				},
				["<A-0>"] = {
					function(cmp)
						cmp.accept({ index = 10 })
					end,
				},
				-- Tab
				["<Tab>"] = {
					"snippet_forward",
					function()
						local ok, sidekick = pcall(require, "sidekick")
						if ok then
							return sidekick.nes_jump_or_apply()
						end
					end,
					function()
						return vim.lsp.inline_completion
							and vim.lsp.inline_completion.get
							and vim.lsp.inline_completion.get()
					end,
					"fallback",
				},
			},
			appearance = { nerd_font_variant = "mono" },
			snippets = { preset = "luasnip" },
			signature = { enabled = true },
			completion = {
				documentation = {
					auto_show = true,
				},
				ghost_text = {
					enabled = true,
				},
			},
			fuzzy = {
				implementation = "prefer_rust_with_warning",
				sorts = {
					"exact",
					"score",
					"sort_text",
				},
			},
		},
	},

	-- copilot
	{
		"zbirenbaum/copilot.lua",
		cmd = "Copilot",
		event = "InsertEnter",
		opts = {
			suggestion = { enabled = false }, -- blink.cmp / sidekick handle inline completions
			panel = { enabled = false },
		},
	},

	-- sidekick
	{
		"folke/sidekick.nvim",
		event = "VeryLazy",
		dependencies = { "zbirenbaum/copilot.lua" },
		opts = {
			picker = "fzf-lua", -- override default "snacks"
		},
		keys = {
			-- Tab
			{
				"<Tab>",
				function()
					local result = require("sidekick").nes_jump_or_apply()
					return result or "<Tab>"
				end,
				mode = "n",
				expr = true,
				desc = "Sidekick: NES jump or apply",
			},
			-- CLI
			{
				"<leader>at",
				function()
					require("sidekick.cli").toggle()
				end,
				mode = "n",
				desc = "Sidekick: toggle CLI",
			},
			{
				"<leader>as",
				function()
					require("sidekick.cli").select()
				end,
				mode = "n",
				desc = "Sidekick: select tool",
			},
			{
				"<leader>ac",
				function()
					require("sidekick.cli").close()
				end,
				mode = "n",
				desc = "Sidekick: close CLI",
			},
			{
				"<leader>ap",
				function()
					require("sidekick.cli").prompt()
				end,
				mode = "n",
				desc = "Sidekick: prompt CLI",
			},
			{
				"<leader>ae",
				function()
					require("sidekick.cli").send()
				end,
				mode = "v",
				desc = "Sidekick: send selection",
			},
		},
	},

	-- Avante
	{
		"yetone/avante.nvim",
		build = vim.fn.has("win32") ~= 0
				and "powershell -ExecutionPolicy Bypass -File Build.ps1 -BuildFromSource false"
			or "make",
		event = "VeryLazy",
		version = false,
		dependencies = {
			"nvim-lua/plenary.nvim",
			"MunifTanjim/nui.nvim",
			"zbirenbaum/copilot.lua",
			{
				"HakonHarnes/img-clip.nvim",
				event = "VeryLazy",
				opts = {
					default = {
						embed_image_as_base64 = false,
						prompt_for_file_name = false,
						drag_and_drop = { insert_mode = true },
						use_absolute_path = true,
					},
				},
			},
		},
		opts = {
			provider = "copilot",
			-- Disable default <leader>a* keymaps so sidekick can own that prefix
			behaviour = {
				auto_set_keymaps = false,
			},
		},
		keys = {
			{ "<leader>it", "<cmd>AvanteToggle<cr>", mode = "n", desc = "Avante: toggle panel" },
			{ "<leader>ia", "<cmd>AvanteAsk<cr>", mode = "n", desc = "Avante: ask" },
			{ "<leader>ia", "<cmd>AvanteAsk<cr>", mode = "v", desc = "Avante: ask (visual)" },
			{ "<leader>ir", "<cmd>AvanteRefresh<cr>", mode = "n", desc = "Avante: refresh" },
			{ "<leader>if", "<cmd>AvanteFocus<cr>", mode = "n", desc = "Avante: focus" },
			{ "<leader>ie", "<cmd>AvanteEdit<cr>", mode = "v", desc = "Avante: edit selection" },
		},
	},

	-- Mason
	{
		"williamboman/mason.nvim",
		config = function()
			require("mason").setup()
			-- Install formatters that are not managed by mason-lspconfig or mason-null-ls
			local registry = require("mason-registry")
			-- local-lua-debugger-vscode is not known to mason-nvim-dap, install manually
			local formatters = { "stylua", "shfmt", "prettier", "clang-format" }
			registry.refresh(function()
				for _, name in ipairs(formatters) do
					local ok, pkg = pcall(registry.get_package, name)
					if ok and not pkg:is_installed() then
						vim.notify("↓ Mason installing: " .. name, vim.log.levels.INFO)
						pkg:install()
					end
				end
			end)
		end,
	},
	{
		"williamboman/mason-lspconfig.nvim",
		dependencies = { "williamboman/mason.nvim" },
		opts = {
			ensure_installed = {
				"bashls",
				"clangd",
				"cssls",
				"gopls",
				"html",
				"lua_ls",
				"marksman",
				"pyright",
				"ruff",
				"rust_analyzer",
				"taplo",
				"texlab",
				"ts_ls",
				"typos_lsp",
			},
		},
	},
	{
		"jay-babu/mason-nvim-dap.nvim",
		dependencies = { "williamboman/mason.nvim" },
		opts = {
			ensure_installed = {
				"codelldb",
				"delve",
				"python",
			},
		},
	},
	{
		"jay-babu/mason-null-ls.nvim",
		dependencies = { "williamboman/mason.nvim" },
		opts = {
			ensure_installed = {
				-- Linters
				"codespell",
				"commitlint",
				"golangci-lint",
				"markdownlint",
				"mypy",
				"shellcheck",
			},
		},
	},

	-- LSP
	"neovim/nvim-lspconfig",

	-- conform.nvim
	{
		"stevearc/conform.nvim",
		event = { "BufWritePre" },
		opts = {
			formatters_by_ft = {
				bash = { "shfmt" },
				c = { "clang-format" },
				cpp = { "clang-format" },
				css = { "prettier" },
				go = { "gofmt" },
				html = { "prettier" },
				javascript = { "prettier" },
				javascriptreact = { "prettier" },
				json = { "prettier" },
				lua = { "stylua" },
				markdown = { "prettier" },
				python = { "ruff_format" },
				rust = { "rustfmt" },
				sh = { "shfmt" },
				typescript = { "prettier" },
				typescriptreact = { "prettier" },
				yaml = { "prettier" },
			},
			format_on_save = {
				timeout_ms = 2000,
				lsp_fallback = true,
			},
		},
	},

	-- nvim-lint
	{
		"mfussenegger/nvim-lint",
		event = { "BufWritePost", "BufReadPost", "InsertLeave" },
		config = function()
			local lint = require("lint")
			lint.linters_by_ft = {
				go = { "golangcilint" },
				markdown = { "markdownlint" },
				python = { "mypy" },
				sh = { "shellcheck" },
				bash = { "shellcheck" },
			}
			-- Trigger linting on the events above
			vim.api.nvim_create_autocmd({ "BufWritePost", "BufReadPost", "InsertLeave" }, {
				group = vim.api.nvim_create_augroup("nvim-lint", { clear = true }),
				callback = function()
					lint.try_lint()
				end,
			})
		end,
	},

	-- none-ls
	{
		"nvimtools/none-ls.nvim",
		dependencies = { "nvim-lua/plenary.nvim" },
		config = function()
			local null_ls = require("null-ls")
			null_ls.setup({
				sources = {
					null_ls.builtins.code_actions.textlint,
					null_ls.builtins.completion.luasnip,
					null_ls.builtins.diagnostics.codespell,
					null_ls.builtins.diagnostics.commitlint,
					-- NOTE: per-filetype linting is handled by nvim-lint
					-- NOTE: formatting is handled entirely by conform.nvim
				},
			})
		end,
	},

	-- DAP
	{
		"mfussenegger/nvim-dap",
		config = function()
			local dap = require("dap")

			-- DAP signs
			vim.fn.sign_define("DapBreakpoint", { text = "🛑", texthl = "", linehl = "", numhl = "" })
			vim.fn.sign_define("DapBreakpointCondition", { text = "❓", texthl = "", linehl = "", numhl = "" })
			vim.fn.sign_define("DapBreakpointRejected", { text = "⭕", texthl = "", linehl = "", numhl = "" })
			vim.fn.sign_define("DapStopped", { text = "🟡", texthl = "", linehl = "", numhl = "" })
			vim.fn.sign_define("DapLogPoint", { text = "💬", texthl = "", linehl = "", numhl = "" })

			-- C/C++/Rust
			dap.adapters.codelldb = {
				type = "executable",
				command = "codelldb",
			}
			local codelldb_config = {
				{
					name = "Launch file",
					type = "codelldb",
					request = "launch",
					program = function()
						return vim.fn.input("Path to executable: ", vim.fn.getcwd() .. "/", "file")
					end,
					cwd = "${workspaceFolder}",
					stopOnEntry = false,
				},
			}
			dap.configurations.c = codelldb_config
			dap.configurations.cpp = codelldb_config
			dap.configurations.rust = codelldb_config

			-- Go (Delve)
			dap.adapters.delve = {
				type = "server",
				port = "${port}",
				executable = {
					command = "dlv",
					args = { "dap", "-l", "127.0.0.1:${port}" },
				},
			}
			dap.configurations.go = {
				{
					name = "Launch file",
					type = "delve",
					request = "launch",
					program = "${file}",
				},
				{
					name = "Launch package",
					type = "delve",
					request = "launch",
					program = "${workspaceFolder}",
				},
				{
					name = "Attach to process",
					type = "delve",
					request = "attach",
					mode = "local",
					processId = require("dap.utils").pick_process,
				},
			}
		end,
	},
	{
		"rcarriga/nvim-dap-ui",
		dependencies = {
			"mfussenegger/nvim-dap",
			"theHamsta/nvim-dap-virtual-text",
			"nvim-neotest/nvim-nio",
			"folke/lazydev.nvim",
		},
		config = function()
			require("nvim-dap-virtual-text").setup()
			require("lazydev").setup({
				library = { "nvim-dap-ui" },
			})
			local dap, dapui = require("dap"), require("dapui")
			dapui.setup()
			dap.listeners.before.attach.dapui_config = function()
				dapui.open()
			end
			dap.listeners.before.launch.dapui_config = function()
				dapui.open()
			end
			dap.listeners.before.event_terminated.dapui_config = function()
				dapui.close()
			end
			dap.listeners.before.event_exited.dapui_config = function()
				dapui.close()
			end
		end,
	},
	{
		"mfussenegger/nvim-dap-python",
		dependencies = { "mfussenegger/nvim-dap" },
		config = function()
			local dappy = require("dap-python")
			dappy.setup("uv")
			dappy.test_runner = "pytest"
		end,
	},

	-- Neogen
	{
		"danymat/neogen",
		config = function()
			require("neogen").setup({
				enabled = true,
				snippet_engine = "luasnip",
				languages = {
					c = {
						template = { annotation_convention = "doxygen" },
					},
					cpp = {
						template = { annotation_convention = "doxygen" },
					},
					python = {
						template = { annotation_convention = "google_docstrings" },
					},
					rust = {
						template = { annotation_convention = "rustdoc" },
					},
					javascript = {
						template = { annotation_convention = "jsdoc" },
					},
					typescript = {
						template = { annotation_convention = "tsdoc" },
					},
					lua = {
						template = { annotation_convention = "emmylua" },
					},
				},
			})
		end,
	},

	-- Trouble
	{
		"folke/trouble.nvim",
		opts = {
			win = { relative = "editor" },
		},
	},

	-- sniprun
	{
		"michaelb/sniprun",
		build = "sh install.sh",
		opts = {},
	},
	-- overseer
	{
		"stevearc/overseer.nvim",
		cmd = {
			"OverseerRun",
			"OverseerToggle",
			"OverseerOpen",
			"OverseerClose",
			"OverseerQuickAction",
			"OverseerTaskAction",
		},
		opts = {},
	},
}
