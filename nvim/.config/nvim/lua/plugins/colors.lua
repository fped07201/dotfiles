-- plugins/colors.lua
return {
  {
    "norcalli/nvim-colorizer.lua",
    config = function()
      require("colorizer").setup(
        { "*" },      -- apply to all filetypes
        {
          RGB      = true,   -- #RGB hex codes
          RRGGBB   = true,   -- #RRGGBB hex codes
          names    = true,   -- "red", "blue", etc.
          RRGGBBAA = true,   -- #RRGGBBAA hex codes
          rgb_fn   = true,   -- CSS rgb() and rgba() functions
          hsl_fn   = true,   -- CSS hsl() and hsla() functions
          mode     = "background", -- color background, can be "foreground"
        }
      )
    end
  }
}

