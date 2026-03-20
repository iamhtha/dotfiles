local wk = require("which-key")
wk.add({
	-- Prefix groups
	{ "<leader>", group = "Plugins" },
	{ "<leader>a", group = "Sidekick (AI NES + CLI)" },
	{ "<leader>f", group = "fzf" },
	{ "<leader>fd", group = "Diagnostics & LSP" },
	{ "<leader>fg", group = "Git (fzf)" },
	{ "<leader>fs", group = "Search" },
	{ "<leader>ft", group = "Tags" },
	{ "<leader>fx", group = "Extra" },
	{ "<leader>G", group = "Git: Fugitive" },
	{ "<leader>g", group = "Gitsigns" },
	{ "<leader>i", group = "Avante (AI panel)" },
	{ "<leader>l", group = "Language tools" },
	{ "<leader>n", group = "Neogen (annotation generator)" },
	{ "<leader>N", group = "Namu (symbol picker)" },
	{ "<leader>o", group = "Overseer (task runner)" },
	{ "<leader>r", group = "Run (sniprun)" },
	{ "<leader>t", group = "Trouble" },
	{ "<leader>t<C-d>", group = "Diagnostics" },
	{ "gn", group = "Treesitter keymaps" },
	{ "gr", group = "LSP keymaps" },
	{ "[", mode = { "n" }, group = "Previous/first ..." },
	{ "]", mode = { "n" }, group = "Next/last ..." },
	-- Default NVim mappings
	{ "Y", mode = { "n" }, desc = "Yank till end of line (y$)" },
	{ "<C-u>", mode = { "i" }, desc = "Delete all entered chars before cursor in line" },
	{ "<C-w>", mode = { "i" }, desc = "Delete word before cursor" },
	{ "<C-l>", mode = { "n", "i" }, desc = "Clear and redraw screen" },
	{ "&", mode = { "n" }, desc = "Repeat last substitute (:s)" },
	{ "g&", mode = { "n" }, desc = "Repeat last substitute globally (:%s)" },
	{ "grn", mode = { "n" }, desc = "Rename all references to symbol under cursor" },
	{ "grr", mode = { "n" }, desc = "List references to symbol (quickfix)" },
	{ "gra", mode = { "n" }, desc = "Code action at cursor" },
	{ "gri", mode = { "n" }, desc = "List implementations (quickfix)" },
	{ "gO", mode = { "n" }, desc = "List buffer symbols (location list)" },
	{ "<C-s>", mode = { "i", "s" }, desc = "Signature information (floating)" },
	{ "<C-w>d", mode = { "n" }, desc = "Show diagnostic under cursor" },
	{ "<C-w><C-d>", mode = { "n" }, desc = "Show diagnostic under cursor" },
	{ "K", mode = { "n" }, desc = "Hover information (floating)" },
	{ "[d", mode = { "n" }, desc = "Jump to previous diagnostic" },
	{ "]d", mode = { "n" }, desc = "Jump to next diagnostic" },
	{ "[D", mode = { "n" }, desc = "Jump to first diagnostic in buffer" },
	{ "]D", mode = { "n" }, desc = "Jump to last diagnostic in buffer" },
	{ "[q", mode = { "n" }, desc = "Jump to previous quickfix entry" },
	{ "]q", mode = { "n" }, desc = "Jump to next quickfix entry" },
	{ "[Q", mode = { "n" }, desc = "Jump to first quickfix entry" },
	{ "]Q", mode = { "n" }, desc = "Jump to last quickfix entry" },
	{ "[l", mode = { "n" }, desc = "Jump to previous location-list entry" },
	{ "]l", mode = { "n" }, desc = "Jump to next location-list entry" },
	{ "[L", mode = { "n" }, desc = "Jump to first location-list entry" },
	{ "]L", mode = { "n" }, desc = "Jump to last location-list entry" },
	{ "[t", mode = { "n" }, desc = "Jump to previous matching tag" },
	{ "]t", mode = { "n" }, desc = "Jump to next matching tag" },
	{ "[a", mode = { "n" }, desc = "Jump to previous argument" },
	{ "]a", mode = { "n" }, desc = "Jump to next argument" },
	{ "[A", mode = { "n" }, desc = "Jump to first argument" },
	{ "]A", mode = { "n" }, desc = "Jump to last argument" },
	{ "[b", mode = { "n" }, desc = "Jump to previous buffer" },
	{ "]b", mode = { "n" }, desc = "Jump to next buffer" },
	{ "[B", mode = { "n" }, desc = "Jump to first buffer" },
	{ "]B", mode = { "n" }, desc = "Jump to last buffer" },
	{ "[<space>", mode = { "n" }, desc = "Insert empty line above" },
	{ "]<space>", mode = { "n" }, desc = "Insert empty line below" },
	-- General
	{ "<C-e>", mode = { "i", "s" }, desc = "Cancel/abort (blink.cmp, fzf-lua)", noremap = true, silent = true },
	{ "<up>", mode = { "i", "s" }, desc = "Go up (blink.cmp, fzf-lua)", noremap = true, silent = true },
	{ "<C-p>", mode = { "i", "s" }, desc = "Go up (blink.cmp, fzf-lua)", noremap = true, silent = true },
	{ "<down>", mode = { "i", "s" }, desc = "Go down (blink.cmp, fzf-lua)", noremap = true, silent = true },
	{ "<C-n>", mode = { "i", "s" }, desc = "Go down (blink.cmp, fzf-lua)", noremap = true, silent = true },
	{ "<C-y>", mode = { "i", "s" }, desc = "Accept (blink.cmp, fzf-lua)", noremap = true, silent = true },
	-- blink.cmp
	{ "<C-space>", mode = { "i" }, desc = "Show/hide completion docs", noremap = true, silent = true },
	{ "<C-b>", mode = { "i" }, desc = "Scroll docs up", noremap = true, silent = true },
	{ "<C-f>", mode = { "i" }, desc = "Scroll docs down", noremap = true, silent = true },
	{ "<S-tab>", mode = { "i", "s" }, desc = "Snippet backward", noremap = true, silent = true },
	{ "<C-k>", mode = { "i", "s" }, desc = "Show signature", noremap = true, silent = true },
	{ "<A-1>", mode = { "i", "s" }, desc = "Accept 1st suggestion", noremap = true, silent = true },
	{ "<A-2>", mode = { "i", "s" }, desc = "Accept 2nd suggestion", noremap = true, silent = true },
	{ "<A-3>", mode = { "i", "s" }, desc = "Accept 3rd suggestion", noremap = true, silent = true },
	{ "<A-4>", mode = { "i", "s" }, desc = "Accept 4th suggestion", noremap = true, silent = true },
	{ "<A-5>", mode = { "i", "s" }, desc = "Accept 5th suggestion", noremap = true, silent = true },
	{ "<A-6>", mode = { "i", "s" }, desc = "Accept 6th suggestion", noremap = true, silent = true },
	{ "<A-7>", mode = { "i", "s" }, desc = "Accept 7th suggestion", noremap = true, silent = true },
	{ "<A-8>", mode = { "i", "s" }, desc = "Accept 8th suggestion", noremap = true, silent = true },
	{ "<A-9>", mode = { "i", "s" }, desc = "Accept 9th suggestion", noremap = true, silent = true },
	{ "<A-0>", mode = { "i", "s" }, desc = "Accept 10th suggestion", noremap = true, silent = true },
	-- Tab
	-- Insert/select mode: handled by blink.cmp opts in code.lua
	{
		"<Tab>",
		mode = { "i", "s" },
		desc = "Snippet fwd / Sidekick NES jump-or-apply / inline completion",
		noremap = true,
		silent = true,
	},
	-- Normal mode: handled by sidekick.nvim keys spec in code.lua
	{ "<Tab>", mode = { "n" }, desc = "Sidekick: NES jump or apply", noremap = true, silent = true },
	-- LSP
	{
		"gd",
		vim.lsp.buf.definition,
		mode = { "n" },
		desc = "Jump to definition",
		noremap = true,
		silent = true,
	},
	{
		"gD",
		vim.lsp.buf.declaration,
		mode = { "n" },
		desc = "Jump to declaration",
		noremap = true,
		silent = true,
	},
	{
		"grt",
		vim.lsp.buf.type_definition,
		mode = { "n" },
		desc = "Jump to type definition",
		noremap = true,
		silent = true,
	},
	{
		"grs",
		vim.lsp.buf.document_symbol,
		mode = { "n" },
		desc = "List document symbols",
		noremap = true,
		silent = true,
	},
	-- grf → conform (replaces vim.lsp.buf.format)
	{
		"grf",
		function()
			require("conform").format({ async = true, lsp_fallback = true })
		end,
		mode = { "n" },
		desc = "Format buffer (conform)",
		noremap = true,
		silent = true,
	},
	-- Sidekick
	{ "<leader>?", require("which-key").show, desc = "Buffer keymaps (which-key)", noremap = true, silent = true },
	{ "<leader>at", desc = "Sidekick: toggle CLI" },
	{ "<leader>as", desc = "Sidekick: select tool" },
	{ "<leader>ac", desc = "Sidekick: close CLI" },
	{ "<leader>ap", desc = "Sidekick: prompt" },
	{ "<leader>ae", mode = { "v" }, desc = "Sidekick: send selection" },
	-- Avante
	{ "<leader>it", desc = "Avante: toggle panel" },
	{ "<leader>ia", desc = "Avante: ask" },
	{ "<leader>ir", desc = "Avante: refresh" },
	{ "<leader>if", desc = "Avante: focus" },
	{ "<leader>ie", mode = { "n", "v" }, desc = "Avante: edit selection (visual)" },
	-- Buffer-local <leader>lr (render-markdown) and <leader>lm (nabla) are
	-- registered via FileType autocmds in languages.lua.
	{
		"<leader>ll",
		function()
			require("lint").try_lint()
		end,
		mode = { "n" },
		desc = "Run linter (nvim-lint)",
		noremap = true,
		silent = true,
	},
	{ "<leader>lr", desc = "Toggle render-markdown (markdown buffers)" },
	{ "<leader>lm", desc = "Toggle nabla math preview (tex/markdown buffers)" },
	-- Neogen
	{
		"<leader>na",
		function()
			require("neogen").generate()
		end,
		mode = "n",
		desc = "Generate annotation (auto)",
		noremap = true,
		silent = true,
	},
	{
		"<leader>nc",
		function()
			require("neogen").generate({ type = "class" })
		end,
		mode = "n",
		desc = "Generate annotation (class)",
		noremap = true,
		silent = true,
	},
	{
		"<leader>nf",
		function()
			require("neogen").generate({ type = "func" })
		end,
		mode = "n",
		desc = "Generate annotation (function)",
		noremap = true,
		silent = true,
	},
	{
		"<leader>nF",
		function()
			require("neogen").generate({ type = "file" })
		end,
		mode = "n",
		desc = "Generate annotation (file)",
		noremap = true,
		silent = true,
	},
	{
		"<leader>nt",
		function()
			require("neogen").generate({ type = "type" })
		end,
		mode = "n",
		desc = "Generate annotation (type)",
		noremap = true,
		silent = true,
	},
	-- Gitsigns
	{ "]g", mode = { "n" }, desc = "Gitsigns: next hunk" },
	{ "[g", mode = { "n" }, desc = "Gitsigns: previous hunk" },
	{ "<leader>gs", mode = { "n", "v" }, desc = "Gitsigns: stage hunk" },
	{ "<leader>gr", mode = { "n", "v" }, desc = "Gitsigns: reset hunk" },
	{ "<leader>gS", mode = { "n" }, desc = "Gitsigns: stage buffer" },
	{ "<leader>gR", mode = { "n" }, desc = "Gitsigns: reset buffer" },
	{ "<leader>gu", mode = { "n" }, desc = "Gitsigns: undo stage hunk" },
	{ "<leader>gp", mode = { "n" }, desc = "Gitsigns: preview hunk" },
	{ "<leader>gb", mode = { "n" }, desc = "Gitsigns: blame line" },
	{ "<leader>gB", mode = { "n" }, desc = "Gitsigns: blame buffer" },
	{ "<leader>gd", mode = { "n" }, desc = "Gitsigns: diff this" },
	{ "<leader>gD", mode = { "n" }, desc = "Gitsigns: diff this ~" },
	{ "<leader>gt", mode = { "n" }, desc = "Gitsigns: toggle deleted" },
	{ "ih", mode = { "o", "x" }, desc = "Gitsigns: select hunk (text obj)" },
	-- DAP
	{
		"<F5>",
		"<cmd>DapContinue<cr>",
		mode = { "n", "i", "v" },
		desc = "Start/continue debug",
		noremap = true,
		silent = true,
	},
	{
		"<F5>",
		function()
			require("dap-python").debug_selection()
		end,
		mode = { "s" },
		desc = "Debug selection (Python)",
		noremap = true,
		silent = true,
	},
	{
		"<C-F5>",
		function()
			require("dap").run_to_cursor()
		end,
		mode = { "n", "i", "v", "s" },
		desc = "Run to cursor",
		noremap = true,
		silent = true,
	},
	{
		"<S-F5>",
		"<cmd>DapTerminate<cr>",
		mode = { "n", "i", "v", "s" },
		desc = "Stop debugger",
		noremap = true,
		silent = true,
	},
	{
		"<C-S-F5>",
		function()
			require("dap").restart()
		end,
		mode = { "n", "i", "v", "s" },
		desc = "Restart debugger",
		noremap = true,
		silent = true,
	},
	{
		"<F9>",
		"<cmd>DapToggleBreakpoint<cr>",
		mode = { "n", "i", "v", "s" },
		desc = "Toggle breakpoint",
		noremap = true,
		silent = true,
	},
	{
		"<S-F9>",
		"<cmd>DapClearBreakpoints<cr>",
		mode = { "n", "i", "v", "s" },
		desc = "Clear breakpoints",
		noremap = true,
		silent = true,
	},
	{
		"<C-S-F9>",
		function()
			require("dap").set_breakpoint(vim.fn.input("Breakpoint condition: "))
		end,
		mode = { "n", "i", "v", "s" },
		desc = "Set conditional breakpoint",
		noremap = true,
		silent = true,
	},
	{
		"<F10>",
		"<cmd>DapStepOver<cr>",
		mode = { "n", "i", "v", "s" },
		desc = "Step over",
		noremap = true,
		silent = true,
	},
	{
		"<F11>",
		"<cmd>DapStepInto<cr>",
		mode = { "n", "i", "v", "s" },
		desc = "Step into",
		noremap = true,
		silent = true,
	},
	{
		"<S-F11>",
		"<cmd>DapStepOut<cr>",
		mode = { "n", "i", "v", "s" },
		desc = "Step out",
		noremap = true,
		silent = true,
	},
	{
		"<F12>",
		function()
			require("dap-python").test_method()
		end,
		mode = { "n", "i", "v", "s" },
		desc = "Test method (Python)",
	},
	{
		"<S-F12>",
		function()
			require("dap-python").test_class()
		end,
		mode = { "n", "i", "v", "s" },
		desc = "Test class (Python)",
	},
	{
		"dr",
		"<cmd>DapToggleRepl<cr>",
		mode = { "n" },
		desc = "Toggle REPL",
		noremap = true,
		silent = true,
	},
	{
		"dp",
		function()
			require("dap.ui.widgets").preview()
		end,
		mode = { "n" },
		desc = "Preview (debug)",
		noremap = true,
		silent = true,
	},
	{
		"dK",
		function()
			require("dap.ui.widgets").hover()
		end,
		mode = { "n" },
		desc = "Hover (debug)",
		noremap = true,
		silent = true,
	},
	{
		"du",
		function()
			require("dapui").toggle()
		end,
		mode = { "n" },
		desc = "Toggle DAP UI",
		noremap = true,
		silent = true,
	},
	-- fzf-lua
	{
		"<leader>f<leader>",
		"<cmd>FzfLua<cr>",
		mode = { "n" },
		desc = "Fzf overview",
		noremap = true,
		silent = true,
	},
	{
		"<leader>fb",
		function()
			require("fzf-lua").buffers()
		end,
		mode = { "n" },
		desc = "Fzf buffers",
		noremap = true,
		silent = true,
	},
	{
		"<leader>ff",
		function()
			require("fzf-lua").files()
		end,
		mode = { "n" },
		desc = "Fzf files",
		noremap = true,
		silent = true,
	},
	{
		"<leader>fh",
		function()
			require("fzf-lua").oldfiles()
		end,
		mode = { "n" },
		desc = "Fzf file history",
		noremap = true,
		silent = true,
	},
	{
		"<leader>fl",
		function()
			require("fzf-lua").live_grep_native()
		end,
		mode = { "n" },
		desc = "Live grep project",
		noremap = true,
		silent = true,
	},
	{
		"<leader>fq",
		function()
			require("fzf-lua").quickfix()
		end,
		mode = { "n" },
		desc = "Fzf quickfix list",
		noremap = true,
		silent = true,
	},
	{
		"<leader>fr",
		function()
			require("fzf-lua").resume()
		end,
		mode = { "n" },
		desc = "Fzf resume",
		noremap = true,
		silent = true,
	},
	{
		"<leader>fT",
		function()
			require("fzf-lua").tabs()
		end,
		mode = { "n" },
		desc = "Fzf open tabs",
		noremap = true,
		silent = true,
	},
	-- fzf: Diagnostics & LSP
	{
		"<leader>fdr",
		function()
			require("fzf-lua").lsp_references()
		end,
		mode = { "n" },
		desc = "References",
		noremap = true,
		silent = true,
	},
	{
		"<leader>fdd",
		function()
			require("fzf-lua").lsp_definitions()
		end,
		mode = { "n" },
		desc = "Definitions",
		noremap = true,
		silent = true,
	},
	{
		"<leader>fdD",
		function()
			require("fzf-lua").lsp_declarations()
		end,
		mode = { "n" },
		desc = "Declarations",
		noremap = true,
		silent = true,
	},
	{
		"<leader>fdt",
		function()
			require("fzf-lua").lsp_typedefs()
		end,
		mode = { "n" },
		desc = "Type definitions",
		noremap = true,
		silent = true,
	},
	{
		"<leader>fdi",
		function()
			require("fzf-lua").lsp_implementations()
		end,
		mode = { "n" },
		desc = "Implementations",
		noremap = true,
		silent = true,
	},
	{
		"<leader>fds",
		function()
			require("fzf-lua").lsp_document_symbols()
		end,
		mode = { "n" },
		desc = "Document symbols",
		noremap = true,
		silent = true,
	},
	{
		"<leader>fdS",
		function()
			require("fzf-lua").lsp_workspace_symbols()
		end,
		mode = { "n" },
		desc = "Workspace symbols",
		noremap = true,
		silent = true,
	},
	{
		"<leader>fd<C-s>",
		function()
			require("fzf-lua").lsp_live_workspace_symbols()
		end,
		mode = { "n" },
		desc = "Workspace symbols (live)",
		noremap = true,
		silent = true,
	},
	{
		"<leader>fdc",
		function()
			require("fzf-lua").lsp_incoming_calls()
		end,
		mode = { "n" },
		desc = "Incoming calls",
		noremap = true,
		silent = true,
	},
	{
		"<leader>fdC",
		function()
			require("fzf-lua").lsp_outgoing_calls()
		end,
		mode = { "n" },
		desc = "Outgoing calls",
		noremap = true,
		silent = true,
	},
	{
		"<leader>fda",
		function()
			require("fzf-lua").lsp_code_actions()
		end,
		mode = { "n" },
		desc = "Code actions",
		noremap = true,
		silent = true,
	},
	{
		"<leader>fdf",
		function()
			require("fzf-lua").lsp_finder()
		end,
		mode = { "n" },
		desc = "LSP finder (all locations)",
		noremap = true,
		silent = true,
	},
	{
		"<leader>fd<C-d>",
		function()
			require("fzf-lua").diagnostics_document()
		end,
		mode = { "n" },
		desc = "Document diagnostics",
		noremap = true,
		silent = true,
	},
	{
		"<leader>fd<C-w>",
		function()
			require("fzf-lua").diagnostics_workspace()
		end,
		mode = { "n" },
		desc = "Workspace diagnostics",
		noremap = true,
		silent = true,
	},
	-- fzf: Git
	{
		"<leader>fgf",
		function()
			require("fzf-lua").git_files()
		end,
		mode = { "n" },
		desc = "git ls-files",
		noremap = true,
		silent = true,
	},
	{
		"<leader>fgs",
		function()
			require("fzf-lua").git_status()
		end,
		mode = { "n" },
		desc = "git status",
		noremap = true,
		silent = true,
	},
	{
		"<leader>fgc",
		function()
			require("fzf-lua").git_bcommits()
		end,
		mode = { "n" },
		desc = "git log (buffer)",
		noremap = true,
		silent = true,
	},
	{
		"<leader>fgC",
		function()
			require("fzf-lua").git_commits()
		end,
		mode = { "n" },
		desc = "git log (project)",
		noremap = true,
		silent = true,
	},
	{
		"<leader>fgb",
		function()
			require("fzf-lua").git_branches()
		end,
		mode = { "n" },
		desc = "git branches",
		noremap = true,
		silent = true,
	},
	{
		"<leader>fgB",
		function()
			require("fzf-lua").git_blame()
		end,
		mode = { "n" },
		desc = "git blame",
		noremap = true,
		silent = true,
	},
	{
		"<leader>fgt",
		function()
			require("fzf-lua").git_tags()
		end,
		mode = { "n" },
		desc = "git tags",
		noremap = true,
		silent = true,
	},
	{
		"<leader>fgS",
		function()
			require("fzf-lua").git_stash()
		end,
		mode = { "n" },
		desc = "git stash",
		noremap = true,
		silent = true,
	},
	-- Search
	{
		"<leader>fsb",
		function()
			require("fzf-lua").lgrep_curbuf()
		end,
		mode = { "n" },
		desc = "Live grep current buffer",
		noremap = true,
		silent = true,
	},
	{
		"<leader>fsq",
		function()
			require("fzf-lua").lgrep_quickfix()
		end,
		mode = { "n" },
		desc = "Live grep quickfix list",
		noremap = true,
		silent = true,
	},
	{
		"<leader>fsl",
		function()
			require("fzf-lua").lgrep_loclist()
		end,
		mode = { "n" },
		desc = "Live grep location list",
		noremap = true,
		silent = true,
	},
	{
		"<leader>fst",
		function()
			require("fzf-lua").tags_live_grep()
		end,
		mode = { "n" },
		desc = "Live grep project tags",
		noremap = true,
		silent = true,
	},
	{
		"<leader>fsT",
		function()
			require("fzf-lua").tags_grep()
		end,
		mode = { "n" },
		desc = "Grep project tags",
		noremap = true,
		silent = true,
	},
	{
		"<leader>fsg",
		function()
			require("fzf-lua").grep_project()
		end,
		mode = { "n" },
		desc = "Grep project",
		noremap = true,
		silent = true,
	},
	{
		"<leader>fsL",
		function()
			require("fzf-lua").grep_last()
		end,
		mode = { "n" },
		desc = "Grep (last pattern)",
		noremap = true,
		silent = true,
	},
	{
		"<leader>fsw",
		function()
			require("fzf-lua").grep_cword()
		end,
		mode = { "n" },
		desc = "Grep word under cursor",
		noremap = true,
		silent = true,
	},
	{
		"<leader>fsW",
		function()
			require("fzf-lua").grep_cWord()
		end,
		mode = { "n" },
		desc = "Grep WORD under cursor",
		noremap = true,
		silent = true,
	},
	{
		"<leader>fsv",
		function()
			require("fzf-lua").grep_visual()
		end,
		mode = { "v" },
		desc = "Grep visual selection",
		noremap = true,
		silent = true,
	},
	{
		"<leader>fsB",
		function()
			require("fzf-lua").grep_curbuf()
		end,
		mode = { "n" },
		desc = "Grep current buffer",
		noremap = true,
		silent = true,
	},
	{
		"<leader>fsQ",
		function()
			require("fzf-lua").grep_quickfix()
		end,
		mode = { "n" },
		desc = "Grep quickfix list",
		noremap = true,
		silent = true,
	},
	{
		"<leader>fsX",
		function()
			require("fzf-lua").grep_loclist()
		end,
		mode = { "n" },
		desc = "Grep location list",
		noremap = true,
		silent = true,
	},
	-- fzf: Tags
	{
		"<leader>ftt",
		function()
			require("fzf-lua").tags()
		end,
		mode = { "n" },
		desc = "Search project tags",
		noremap = true,
		silent = true,
	},
	{
		"<leader>ftb",
		function()
			require("fzf-lua").btags()
		end,
		mode = { "n" },
		desc = "Search buffer tags",
		noremap = true,
		silent = true,
	},
	{
		"<leader>ftw",
		function()
			require("fzf-lua").tag_grep_cword()
		end,
		mode = { "n" },
		desc = "Tags grep word under cursor",
		noremap = true,
		silent = true,
	},
	{
		"<leader>ftW",
		function()
			require("fzf-lua").tag_grep_cWord()
		end,
		mode = { "n" },
		desc = "Tags grep WORD under cursor",
		noremap = true,
		silent = true,
	},
	{
		"<leader>ftv",
		function()
			require("fzf-lua").tag_grep_visual()
		end,
		mode = { "v" },
		desc = "Tags grep visual selection",
		noremap = true,
		silent = true,
	},
	-- fzf: Extra
	{
		"<leader>fxa",
		function()
			require("fzf-lua").args()
		end,
		mode = { "n" },
		desc = "Fzf argument list",
		noremap = true,
		silent = true,
	},
	{
		"<leader>fxc",
		function()
			require("fzf-lua").command_history()
		end,
		mode = { "n" },
		desc = "Fzf command history",
		noremap = true,
		silent = true,
	},
	{
		"<leader>fxl",
		function()
			require("fzf-lua").loclist()
		end,
		mode = { "n" },
		desc = "Fzf location list",
		noremap = true,
		silent = true,
	},
	{
		"<leader>fxL",
		function()
			require("fzf-lua").loclist_stack()
		end,
		mode = { "n" },
		desc = "Fzf location stack",
		noremap = true,
		silent = true,
	},
	{
		"<leader>fxr",
		function()
			require("fzf-lua").registers()
		end,
		mode = { "n" },
		desc = "Fzf registers",
		noremap = true,
		silent = true,
	},
	{
		"<leader>fxs",
		function()
			require("fzf-lua").search_history()
		end,
		mode = { "n" },
		desc = "Fzf search history",
		noremap = true,
		silent = true,
	},
	{
		"<leader>fxt",
		function()
			require("fzf-lua").treesitter()
		end,
		mode = { "n" },
		desc = "Fzf treesitter symbols",
		noremap = true,
		silent = true,
	},
	-- fzf: neoclip
	{
		"<leader>fy",
		function()
			require("neoclip.fzf")()
		end,
		mode = { "n" },
		desc = "Yank history (neoclip)",
		noremap = true,
		silent = true,
	},
	-- grug-far
	{
		"<leader>fR",
		function()
			require("grug-far").open()
		end,
		mode = { "n" },
		desc = "Find & replace (grug-far)",
		noremap = true,
		silent = true,
	},
	{
		"<leader>fR",
		function()
			require("grug-far").with_visual_selection()
		end,
		mode = { "v" },
		desc = "Find & replace selection",
		noremap = true,
		silent = true,
	},
	-- KeyAnalyzer
	{
		"<leader>k",
		function()
			require("key-analyzer").show(
				vim.fn.input("Mode (n, i, v, s): "),
				vim.fn.input("Prefix (e.g. <leader>, <C-, etc.): ")
			)
		end,
		mode = { "n" },
		desc = "Key Analyzer",
		noremap = true,
		silent = true,
	},
	-- Treesitter
	{ "gnd", mode = "n", desc = "Treesitter: go to definition" },
	{ "gnD", mode = "n", desc = "Treesitter: list definitions" },
	{ "gnO", mode = "n", desc = "Treesitter: list definitions ToC" },
	{ "gnn", mode = "n", desc = "Treesitter: go to next usage" },
	{ "gnp", mode = "n", desc = "Treesitter: go to previous usage" },
	-- Trouble
	{
		"<leader>t<space>",
		"<cmd>Trouble<cr>",
		mode = { "n" },
		desc = "Trouble menu",
		noremap = true,
		silent = true,
	},
	{
		"<leader>tl",
		"<cmd>Trouble lsp toggle filter.buf=0<cr>",
		mode = { "n" },
		desc = "Toggle LSP (current buffer)",
		noremap = true,
		silent = true,
	},
	{
		"<leader>tL",
		"<cmd>Trouble lsp toggle<cr>",
		mode = { "n" },
		desc = "Toggle LSP",
		noremap = true,
		silent = true,
	},
	{
		"<leader>t<C-l>",
		"<cmd>Trouble loclist toggle<cr>",
		mode = { "n" },
		desc = "Toggle loclist",
		noremap = true,
		silent = true,
	},
	{
		"<leader>tq",
		"<cmd>Trouble qflist toggle<cr>",
		mode = { "n" },
		desc = "Toggle quickfix",
		noremap = true,
		silent = true,
	},
	{
		"<leader>ts",
		"<cmd>Trouble lsp_document_symbols toggle win.position=right<cr>",
		mode = { "n" },
		desc = "Toggle document symbols",
		noremap = true,
		silent = true,
	},
	{
		"<leader>td",
		"<cmd>Trouble lsp_definitions<cr>",
		mode = { "n" },
		desc = "Toggle definitions",
		noremap = true,
		silent = true,
	},
	{
		"<leader>tD",
		"<cmd>Trouble lsp_declarations<cr>",
		mode = { "n" },
		desc = "Toggle declarations",
		noremap = true,
		silent = true,
	},
	{
		"<leader>t<C-d>d",
		"<cmd>Trouble diagnostics toggle filter.buf=0<cr>",
		mode = { "n" },
		desc = "Toggle diagnostics (buffer)",
		noremap = true,
		silent = true,
	},
	{
		"<leader>t<C-d>D",
		"<cmd>Trouble diagnostics toggle<cr>",
		mode = { "n" },
		desc = "Toggle diagnostics (workspace)",
		noremap = true,
		silent = true,
	},
	{
		"<leader>ti",
		"<cmd>Trouble lsp_implementations<cr>",
		mode = { "n" },
		desc = "Toggle implementations",
		noremap = true,
		silent = true,
	},
	{
		"<leader>tr",
		"<cmd>Trouble lsp_references<cr>",
		mode = { "n" },
		desc = "Toggle references",
		noremap = true,
		silent = true,
	},
	-- Twilight
	{ "<A-t>", "<cmd>Twilight<cr>", mode = { "n", "i", "v", "s" }, desc = "Toggle Twilight" },
	-- mini.jump2d
	{ "<cr>", mode = { "n", "v" }, desc = "Jump within visible lines (mini.jump2d)", noremap = true, silent = true },
	-- mini.surround
	{ "sa", mode = { "n", "v" }, desc = "Surround: add (sa{motion}{char})" },
	{ "sd", mode = { "n" }, desc = "Surround: delete (sd{char})" },
	{ "sr", mode = { "n" }, desc = "Surround: replace (sr{old}{new})" },
	{ "sf", mode = { "n" }, desc = "Surround: find right" },
	{ "sF", mode = { "n" }, desc = "Surround: find left" },
	{ "sh", mode = { "n" }, desc = "Surround: highlight" },
	-- Fugitive
	{
		"<leader>G",
		"<cmd>Git<cr>",
		mode = { "n" },
		desc = "Git: fugitive status",
		noremap = true,
		silent = true,
	},
	{
		"<leader>Gd",
		"<cmd>Gdiffsplit<cr>",
		mode = { "n" },
		desc = "Git: diff split",
		noremap = true,
		silent = true,
	},
	{
		"<leader>Ge",
		"<cmd>Gedit<cr>",
		mode = { "n" },
		desc = "Git: open index version",
		noremap = true,
		silent = true,
	},
	{
		"<leader>Gl",
		"<cmd>Git log<cr>",
		mode = { "n" },
		desc = "Git: log",
		noremap = true,
		silent = true,
	},
	{
		"<leader>Gp",
		"<cmd>Git push<cr>",
		mode = { "n" },
		desc = "Git: push",
		noremap = true,
		silent = true,
	},
	{
		"<leader>GP",
		"<cmd>Git pull<cr>",
		mode = { "n" },
		desc = "Git: pull",
		noremap = true,
		silent = true,
	},
	-- Namu
	{
		"<leader>Ns",
		function()
			vim.cmd("Namu symbols")
		end,
		mode = { "n" },
		desc = "Namu: document symbols",
		noremap = true,
		silent = true,
	},
	{
		"<leader>Nw",
		function()
			vim.cmd("Namu workspace")
		end,
		mode = { "n" },
		desc = "Namu: workspace symbols",
		noremap = true,
		silent = true,
	},
	{
		"<leader>Nd",
		function()
			vim.cmd("Namu diagnostics")
		end,
		mode = { "n" },
		desc = "Namu: diagnostics (buffer)",
		noremap = true,
		silent = true,
	},
	{
		"<leader>ND",
		function()
			vim.cmd("Namu diagnostics workspace")
		end,
		mode = { "n" },
		desc = "Namu: diagnostics (workspace)",
		noremap = true,
		silent = true,
	},
	{
		"<leader>Nc",
		function()
			vim.cmd("Namu call in")
		end,
		mode = { "n" },
		desc = "Namu: incoming calls",
		noremap = true,
		silent = true,
	},
	{
		"<leader>NC",
		function()
			vim.cmd("Namu call out")
		end,
		mode = { "n" },
		desc = "Namu: outgoing calls",
		noremap = true,
		silent = true,
	},
	{
		"<leader>Nb",
		function()
			vim.cmd("Namu watchtower")
		end,
		mode = { "n" },
		desc = "Namu: symbols in all buffers",
		noremap = true,
		silent = true,
	},
	-- sniprun
	{
		"<leader>rr",
		function()
			require("sniprun").run()
		end,
		mode = { "n" },
		desc = "SnipRun: run line",
		noremap = true,
		silent = true,
	},
	{
		"<leader>rr",
		function()
			require("sniprun").run()
		end,
		mode = { "v" },
		desc = "SnipRun: run selection",
		noremap = true,
		silent = true,
	},
	{
		"<leader>rc",
		function()
			require("sniprun").close()
		end,
		mode = { "n" },
		desc = "SnipRun: close output",
		noremap = true,
		silent = true,
	},
	{
		"<leader>rR",
		function()
			require("sniprun").reset()
		end,
		mode = { "n" },
		desc = "SnipRun: reset",
		noremap = true,
		silent = true,
	},
	{
		"<leader>ri",
		function()
			require("sniprun").info()
		end,
		mode = { "n" },
		desc = "SnipRun: info",
		noremap = true,
		silent = true,
	},
	-- Overseer
	{
		"<leader>oo",
		"<cmd>OverseerToggle<cr>",
		mode = { "n" },
		desc = "Overseer: toggle panel",
		noremap = true,
		silent = true,
	},
	{
		"<leader>or",
		"<cmd>OverseerRun<cr>",
		mode = { "n" },
		desc = "Overseer: run task",
		noremap = true,
		silent = true,
	},
	{
		"<leader>oq",
		"<cmd>OverseerQuickAction<cr>",
		mode = { "n" },
		desc = "Overseer: quick action",
		noremap = true,
		silent = true,
	},
	{
		"<leader>oa",
		"<cmd>OverseerTaskAction<cr>",
		mode = { "n" },
		desc = "Overseer: task action",
		noremap = true,
		silent = true,
	},
	{
		"<leader>oc",
		"<cmd>OverseerClose<cr>",
		mode = { "n" },
		desc = "Overseer: close panel",
		noremap = true,
		silent = true,
	},
	-- Transparent
	{
		"<leader>b",
		"<cmd>TransparentToggle<cr>",
		mode = { "n" },
		desc = "Toggle transparency (background)",
		noremap = true,
		silent = true,
	},
})
