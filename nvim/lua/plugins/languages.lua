-- Language-specific plugins.
-- All buffer-local keymaps are registered via FileType autocmds inside each
-- plugin's config so they never pollute global keymap space.

return {
  -- ─── Markdown ────────────────────────────────────────────────────────────────
  -- render-markdown: disabled by default; toggle with <leader>lr (buffer-local)
  {
    "MeanderingProgrammer/render-markdown.nvim",
    ft = { "markdown", "Avante" },
    opts = {
      enabled    = false, -- start disabled; user toggles per-buffer
      file_types = { "markdown", "Avante" },
    },
    config = function(_, opts)
      local rm = require("render-markdown")
      rm.setup(opts)

      vim.api.nvim_create_autocmd("FileType", {
        pattern = { "markdown", "Avante" },
        group   = vim.api.nvim_create_augroup("render-markdown-keys", { clear = true }),
        callback = function(ev)
          vim.keymap.set("n", "<leader>lr", function()
            rm.toggle()
          end, { buffer = ev.buf, desc = "Toggle render-markdown" })
        end,
      })
    end,
  },

  -- ─── LaTeX ───────────────────────────────────────────────────────────────────
  -- vimtex: full LaTeX suite
  {
    "lervag/vimtex",
    ft  = { "tex", "bib" },
    init = function()
      -- vimtex reads these before the plugin loads
      vim.g.vimtex_view_method        = "zathura"
      vim.g.vimtex_compiler_method    = "latexmk"
      vim.g.vimtex_quickfix_mode      = 0 -- don't auto-open quickfix
      vim.g.vimtex_mappings_enabled   = 1 -- keep vimtex's own keymaps
    end,
  },
  -- nabla.nvim: inline equation preview (disabled by default; toggle with <leader>lm)
  {
    "jbyuki/nabla.nvim",
    ft = { "tex", "markdown" },
    config = function()
      vim.api.nvim_create_autocmd("FileType", {
        pattern = { "tex", "markdown" },
        group   = vim.api.nvim_create_augroup("nabla-keys", { clear = true }),
        callback = function(ev)
          vim.keymap.set("n", "<leader>lm", function()
            require("nabla").toggle_virt()
          end, { buffer = ev.buf, desc = "Toggle nabla math preview" })
        end,
      })
    end,
  },

  -- ─── Go ──────────────────────────────────────────────────────────────────────
  -- go.nvim: extra Go tooling (struct tags, test generation, etc.)
  {
    "ray-x/go.nvim",
    ft           = { "go", "gomod", "gosum", "gowork" },
    dependencies = { "ray-x/guihua.lua" },
    build        = ':lua require("go.install").update_all_sync()',
    opts         = {},
    config = function(_, opts)
      require("go").setup(opts)

      -- Buffer-local keymaps for Go files
      vim.api.nvim_create_autocmd("FileType", {
        pattern = { "go" },
        group   = vim.api.nvim_create_augroup("go-nvim-keys", { clear = true }),
        callback = function(ev)
          local buf = ev.buf
          local map = function(lhs, rhs, desc)
            vim.keymap.set("n", lhs, rhs, { buffer = buf, noremap = true, silent = true, desc = desc })
          end

          -- Register which-key group for this buffer
          local ok, wk = pcall(require, "which-key")
          if ok then
            wk.add({ { "<leader>go", group = "go.nvim", buffer = buf } })
          end

          -- Run / Build / Vet
          map("<leader>gor", "<cmd>GoRun<cr>",      "Go: run package")
          map("<leader>gob", "<cmd>GoBuild<cr>",    "Go: build package")
          map("<leader>gov", "<cmd>GoVet<cr>",      "Go: vet")
          map("<leader>goi", "<cmd>GoImports<cr>",  "Go: organize imports")

          -- Test
          map("<leader>got", "<cmd>GoTest<cr>",      "Go: test package")
          map("<leader>goT", "<cmd>GoTestFile<cr>",  "Go: test file")
          map("<leader>gof", "<cmd>GoTestFunc<cr>",  "Go: test function under cursor")
          map("<leader>goc", "<cmd>GoCoverage<cr>",  "Go: coverage")

          -- Code generation / helpers
          map("<leader>goa", "<cmd>GoAddTag<cr>",    "Go: add struct tags")
          map("<leader>goR", "<cmd>GoRmTag<cr>",     "Go: remove struct tags")
          map("<leader>goe", "<cmd>GoIfErr<cr>",     "Go: generate if err")
          map("<leader>gos", "<cmd>GoFillStruct<cr>","Go: fill struct")
          map("<leader>goA", "<cmd>GoAlt!<cr>",      "Go: toggle test file")

          -- Module
          map("<leader>gom", "<cmd>GoModTidy<cr>",   "Go: mod tidy")
        end,
      })
    end,
  },
  -- TypeScript/JavaScript is handled by ts_ls via mason-lspconfig + lsp.lua
}
