return {
  "mikavilpas/yazi.nvim",
  event = "VeryLazy",
  keys = {
    {
      "<leader>e",
      "<cmd>Yazi<cr>",
      desc = "Open yazi at the current file",
    },
    {
      "<leader>E",
      "<cmd>Yazi cwd<cr>",
      desc = "Open yazi at current working directory",
    },
  },
  opts = {
    -- Enable this if you want to open yazi instead of netrw
    open_for_directories = false,
    keymaps = {
      show_help = "<f1>",
    },
  },
}
