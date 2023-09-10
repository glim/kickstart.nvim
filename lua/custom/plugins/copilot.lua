local cmp = require'cmp'

-- cmp.setup({
--   mapping = cmp.mapping.preset.insert({
--     ['<CR>'] = cmp.mapping.confirm({ select = false }),
--   })
-- })

local function _tab_complete()
  if cmp.visible() then
    cmp.select_next_item()
  else
    require("copilot.suggestion").accept()
  end
end

vim.keymap.set('i', '<Tab>', _tab_complete,{})

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
          -- accept = "<CR>",
        }
      }

    })
  end,

  init = function()
  end,


}
