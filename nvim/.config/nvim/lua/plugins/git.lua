return {
  {
    "kdheepak/lazygit.nvim",
    enabled = false, -- 關掉 lazygit
  },

{
  "NeogitOrg/neogit",
  dependencies = {
    "nvim-lua/plenary.nvim",         -- required
    "sindrets/diffview.nvim",        -- optional - Diff integration

    -- Only one of these is needed.
    "nvim-telescope/telescope.nvim", -- optional
   },
  config = function()
    local neogit = require("neogit")
    neogit.setup {
      integrations = { diffview = true },
    }

    local map = vim.keymap.set
    map("n", "<leader>gg", "<cmd>Neogit<cr>", { desc = "Open Neogit" })
    map("n", "<leader>gG", "<cmd>Neogit cwd=%:p:h<cr>", { desc = "Neogit (repo of current file)" })
    map("n", "<leader>gc", "<cmd>Neogit commit<cr>", { desc = "Neogit commit popup" })
    map("n", "<leader>gp", "<cmd>Neogit kind=push<cr>", { desc = "Neogit push popup" })
    map("n", "<leader>gl", "<cmd>Neogit kind=log<cr>", { desc = "Neogit log popup" })
  end,
 }
}
