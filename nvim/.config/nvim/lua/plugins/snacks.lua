-- lazy.nvim
return {
  "folke/snacks.nvim",
  ---@type snacks.Config
  keys = {
    { "<leader>e", false },
    { "<leader>E", false },
    {
      "<leader>sf",
      function()
        Snacks.picker.files()
      end,
    },
    {
      "<C-p>",
      function()
        Snacks.explorer()
      end,
    },
  },
}
