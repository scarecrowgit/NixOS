return {
  "windwp/nvim-autopairs",
  event = "InsertEnter",
  opts = {
    check_ts = true,
    ts_config = {
      lua = { "string" },
      javascript = { "template_string" },
    },
  },
  config = function(_, opts)
    local autopairs = require("nvim-autopairs")
    autopairs.setup(opts)

    -- Integration with nvim-cmp (if available)
    local ok_cmp, cmp = pcall(require, "cmp")
    if ok_cmp then
      local ok_autopairs, cmp_autopairs = pcall(require, "nvim-autopairs.completion.cmp")
      if ok_autopairs then
        cmp.event:on("confirm_done", cmp_autopairs.on_confirm_done())
      end
    end
  end,
}
