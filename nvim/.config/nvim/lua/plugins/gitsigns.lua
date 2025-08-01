return {
  "lewis6991/gitsigns.nvim",
  opts = {
    current_line_blame = true, -- 開啟行內 blame
    current_line_blame_opts = {
      delay = 500, -- 立即顯示（預設會延遲）
      virt_text_pos = "eol", -- 顯示在行尾 (end of line)
    },
    current_line_blame_formatter = "  <author>, <author_time:%Y-%m-%d> - <summary>",
  },
}

