return {
  -- Insert a [YYYY-MM-DD HH:MM:SS] timestamp with <leader>dt.
  {
    "AntonVanAssche/date-time-inserter.nvim",
    version = "*",
    cmd = { "InsertDate", "InsertTime", "InsertDateTime" },
    opts = {
      date_format = "%Y-%m-%d",
      time_format = "%H:%M:%S",
      date_time_separator = " ",
    },
    keys = {
      {
        "<leader>dt",
        function()
          vim.api.nvim_put({ "[" .. vim.fn.strftime("%Y-%m-%d %H:%M:%S") .. "]" }, "c", true, true)
        end,
        desc = "Insert datetime",
      },
    },
  },

  -- :StartupTime to profile startup.
  { "dstein64/vim-startuptime", cmd = "StartupTime" },
}
