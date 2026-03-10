return {
  {
    "lewis6991/gitsigns.nvim",
    opts = {
      signs = {
        add          = { text = "+" },
        change       = { text = "~" },
        delete       = { text = "_" },
        topdelete    = { text = "_" },
        changedelete = { text = "~" },
        untracked    = { text = "+" },
      },
      on_attach = function(buf)
        local gs = require("gitsigns")
        local map = function(mode, lhs, rhs, desc)
          vim.keymap.set(mode, lhs, rhs, { buffer = buf, noremap = true, silent = true, desc = desc })
        end

        -- Navigation
        map("n", "]g", function()
          if vim.wo.diff then
            vim.cmd.normal({ "]c", bang = true })
          else
            gs.nav_hunk("next")
          end
        end, "Gitsigns: next hunk")
        map("n", "[g", function()
          if vim.wo.diff then
            vim.cmd.normal({ "[c", bang = true })
          else
            gs.nav_hunk("prev")
          end
        end, "Gitsigns: previous hunk")

        -- Hunk actions
        map("n", "<leader>gs", gs.stage_hunk,   "Gitsigns: stage hunk")
        map("n", "<leader>gr", gs.reset_hunk,   "Gitsigns: reset hunk")
        map("v", "<leader>gs", function() gs.stage_hunk({ vim.fn.line("."), vim.fn.line("v") }) end, "Gitsigns: stage hunk (visual)")
        map("v", "<leader>gr", function() gs.reset_hunk({ vim.fn.line("."), vim.fn.line("v") }) end, "Gitsigns: reset hunk (visual)")
        map("n", "<leader>gS", gs.stage_buffer,       "Gitsigns: stage buffer")
        map("n", "<leader>gR", gs.reset_buffer,       "Gitsigns: reset buffer")
        map("n", "<leader>gu", gs.undo_stage_hunk,    "Gitsigns: undo stage hunk")
        map("n", "<leader>gp", gs.preview_hunk,       "Gitsigns: preview hunk")
        map("n", "<leader>gb", function() gs.blame_line({ full = true }) end, "Gitsigns: blame line")
        map("n", "<leader>gB", gs.blame,              "Gitsigns: blame buffer")
        map("n", "<leader>gd", gs.diffthis,           "Gitsigns: diff this")
        map("n", "<leader>gD", function() gs.diffthis("~") end, "Gitsigns: diff this ~")
        map("n", "<leader>gt", gs.toggle_deleted,     "Gitsigns: toggle deleted")

        -- Text object
        map({ "o", "x" }, "ih", gs.select_hunk, "Gitsigns: select hunk (text obj)")
      end,
    },
  },
  {
    "tpope/vim-fugitive",
  },
}
