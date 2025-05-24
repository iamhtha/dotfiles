return {
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
    "folke/twilight.nvim",
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
          navigation = {
            enable = true,
            keymaps = {
              goto_definition = "gnd",
              list_definitions = "gnD",
              list_definitions_toc = "gnO",
              goto_next_usage = "gnn",
              goto_previous_usage = "gnp",
            }
          }
        },
      }
    end
  },
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
      ls.setup {
        update_events = { "TextChanged", "TextChangedI" },
      }
    end
  },
  {
    "saghen/blink.cmp",
    version = "*",
    opts = {
      keymap = {
        preset = "default",
        ["<A-1>"] = { function(cmp) cmp.accept({ index = 1 }) end },
        ["<A-2>"] = { function(cmp) cmp.accept({ index = 2 }) end },
        ["<A-3>"] = { function(cmp) cmp.accept({ index = 3 }) end },
        ["<A-4>"] = { function(cmp) cmp.accept({ index = 4 }) end },
        ["<A-5>"] = { function(cmp) cmp.accept({ index = 5 }) end },
        ["<A-6>"] = { function(cmp) cmp.accept({ index = 6 }) end },
        ["<A-7>"] = { function(cmp) cmp.accept({ index = 7 }) end },
        ["<A-8>"] = { function(cmp) cmp.accept({ index = 8 }) end },
        ["<A-9>"] = { function(cmp) cmp.accept({ index = 9 }) end },
        ["<A-0>"] = { function(cmp) cmp.accept({ index = 10 }) end },
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
        }
      },
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
        "taplo",
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
        "codespell",
        "commitlint",
        "mypy",
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
        -- Shamelessly copied from https://github.com/neovim/nvim-lspconfig/blob/master/doc/configs.md#lua_ls
        lua_ls = {
          on_init = function(client)
            if client.workspace_folders then
              local path = client.workspace_folders[1].name
              if path ~= vim.fn.stdpath("config") and (vim.loop.fs_stat(path .. "/.luarc.json") or vim.loop.fs_stat(path .. "/.luarc.jsonc")) then
                return
              end
            end

            client.config.settings.Lua = vim.tbl_deep_extend("force", client.config.settings.Lua, {
              runtime = {
                version = "LuaJIT"
              },
              workspace = {
                checkThirdParty = false,
                library = {
                  vim.env.VIMRUNTIME
                }
              }
            })
          end,
          settings = {
            Lua = {}
          }
        },
        pyright = {},
        -- Shamelessly copied from https://docs.astral.sh/ruff/editors/setup/#neovim
        ruff = {
          settings = {
            vim.api.nvim_create_autocmd("LspAttach", {
              group = vim.api.nvim_create_augroup("lsp_attach_disable_ruff_hover", { clear = true }),
              callback = function(args)
                local client = vim.lsp.get_client_by_id(args.data.client_id)
                if client == nil then
                  return
                end
                if client.name == "ruff" then
                  -- Disable hover in favor of Pyright
                  client.server_capabilities.hoverProvider = false
                end
              end,
              desc = "LSP: Disable hover capability from Ruff",
            })
          }
        },
        rust_analyzer = {},
        taplo = {},
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
    "mfussenegger/nvim-dap",
    config = function()
      local dap = require("dap")
      -- CodeLLDB adapter
      dap.adapters.codelldb = {
        type = "executable",
        command = "codelldb",
      }
      -- Settings for C/C++/Rust
      dap.configurations.cpp = {
        {
          name = "Launch file",
          type = "codelldb",
          request = "launch",
          program = function()
            return vim.fn.input('Path to executable: ', vim.fn.getcwd() .. '/', 'file')
          end,
          cwd = '${workspaceFolder}',
          stopOnEntry = false,
        },
      }
      dap.configurations.c = dap.configurations.cpp
      dap.configurations.rust = dap.configurations.cpp
    end
  },
  {
    "rcarriga/nvim-dap-ui",
    dependencies = {
      "theHamsta/nvim-dap-virtual-text",
      "nvim-neotest/nvim-nio",
      "folke/lazydev.nvim",
    },
    config = function()
      -- Setup dependencies first
      require("nvim-dap-virtual-text").setup()
      vim.fn.sign_define("DapBreakpoint", { text = "🛑", texthl = "", linehl = "", numhl = "" })
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
    config = function()
      local dappy = require("dap-python")
      dappy.setup("uv")
      dappy.test_runner = "pytest"
    end
  },
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
          null_ls.builtins.diagnostics.mypy,
          null_ls.builtins.formatting.clang_format,
        }
      })
    end
  },
  {
    "danymat/neogen",
    config = function()
      require("neogen").setup {
        enabled = true,
        snippet_engine = "luasnip",
        languages = {
          ["c.doxygen"] = require("neogen.configurations.c"),
          ["cpp.doxygen"] = require("neogen.configurations.cpp"),
          ["google_docstring"] = require("neogen.configurations.python"),
        }
      }
    end
  },
  {
    "folke/trouble.nvim",
    opts = {
      win = {
        relative = "editor"
      }
    }
  },
  {
    "michaelb/sniprun",
  },
  {
    "stevearc/overseer.nvim",
  }
}
