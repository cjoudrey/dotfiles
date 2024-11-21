return {
  "vim-test/vim-test",
  keys = {
    { "<leader>tt", "<cmd>TestFile<cr>", desc = "Run tests in file" },
    { "<leader>tr", "<cmd>TestNearest<cr>", desc = "Run nearest test" },
    { "<leader>tl", "<cmd>TestLast<cr>", desc = "Run last test" },
  },
}
