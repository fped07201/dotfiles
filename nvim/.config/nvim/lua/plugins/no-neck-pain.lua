return {
  "shortcuts/no-neck-pain.nvim",
  version = "*",  -- use latest tagged release
  event = "VeryLazy", -- or "BufReadPre" if you want it earlier
  opts = {
    width = 150, -- width of the centered window
    minSideBufferWidth = 10,
    autocmds = {
      reloadOnColorSchemeChange = true,
      skipEnteringNoNeckPainBuffer = true,
    },
    buffers = {
      setNames = false,
      scratchPad = {
        enabled = true,
        location = "~/notes/", -- set to a valid path
      },
      backgroundColor = "catppuccin-frappe", -- set to your colorscheme name or "none"
      wo = {
        fillchars = "eob: ",
      },
    },
  },
  keys = {
    { "<leader>zn", "<cmd>NoNeckPain<CR>", desc = "Toggle NoNeckPain" },
    { "<leader>z+", "<cmd>NoNeckPainWidthUp<CR>", desc = "Increase center width" },
    { "<leader>z-", "<cmd>NoNeckPainWidthDown<CR>", desc = "Decrease center width" },
  },
}

