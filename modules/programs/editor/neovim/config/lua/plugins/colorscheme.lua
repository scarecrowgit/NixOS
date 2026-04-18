return {
  -- Ghostty custom theme (matches your terminal colors)
  {
    "ghostty-theme",
    dir = vim.fn.stdpath("config") .. "/lua/ghostty-theme",
    lazy = false,
    priority = 1000,
    config = function()
      vim.cmd.colorscheme("ghostty")
    end,
  },

  -- Catppuccin theme (optional alternative)
  {
    "catppuccin/nvim",
    name = "catppuccin",
    lazy = true,
    priority = 999,
    opts = {
      flavour = "mocha", -- latte, frappe, macchiato, mocha
      transparent_background = false,
      term_colors = true,
      integrations = {
        cmp = true,
        gitsigns = true,
        nvimtree = true,
        telescope = true,
        treesitter = true,
        notify = true,
        mini = true,
      },
    },
  },

  -- Tokyo Night theme (optional alternative)
  {
    "folke/tokyonight.nvim",
    lazy = true,
    priority = 999,
    opts = {
      style = "night", -- storm, moon, night, day
      transparent = false,
      terminal_colors = true,
      styles = {
        comments = { italic = true },
        keywords = { italic = true },
        functions = {},
        variables = {},
      },
    },
  },
}
