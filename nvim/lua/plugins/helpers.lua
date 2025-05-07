return {
  {
    "max397574/better-escape.nvim",
    opts = {
      timeout = vim.o.timeoutlen,
    }
  },
  {
    "folke/which-key.nvim",
    event = "VeryLazy",
    opts = {},
  },
  {
    "meznaric/key-analyzer.nvim",
    opts = {},
  },
  {
    "AckslD/nvim-neoclip.lua",
  },
  {
    "ibhagwan/fzf-lua",
    dependencies = { "echasnovski/mini.icons" },
    opts = {
      "fzf-native",
      keymap = {
        fzf = {
          true,
          ["ctrl-h"] = "abort",
          ["ctrl-j"] = "down",
          ["ctrl-k"] = "up",
          ["ctrl-l"] = "accept",
        }
      }
    },
  },
  {
    "bassamsdata/namu.nvim",
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
  {
    "MagicDuck/grug-far.nvim",
  }
}
