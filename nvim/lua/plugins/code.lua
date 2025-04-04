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
    "folke/twilight.nvim",
   -- Don't forget to set up the keymapping! 
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
          },
          navigation = {
            enable = true,
            keymaps = {
              goto_definition = "gnd",
              list_definitions = "gnD",
              list_definitions_toc = "gO",
              goto_next_usage = "<a-*>",
              goto_previous_usage = "<a-#>",
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
        lua_ls = {
          on_init = function(client)
            if client.workspace_folders then
              local path = client.workspace_folders[1].name
              if path ~= vim.fn.stdpath("config") and (vim.loop.fs_stat(path.."/.luarc.json") or vim.loop.fs_stat(path.."/.luarc.jsonc")) then
                return
              end
            end

            client.config.settings.Lua = vim.tbl_deep_extend("force", client.config.settings.Lua, {
              runtime = {
                -- Tell the language server which version of Lua you're using
                -- (most likely LuaJIT in the case of Neovim)
                version = "LuaJIT"
              },
              -- Make the server aware of Neovim runtime files
              workspace = {
                checkThirdParty = false,
                library = {
                  vim.env.VIMRUNTIME
                  -- Depending on the usage, you might want to add additional paths here.
                  -- "${3rd}/luv/library"
                  -- "${3rd}/busted/library",
                }
                -- or pull in all of 'runtimepath'. NOTE: this is a lot slower and will cause issues when working on your own configuration (see https://github.com/neovim/nvim-lspconfig/issues/3189)
                -- library = vim.api.nvim_get_runtime_file("", true)
              }
            })
          end,
          settings = {
            Lua = {}
          }
        },
        pyright = {},
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
    dependencies = {
      "mfussenegger/nvim-dap",
      "theHamsta/nvim-dap-virtual-text",
      "nvim-neotest/nvim-nio",
    },
    config = function()
      require("nvim-dap-virtual-text").setup()
      vim.fn.sign_define('DapBreakpoint', {text='🛑', texthl='', linehl='', numhl=''})

    end,
    keys = {
      { "<F5>", "<CMD>DapContinue<CR>", mode = { "n", "i", "v", "s" }, desc = "Start/continue debug" },
      { "<C-F5>", "<CMD>lua require('dap').run_to_cursor()<CR>", mode = { "n", "i", "v", "s" }, desc = "Run to cursor" },
      { "<S-F5>", "<CMD>DapTerminate<CR>", mode = { "n", "i", "v", "s" }, desc = "Stop debugger" },
      { "<C-S-F5>", "<CMD>lua require('dap').restart()<CR>", mode = { "n", "i", "v", "s" }, desc = "Restart debugger" },
      { "<F9>", "<CMD>DapToggleBreakpoint<CR>", mode = { "n", "i", "v", "s" }, desc = "Toggle breakpoint" },
      { "<S-F9>", "<CMD>DapClearBreakPoints<CR>", mode = { "n", "i", "v", "s" }, desc = "Clear breakpoints" },
      { "<C-S-F9>", "<CMD>lua require('dap').set_breakpoint(vim.fn.input('Breakpoint condition: '))<CR>", mode = { "n", "i", "v", "s" }, desc = "Set conditional breakpoint" },
      { "<F10>", "<CMD>DapStepOver<CR>", mode = { "n", "i", "v", "s" }, desc = "Step over" },
      { "<F11>", "<CMD>DapSetpInto<CR>", mode = { "n", "i", "v", "s" }, desc = "Step into" },
      { "<S-F11>", "<CMD>DapStepOut<CR>", mode = { "n", "i", "v", "s" }, desc = "Step out" },
      { "dr", "<CMD>DapToggleRepl<CR>", mode = { "n", "i", "v", "s" }, desc = "Toggle REPL" },
      { "dp", "<CMD>lua require('dap.ui.widgets').preview()<CR>", mode = { "n", "i", "v", "s" }, desc = "Preview in debug" },
      { "dK", "<CMD>lua require('dap.ui.widgets').hover()<CR>", mode = { "n", "i", "v", "s" }, desc = "Hover in debug" },
    }
  },
  {
    "mfussenegger/nvim-dap-python",
    config = function()
      require("dap-python").setup("uv")
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
  "danymat/neogen",
}
