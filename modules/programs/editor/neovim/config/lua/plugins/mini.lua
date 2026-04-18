return {
  -- Better surround functionality
  {
    "echasnovski/mini.surround",
    lazy = false, -- Load immediately
    opts = {
      mappings = {
        add = "sa",
        delete = "sd",
        find = "sf",
        find_left = "sF",
        highlight = "sh",
        replace = "sr",
        update_n_lines = "sn",
      },
    },
  },

  -- Better pairs (auto-close brackets)
  {
    "echasnovski/mini.pairs",
    lazy = false, -- Load immediately
    opts = {},
  },

  -- Buffer remove
  {
    "echasnovski/mini.bufremove",
    keys = {
      {
        "<leader>bd",
        function()
          require("mini.bufremove").delete(0, false)
        end,
        desc = "Delete Buffer",
      },
      {
        "<leader>bD",
        function()
          require("mini.bufremove").delete(0, true)
        end,
        desc = "Delete Buffer (Force)",
      },
    },
  },

  -- AI completion (optional - uncomment if you want to use)
  -- {
  --   "echasnovski/mini.ai",
  --   event = "VeryLazy",
  --   opts = function()
  --     local ai = require("mini.ai")
  --     return {
  --       n_lines = 500,
  --       custom_textobjects = {
  --         o = ai.gen_spec.treesitter({
  --           a = { "@block.outer", "@conditional.outer", "@loop.outer" },
  --           i = { "@block.inner", "@conditional.inner", "@loop.inner" },
  --         }, {}),
  --         f = ai.gen_spec.treesitter({ a = "@function.outer", i = "@function.inner" }, {}),
  --         c = ai.gen_spec.treesitter({ a = "@class.outer", i = "@class.inner" }, {}),
  --       },
  --     }
  --   end,
  -- },
}
