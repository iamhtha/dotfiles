return {
  {
    "ellisonleao/gruvbox.nvim",
    init = function()
      vim.o.background = "dark"
      vim.cmd([[colorscheme gruvbox]])
    end
  }
}
