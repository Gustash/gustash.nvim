return {
  -- Catppuccin Theme
  'catppuccin/nvim',
  priority = 1000,
  config = function()
    vim.cmd.colorscheme 'catppuccin-frappe'
  end,
  opts = {
    flavour = 'frappe',
    transparent_background = vim.g.transparent_enabled,
    integrations = {
      cmp = true,
      gitsigns = true,
      nvimtree = true,
      treesitter = true,
    },
  },
}
