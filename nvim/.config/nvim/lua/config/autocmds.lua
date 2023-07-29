local function augroup(name)
  return vim.api.nvim_create_augroup("my_" .. name, { clear = true })
end

-- update cwd for kitty terminal
-- https://github.com/kovidgoyal/kitty/issues/6173
-- https://github.com/kovidgoyal/kitty/discussions/4869
vim.api.nvim_create_autocmd({ "DirChanged" }, {
  group = augroup("kitty_cwd_fix"),
  pattern = "*",
  callback = function()
    vim.cmd([[ call chansend(v:stderr, printf("\033]7;file://%s\033\\", v:event.cwd)) ]])
  end,
})

-- Auto create dir when saving a file, in case some intermediate directory does not exist
vim.api.nvim_create_autocmd({ "BufWritePre" }, {
  group = augroup("auto_create_dir"),
  callback = function(event)
    if event.match:match("^%w%w+://") then
      return
    end
    local file = vim.loop.fs_realpath(event.match) or event.match
    vim.fn.mkdir(vim.fn.fnamemodify(file, ":p:h"), "p")
  end,
})

-- resize splits if window got resized
vim.api.nvim_create_autocmd({ "VimResized" }, {
  group = augroup("resize_splits"),
  callback = function()
    vim.cmd("tabdo wincmd =")
  end,
})

-- Highlight on yank
vim.api.nvim_create_autocmd("TextYankPost", {
  group = augroup("highlight_yank"),
  callback = function()
    vim.highlight.on_yank({ timeout = 250 })
  end,
})
