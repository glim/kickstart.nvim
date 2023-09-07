vim.o.sessionoptions="blank,buffers,curdir,folds,help,tabpages,winsize,winpos,localoptions"

return {
  "rmagatti/auto-session",
  lazy = false,
  dependencies = {"stevearc/overseer.nvim","nvim-neo-tree/neo-tree.nvim"},
  config = function()
    -- Convert the cwd to a simple file name
    local function get_cwd_as_name()
      local dir = vim.fn.getcwd(0)
      return dir:gsub("[^A-Za-z0-9]", "_")
    end

    local overseer = require("overseer")

    local neotree = require('neo-tree.command')

    require("auto-session").setup({
      log_level = "error",
      auto_session_suppress_dirs = { "~/", "~/Documents", "~/code", "~/Downloads", "/" },
      pre_save_cmds = {
        function()
          overseer.save_task_bundle(
            get_cwd_as_name(),
            -- Passing nil will use config.opts.save_task_opts. You can call list_tasks() explicitly and
            -- pass in the results if you want to save specific tasks.
            nil,
            { on_conflict = "overwrite" } -- Overwrite existing bundle, if any
          )
          neotree.execute({ action = "close" })
        end,
      },
      -- Optionally get rid of all previous tasks when restoring a session
      pre_restore_cmds = {
        function()
          for _, task in ipairs(overseer.list_tasks({})) do
            task:dispose(true)
          end
        end
      },
      post_restore_cmds = {
        function()
          overseer.load_task_bundle(get_cwd_as_name(), { ignore_missing = true })
          neotree.execute({ action = "show", reveal = true })
        end,
      },
    })
  end,
}
