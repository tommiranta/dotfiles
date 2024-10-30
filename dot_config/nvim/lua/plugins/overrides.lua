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

  -- file explorer
  {
    "nvim-neo-tree/neo-tree.nvim",
    keys = {
      { "-", "<leader>fE", desc = "Explorer NeoTree (cwd)", remap = true },
    },
    opts = {
      window = {
        position = "float",
      },
    },
  },
}
