return {
  -- HCL formatter
  {
    "stevearc/conform.nvim",
    opts = {
      formatters_by_ft = {
        hcl = { "terraform_fmt" },
      },
    },
  },
}
