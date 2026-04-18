return {
  "folke/which-key.nvim",
  lazy = false, -- Load immediately so leader key works
  priority = 100,
  opts = {
    preset = "modern",
    plugins = {
      spelling = {
        enabled = true,
      },
    },
    spec = {
      { "<leader>b", group = "buffer" },
      { "<leader>c", group = "code" },
      { "<leader>f", group = "file/find" },
      { "<leader>g", group = "git" },
      { "<leader>gh", group = "hunks" },
      { "<leader>q", group = "quit/session" },
      { "<leader>s", group = "search" },
      { "<leader>sn", group = "noice" },
      { "<leader>t", group = "terminal" },
      { "<leader>u", group = "ui" },
      { "<leader>w", group = "windows" },
      { "<leader>x", group = "diagnostics/quickfix" },
      { "<leader><tab>", group = "tabs" },
      { "[", group = "prev" },
      { "]", group = "next" },
      { "g", group = "goto" },
      { "gs", group = "surround" },
    },
  },
}
