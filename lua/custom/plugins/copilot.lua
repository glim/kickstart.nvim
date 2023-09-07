local cmp = require'cmp'

cmp.setup({
  mapping = cmp.mapping.preset.insert({
    ['<CR>'] = cmp.mapping.confirm({ select = false }),
  })
})

return {
  "zbirenbaum/copilot.lua",
  -- event = { "InsertEnter" },
  -- cmd = { "Copilot" },
  cmd = "Copilot",
  event = "InsertEnter",
  config = function()
    require("copilot").setup({
      suggestion = {
        enabled = true,
        auto_trigger = true,
        debounce = 75,
        keymap = {
          accept = "<C-CR>",
        }
      }

    })
  end,

  init = function()
  end,


}
