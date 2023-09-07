return {
  "stevearc/overseer.nvim",
  lazy = false,
  config = function()
    require("overseer").setup({
      -- open_mapping = [[<c-\>]],
      strategy = "toggleterm",
    })
  end,
 }
