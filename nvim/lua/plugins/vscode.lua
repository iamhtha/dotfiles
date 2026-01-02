if vim.g.vscode then
  return {
    {
      "ellisonleao/gruvbox.nvim",
      init = function()
        vim.o.background = "dark"
        vim.cmd([[colorscheme gruvbox]])
      end
    },
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
  }
else
  return {}
end
