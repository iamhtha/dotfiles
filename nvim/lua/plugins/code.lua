return {
  {
    "echasnovski/mini.comment",
    version = false,
    opts = {},
  },
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
  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    dependencies = {
      "nvim-treesitter/nvim-treesitter-refactor",
      "nvim-treesitter/nvim-treesitter-context",
    },
    config = function()
      require("nvim-treesitter.configs").setup {
        ensure_installed = { "c", "cpp", "lua", "python", "rust" },
        refactor = {
          highlight_definition = { enable = true },
          highlight_current_scope = { enable = true },
          smart_rename = {
            enable = true,
            keymaps = {
              smart_rename = "grr"
            }
          }
        }
      }
    end
  },
  {
    "folke/twilight.nvim",
   -- Don't forget to set up the keymapping! 
    opts = {},
  },
  {
    "L3MON4D3/LuaSnip",
    version = "v2.*",
    build = "make install_jsregexp",
    dependencies = {
      "rafamadriz/friendly-snippets",
    },
    config = function()
      require("luasnip.loaders.from_vscode").lazy_load()
    end
  },
  {
    "saghen/blink.cmp",
    version = "*",
    opts = {
      keymap = { preset = "default" },
      appearance = { nerd_font_variant = "mono" },
      snippets = { preset = "luasnip" },
      signature = { enabled = true },
      fuzzy = { implementation = "prefer_rust_with_warning"}
    },
  },
  {
    "williamboman/mason.nvim",
    opts = {},
  },
  {
    "williamboman/mason-lspconfig.nvim",
    opts = {
      ensure_installed = {
        "clangd",
        "lua_ls",
        "pyright",
        "ruff",
        "rust_analyzer",
        "typos_lsp",
      },
    },
  },
  {
    "jay-babu/mason-nvim-dap.nvim",
    opts = {
      ensure_installed = {
        "python",
        "codelldb",
      }
    },
  },
  {
    "jay-babu/mason-null-ls.nvim",
    opts = {
      ensure_installed = {
        -- LINTERS
        "ruff",
        "mypy",
        "selene",
        -- FORMATTERS
        "clang-format",
      },
    },
  },
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        clangd = {},
        lua_ls = {},
        pyright = {},
        ruff = {},
        rust_analyzer = {},
        typos_lsp = {},
      },
    },
    config = function(_, opts)
      local lspconfig = require("lspconfig")
      for server, config in pairs(opts.servers) do
        config.capabilities = require("blink.cmp").get_lsp_capabilities(config.capabilities)
        lspconfig[server].setup(config)
      end
    end
  },
  {
    "rcarriga/nvim-dap-ui",
    dependencies = {"mfussenegger/nvim-dap", "nvim-neotest/nvim-nio"},
  },
  "nvimtools/none-ls.nvim",
  "danymat/neogen",
}
