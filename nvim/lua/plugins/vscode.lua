if vim.g.vscode then
	local vscode = require("vscode")

	-- Helper: create a function that fires a VSCode command.
	local function a(cmd, args)
		return function()
			vscode.action(cmd, args)
		end
	end

	-- Helper: set a keymap with noremap + silent.
	local function map(mode, lhs, rhs, desc)
		vim.keymap.set(mode, lhs, rhs, { noremap = true, silent = true, desc = desc })
	end

	-- LSP
	map("n", "gD", a("editor.action.revealDeclaration"), "Go to declaration")
	map("n", "grt", a("editor.action.goToTypeDefinition"), "Go to type definition")
	map("n", "grs", a("workbench.action.gotoSymbol"), "Document symbols")
	map("n", "grf", a("editor.action.formatDocument"), "Format document")
	map("x", "grf", a("editor.action.formatSelection"), "Format selection")

	-- Diagnostics
	map("n", "]d", a("editor.action.marker.next"), "Next diagnostic")
	map("n", "[d", a("editor.action.marker.prev"), "Previous diagnostic")
	map("n", "]D", a("editor.action.marker.nextInFiles"), "Next diagnostic (across files)")
	map("n", "[D", a("editor.action.marker.prevInFiles"), "Previous diagnostic (across files)")

	-- Git hunk navigation
	map("n", "]g", a("workbench.action.editor.nextChange"), "Next git hunk")
	map("n", "[g", a("workbench.action.editor.previousChange"), "Previous git hunk")

	-- Git ops
	map("n", "<leader>G", a("workbench.view.scm"), "Git: open SCM panel")
	map("n", "<leader>Gp", a("git.push"), "Git: push")
	map("n", "<leader>GP", a("git.pull"), "Git: pull")
	map("n", "<leader>Gd", a("git.openChange"), "Git: open diff")
	map({ "n", "v" }, "<leader>gs", a("git.stageSelectedRanges"), "Git: stage hunk/selection")
	map({ "n", "v" }, "<leader>gr", a("git.revertSelectedRanges"), "Git: revert hunk/selection")
	map("n", "<leader>gS", a("git.stageAll"), "Git: stage all")
	map("n", "<leader>gR", a("git.revertFile"), "Git: revert file")
	map("n", "<leader>gu", a("git.unstageSelectedRanges"), "Git: unstage hunk")
	map("n", "<leader>gd", a("git.openChange"), "Git: diff this")

	-- Tab: accept inline suggestion
	map("n", "<Tab>", a("editor.action.inlineSuggest.commit"), "Accept inline suggestion")

	-- AI
	map("n", "<leader>it", a("workbench.action.chat.open"), "AI: toggle chat")
	map({ "n", "v" }, "<leader>ia", a("workbench.action.chat.open"), "AI: ask")

	-- Files (fzf-lua)
	map("n", "<leader>ff", a("workbench.action.quickOpen"), "Quick open file")
	map("n", "<leader>fb", a("workbench.action.showAllEditors"), "All open editors (buffers)")
	map("n", "<leader>fh", a("workbench.action.openRecent"), "Recent files")
	map("n", "<leader>fl", a("workbench.action.findInFiles"), "Find in files (live grep)")
	map("n", "<leader>fR", a("workbench.action.replaceInFiles"), "Find & replace in files")
	map("v", "<leader>fR", a("workbench.action.replaceInFiles"), "Find & replace selection")
	map("n", "<leader>fT", a("workbench.action.showAllEditorsByMostRecentlyUsed"), "Editors by recent use (tabs)")
	map("n", "<leader>fq", a("workbench.actions.view.problems"), "Problems panel (quickfix)")

	-- LSP pickers (fzf-lua)
	map("n", "<leader>fdr", a("editor.action.referenceSearch.trigger"), "References")
	map("n", "<leader>fdd", a("editor.action.revealDefinition"), "Definition")
	map("n", "<leader>fdD", a("editor.action.revealDeclaration"), "Declaration")
	map("n", "<leader>fdt", a("editor.action.goToTypeDefinition"), "Type definition")
	map("n", "<leader>fdi", a("editor.action.goToImplementation"), "Implementations")
	map("n", "<leader>fds", a("workbench.action.gotoSymbol"), "Document symbols")
	map("n", "<leader>fdS", a("workbench.action.showAllSymbols"), "Workspace symbols")
	map("n", "<leader>fdc", a("references-view.showCallHierarchy"), "Incoming calls (call hierarchy)")
	map("n", "<leader>fdC", a("references-view.showCallHierarchy"), "Outgoing calls (call hierarchy)")
	map("n", "<leader>fda", a("editor.action.quickFix"), "Code actions")
	map("n", "<leader>fdf", a("editor.action.referenceSearch.trigger"), "LSP finder (references)")
	map("n", "<leader>fd<C-d>", a("workbench.actions.view.problems"), "Document diagnostics")
	map("n", "<leader>fd<C-w>", a("workbench.actions.view.problems"), "Workspace diagnostics")

	-- Search (fzf-lua)
	map("n", "<leader>fsw", function()
		vscode.action("workbench.action.findInFiles", { args = { query = vim.fn.expand("<cword>") } })
	end, "Search word under cursor")
	map("n", "<leader>fsW", function()
		vscode.action("workbench.action.findInFiles", { args = { query = vim.fn.expand("<cWORD>") } })
	end, "Search WORD under cursor")
	map("n", "<leader>fsb", a("actions.find"), "Find in current file")
	map("n", "<leader>fsg", a("workbench.action.findInFiles"), "Grep project")

	-- Git pickers (fzf-lua)
	map("n", "<leader>fgs", a("workbench.view.scm"), "Git status (SCM panel)")
	map("n", "<leader>fgb", a("git.checkout"), "Git branches (checkout)")
	map("n", "<leader>fgf", a("workbench.action.quickOpen"), "Git files (quick open)")

	-- Problems (Trouble replacement)
	map("n", "<leader>t<C-d>d", a("workbench.actions.view.problems"), "Diagnostics (buffer)")
	map("n", "<leader>t<C-d>D", a("workbench.actions.view.problems"), "Diagnostics (workspace)")
	map("n", "<leader>tq", a("workbench.actions.view.problems"), "Quickfix (problems)")
	map("n", "<leader>ts", a("workbench.action.gotoSymbol"), "Document symbols")
	map("n", "<leader>tr", a("editor.action.referenceSearch.trigger"), "References")
	map("n", "<leader>ti", a("editor.action.goToImplementation"), "Implementations")
	map("n", "<leader>td", a("editor.action.revealDefinition"), "Definitions")
	map("n", "<leader>tD", a("editor.action.revealDeclaration"), "Declarations")
	map("n", "<leader>tl", a("workbench.action.gotoSymbol"), "LSP (buffer symbols)")
	map("n", "<leader>tL", a("workbench.action.showAllSymbols"), "LSP (workspace symbols)")

	-- Run
	map({ "n", "v" }, "<leader>rr", a("workbench.action.terminal.runSelectedText"), "Run in terminal")

	-- Debug panel
	map("n", "du", a("workbench.view.debug"), "Toggle debug panel")

	return {
		-- mini.jump / mini.jump2d: enhanced f/t motions and 2D jump (<cr>)
		{
			"echasnovski/mini.jump",
			version = false,
			opts = {},
		},
		{
			"echasnovski/mini.jump2d",
			version = false,
			opts = {},
		},
		-- mini.surround: add/delete/replace surroundings (sa/sd/sr/sf/sF/sh)
		{
			"echasnovski/mini.surround",
			version = false,
			opts = {},
		},
	}
else
	return {}
end
