return {
  "WhoIsSethDaniel/mason-tool-installer.nvim",
  lazy = false,
  dependencies = { "williamboman/mason.nvim" },
  opts = {
    ensure_installed = {
      -- Formatters
      "stylua",
      "prettier",
      "shfmt",

      -- Linters
      "shellcheck",
      "eslint_d",
    },
    auto_update = false,
    run_on_start = true,
  },
}
