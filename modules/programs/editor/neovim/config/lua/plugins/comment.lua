return {
  "numToStr/Comment.nvim",
  event = { "BufReadPre", "BufNewFile" },
  dependencies = {
    "JoosepAlviste/nvim-ts-context-commentstring",
  },
  config = function()
    -- Try to integrate with treesitter context commentstring if available
    local ok, ts_context = pcall(require, "ts_context_commentstring.integrations.comment_nvim")

    require("Comment").setup({
      pre_hook = ok and ts_context.create_pre_hook() or nil,
    })
  end,
}
