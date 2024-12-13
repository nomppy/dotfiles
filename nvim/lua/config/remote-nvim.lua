require("remote-nvim").setup({
  -- Configuration for SSH connections
  ssh_config = {
    ssh_binary = "ssh", -- Binary to use for running SSH command
    scp_binary = "scp", -- Binary to use for running SSH copy commands
    ssh_config_file_paths = { "$HOME/.ssh/config" }, -- Which files should be considered to contain the ssh host configurations. NOTE: `Include` is respected in the provided files.

    -- These are useful for password-based SSH authentication.
    -- It provides parsing pattern for the plugin to detect that an input is requested.
    -- Each element contains the following attributes:
    -- match - The string to match (plain matching is done)
    -- type - Supports two values "plain"|"secret". Secret means when you provide the value, it should not be stored in the completion history of Neovim.
    -- value - Default value for the prompt
    -- value_type - "static"|"dynamic". For things like password, it would be needed for each new connection that the plugin initiates which could be obtrusive.
    -- So, we save the value (only for current session's interval) to ease the process. If set to "dynamic", we do not save the value even for the session. You have to provide a fresh value each time.
    ssh_prompts = {
      {
        match = "Password:",
        type = "secret",
        value_type = "static",
        value = "",
      },
      {
        match = "continue connecting (yes/no/[fingerprint])?",
        type = "plain",
        value_type = "static",
        value = "",
      },
      {
        match = "Duo two-factor",
        type = "plain",
        value_type = "dynamic",
        value = "",
      },
      -- There are other values here which can be checked in lua/remote-nvim/init.lua
    },
  },
    -- client_callback = function(port, workspace_config)
    --   local cmd = ("wezterm cli set-tab-title --pane-id $(wezterm cli spawn nvim --server localhost:%s --remote-ui) %s"):format(
    --     port,
    --     ("'Remote: %s'"):format(workspace_config.host)
    --   )
    --   if vim.env.TERM == "xterm-kitty" then
    --     cmd = ("kitty -e nvim --server localhost:%s --remote-ui"):format(port)
    --   end
    --   vim.fn.jobstart(cmd, {
    --     detach = true,
    --     on_exit = function(job_id, exit_code, event_type)
    --       -- This function will be called when the job exits
    --       print("Client", job_id, "exited with code", exit_code, "Event type:", event_type)
    --     end,
    --   })
    -- end,
})
