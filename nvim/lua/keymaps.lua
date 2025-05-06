local wk = require("which-key")
wk.add(
  {
    { "<leader>?", function() require("which-key").show() end, desc = "Buffer keymaps" },
    -- blink.cmp (basically default settings)
    { "<C-space>", mode = { "i" }, desc = "Show completion list or documentation or hide documentation" },
    { "<C-e>", mode = { "i" }, desc = "Hide completion list" },
    { "<Up>", mode = { "i" }, desc = "Select previous suggestion" },
    { "<C-p>", mode = { "i" }, desc = "Select previous suggestion" },
    { "<Down>", mode = { "i" }, desc = "Select next suggestion" },
    { "<C-n>", mode = { "i" }, desc = "Select next suggestion" },
    { "<C-b>", mode = { "i" }, desc = "Scroll documentation up" },
    { "<C-f>", mode = { "i" }, desc = "Scroll documentation down" },
    { "<Tab>", mode = { "i", "s" }, desc = "Snippet forward" },
    { "<S-Tab>", mode = { "i", "s" }, desc = "Snippet backwards" },
    { "<C-k>", mode = { "i", "s" }, desc = "Show signature" },
    { "<A-1>", mode = { "i", "s" }, desc = "Select 1st suggestion" },
    { "<A-2>", mode = { "i", "s" }, desc = "Select 2nd suggestion" },
    { "<A-3>", mode = { "i", "s" }, desc = "Select 3th suggestion" },
    { "<A-4>", mode = { "i", "s" }, desc = "Select 4th suggestion" },
    { "<A-5>", mode = { "i", "s" }, desc = "Select 5th suggestion" },
    { "<A-6>", mode = { "i", "s" }, desc = "Select 6th suggestion" },
    { "<A-7>", mode = { "i", "s" }, desc = "Select 7th suggestion" },
    { "<A-8>", mode = { "i", "s" }, desc = "Select 8th suggestion" },
    { "<A-9>", mode = { "i", "s" }, desc = "Select 9th suggestion" },
    { "<A-0>", mode = { "i", "s" }, desc = "Select 10th suggestion" },
    -- DAP
    { "<F5>", "<cmd>DapContinue<cr>", mode = { "n", "i", "v" }, desc = "Start/continue debug" },
    { "<F5>", function() require("dap-python").debug_selection() end, mode = { "s" }, desc = "Debug the code (Python)" },
    { "<C-F5>", function() require("dap").run_to_cursor() end, mode = { "n", "i", "v", "s" }, desc = "Run to cursor" },
    { "<S-F5>", "<cmd>DapTerminate<cr>", mode = { "n", "i", "v", "s" }, desc = "Stop debugger" },
    { "<C-S-F5>", function() require("dap").restart() end, mode = { "n", "i", "v", "s" }, desc = "Restart debugger" },
    { "<F9>", "<cmd>DapToggleBreakpoint<cr>", mode = { "n", "i", "v", "s" }, desc = "Toggle breakpoint" },
    { "<S-F9>", "<cmd>DapClearBreakPoints<cr>", mode = { "n", "i", "v", "s" }, desc = "Clear breakpoints" },
    { "<C-S-F9>", function() require("dap").set_breakpoint(vim.fn.input('Breakpoint condition: ')) end, mode = { "n", "i", "v", "s" }, desc = "Set conditional breakpoint" },
    { "<F10>", "<cmd>DapStepOver<cr>", mode = { "n", "i", "v", "s" }, desc = "Step over" },
    { "<F11>", "<cmd>DapSetpInto<cr>", mode = { "n", "i", "v", "s" }, desc = "Step into" },
    { "<S-F11>", "<cmd>DapStepOut<cr>", mode = { "n", "i", "v", "s" }, desc = "Step out" },
    { "<F12>", function() require("dap-python").test_method() end, mode = { "n", "i", "v", "s" }, desc = "Test method (Python)"},
    { "<S-F12>", function() require("dap-python").test_class() end, mode = { "n", "i", "v", "s" }, desc = "Test class (Python)"},
    { "dr", "<cmd>DapToggleRepl<cr>", mode = { "n" }, desc = "Toggle REPL" },
    { "dp", function() require("dap.ui.widgets").preview() end, mode = { "n" }, desc = "Preview in debug" },
    { "dK", function() require("dap.ui.widgets").hover() end, mode = { "n" }, desc = "Hover in debug" },
    -- DAP UI
    { "du", function() require("dapui").toggle() end, mode = { "n" }, desc = "Toggle REPL" },
    -- Treesitter
    { "gnd", desc = "Go to definition" },
    { "gnD", desc = "List definitions" },
    { "g0", desc = "List definitions ToC"},
    -- Twilight
    { "<A-t>", "<cmd>Twilight<cr>", mode = { "n", "i", "v", "s" }, desc = "Toggle Twilight"}
  }
  -- TODO: LSPCONFIG, NEOTEST, TROUBLE
)
