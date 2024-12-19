return {
  {
    "hrsh7th/nvim-cmp",
    opts = function(_, opts)
      local cmp = require("cmp")
      opts.mapping = vim.tbl_extend("force", opts.mapping, {
        ["<Tab>"] = cmp.mapping.confirm({ select = true }),
        --["<CR>"] = cmp.mapping.confirm({ select = false }),
      })

      opts.mapping["<CR>"] = nil
    end,
  },
}
