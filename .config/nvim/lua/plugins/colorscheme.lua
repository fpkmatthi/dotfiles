-- lua/plugins/rose-pine.lua

return {
  -- Add the rose-pine color scheme plugin
  { "rose-pine/neovim", name = "rose-pine" },

  -- Configure LazyVim to load the rose-pine colorscheme with transparency
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "rose-pine",
    },
  },

  -- Rose Pine configuration
  {
    "rose-pine/neovim",
    opts = function()
      require("rose-pine").setup({
        variant = "auto",
        dark_variant = "main",
        dim_inactive_windows = false,
        extend_background_behind_borders = true,

        styles = {
          bold = true,
          italic = true,
          transparency = true, -- Enables transparency
        },

        groups = {
          border = "muted",
        },

        highlight_groups = {
          TelescopeBorder = { fg = "highlight_high", bg = "none" },
          TelescopeNormal = { bg = "none" },
          TelescopePromptNormal = { bg = "base" },
          TelescopeResultsNormal = { fg = "subtle", bg = "none" },
          TelescopeSelection = { fg = "text", bg = "base" },
          TelescopeSelectionCaret = { fg = "rose", bg = "rose" },
        },
      })

      vim.cmd("colorscheme rose-pine")
    end,
  },
}
