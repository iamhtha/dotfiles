HOME = os.getenv("HOME")

-- BASIC SETTINGS
-- UTF-8 encoding.
vim.opt.encoding = "utf-8"
-- Shorter update time -> less delay.
vim.opt.updatetime = 300
-- Command history of size 1000.
vim.opt.history = 1000
-- Always show the file title.
vim.opt.title = true
-- Avoid wrapping a line in the middle of the word.
vim.opt.linebreak = true
-- Enable line wrapping.
vim.opt.wrap = true
-- Allow spelling
vim.opt.spell = true
-- Spelling in English
vim.opt.spelllang = "en_us"
-- Enable 24-bit RGB in the TUI
vim.opt.termguicolors = true

-- INDENTATION
-- Automatic indentation.
vim.opt.autoindent = true
-- Width of tab is 4 characters.
vim.opt.tabstop = 4

-- LINES
-- Line numbers.
vim.opt.number = true
-- Line numbers relative to other lines.
vim.opt.relativenumber = true

-- RULER
-- Horizontal cursor.
vim.opt.cursorline = true
-- Vertical cursor.
vim.opt.cursorcolumn = true
-- Show cursor's current position.
vim.opt.ruler = true

-- MOUSE
vim.opt.mouse = "a"
vim.opt.mousemoveevent = true

-- SEARCH OPTIONS
-- Enable search highlighting.
vim.opt.hlsearch = true
-- Incremental search.
vim.opt.incsearch = true
-- Case insensitive search...
vim.opt.ignorecase = true
-- ... but only if all lowercase.
vim.opt.smartcase = true

-- LEADER MAPPING
vim.api.nvim_set_keymap("n", "<Space>", "", { noremap = true, silent = true })
vim.g.mapleader = " "

-- FILE SPECIFIC SETTINGS
vim.api.nvim_create_augroup("indentSettings", {clear = true})
vim.api.nvim_create_autocmd("FileType", {
    group = "indentSettings",
    pattern = {"rust", "python", "plaintex"},
    command = "set expandtab shiftwidth=4 tabstop=4 smarttab",
  }
)

vim.api.nvim_create_autocmd("FileType", {
    group = "indentSettings",
    pattern = {"c", "cpp", "lua", "bash", "zsh"},
    command = "set expandtab shiftwidth=2 tabstop=2 smarttab",
  }
)

-- PLUGINS
require("lazy").setup {
  spec = {
    { import = "plugins" },
  },
  install = { colorscheme = { "gruvbox" } },
  checker = { enabled = true },
}

-- Automatic update of plugins
local function augroup(name)
  return vim.api.nvim_create_augroup("lazyvim_" .. name, { clear = true })
end

vim.api.nvim_create_autocmd("VimEnter", {
    group = augroup("autoupdate"),
    callback = function()
        if require("lazy.status").has_updates then
            require("lazy").update({ show = false, })
        end
    end,
})
