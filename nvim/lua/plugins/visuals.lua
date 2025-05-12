return {
  {
    "ellisonleao/gruvbox.nvim",
    init = function()
      vim.o.background = "dark"
      vim.cmd([[colorscheme gruvbox]])
    end
  },
  {
    "nvim-lualine/lualine.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    opts = {
      sections = {
        lualine_c = { "filename", "lsp_status" }
      }
    },
  }
}
