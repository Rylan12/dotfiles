return {
  {
    "lukas-reineke/headlines.nvim",
    opts = {
      markdown = {
        -- This plugin uses the 🬂 character (U+1FB02, Block Sextant-12 aka upper one third block) for the lower string,
        -- but my combination of Fira Code/Monaspace/iTerm2/neovim do not bridge the character correctly.
        -- Instead, use the 1/2 upper block character ▀ (U+2580, Upper Half Block) for the lower string which bridges correctly.
        -- To match the top and bottom border sizes, also use the half block for the upper string.
        fat_headline_upper_string = "▄",
        fat_headline_lower_string = "▀",
      },
    },
  },
}
