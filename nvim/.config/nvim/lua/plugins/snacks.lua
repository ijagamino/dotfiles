-- lazy.nvim
return {
  "folke/snacks.nvim",
  ---@type snacks.Config
  keys = {
    { "<leader>e", false },
    { "<leader>E", false },
    {
      "<C-p>",
      function()
        Snacks.explorer()
      end,
    },
  },
}
