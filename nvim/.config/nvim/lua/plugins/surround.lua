return {
  "kylechui/nvim-surround",
  event = { "BufReadPre", "BufNewFile", "StdinReadPre" },
  opts = {
    keymaps = {
      insert = "<C-g>r",
      insert_line = "<C-g>R",
      normal = "yr",
      normal_cur = "yrr",
      normal_line = "yR",
      normal_cur_line = "yRR",
      visual = "R",
      visual_line = "gR",
      delete = "dr",
      change = "cr",
    },
  },
}
