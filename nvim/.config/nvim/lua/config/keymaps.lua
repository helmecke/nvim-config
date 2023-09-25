local Util = require("util")
local map = vim.keymap.set

-- better up/down
map({ "n", "x" }, "j", "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })
map({ "n", "x" }, "k", "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })

if not Util.has("tmux.nvim") then
  -- Move to window using the <Meta> hjkl keys
  map("n", "<m-h>", "<c-w>h", { desc = "Go to left window", remap = true })
  map("n", "<m-j>", "<c-w>j", { desc = "Go to lower window", remap = true })
  map("n", "<m-k>", "<c-w>k", { desc = "Go to upper window", remap = true })
  map("n", "<m-l>", "<c-w>l", { desc = "Go to right window", remap = true })

  -- Resize window using the <Meta-Shift> hjkl keys
  map("n", "<m-s-h>", "<cmd>vertical resize +2<cr>", { desc = "Increase window width" })
  map("n", "<m-s-j>", "<cmd>resize +2<cr>", { desc = "Increase window height" })
  map("n", "<m-s-k>", "<cmd>resize -2<cr>", { desc = "Decrease window height" })
  map("n", "<m-s-l>", "<cmd>vertical resize -2<cr>", { desc = "Decrease window width" })
end

-- Easy buffer switching
map("n", "[b", "<cmd>bprevious<cr>", { desc = "Prev buffer" })
map("n", "]b", "<cmd>bnext<cr>", { desc = "Next buffer" })

-- Clear search
map({ "i", "n" }, "<esc>", "<cmd>noh<cr><esc>", { desc = "Clear search" })

-- quit
-- if Util.has("which-key.nvim") then
--   require("which-key").register({
--     ["<leader>q"] = {
--       name = "+quit/session",
--     },
--   })
-- end
map("n", "<leader>qq", "<cmd>qa<cr>", { desc = "Quit all" })
map("n", "<leader>qQ", "<cmd>qa!<cr>", { desc = "Quit all without saving" })

-- Move Lines
map("n", "<c-j>", "<cmd>m .+1<cr>==", { desc = "Move line down" })
map("n", "<c-k>", "<cmd>m .-2<cr>==", { desc = "Move line up" })
map("v", "<c-j>", ":m '>+1<cr>gv=gv", { desc = "Move selection down" })
map("v", "<c-k>", ":m '<-2<cr>gv=gv", { desc = "Move selection up" })

-- Command line history navigation
map("c", "<c-j>", "wildmenumode() ? '<c-j>' : '<down>'", { expr = true, replace_keycodes = false })
map("c", "<c-k>", "wildmenumode() ? '<c-k>' : '<up>'", { expr = true, replace_keycodes = false })

-- traversing text in insert mode like in terminal
map("i", "<a-f>", "<c-o>w", { desc = "Next word" })
map("i", "<a-b>", "<c-o>b", { desc = "Previous word" })
map("i", "<c-f>", "<c-o>l", { desc = "Next character" })
map("i", "<c-b>", "<c-o>h", { desc = "Previous character" })
map("i", "<c-a>", "<c-o>0", { desc = "Goto beginning of line" })
map("i", "<c-e>", "<c-o>$", { desc = "Goto end of line" })
map("i", "<c-u>", "<c-o>d0", { desc = "Delete to beginning of line" })
map("i", "<c-k>", "<c-o>d$", { desc = "Delete to end of line" })
map("i", "<c-y>", "<c-o>P", { desc = "Paste" })
map("i", "<c-_>", "<c-o>u", { desc = "Undo" })

-- keep selection after indenting
map("v", "<", "<gv")
map("v", ">", ">gv")

-- Map save to Ctrl + S
map({ "n", "i", "v", "s" }, "<c-s>", "<cmd>w<cr>", { desc = "Save file" })

-- Clear search, diff update and redraw
-- stylua: ignore
map("n", "<c-l>", "<cmd>nohlsearch<bar>diffupdate<bar>normal! <c-l><cr>", { desc = "redraw / clear hlsearch / diff update" })

-- toggle options
if Util.has("which-key.nvim") then
  require("which-key").register({
    ["<leader>t"] = {
      name = "+toggle",
    },
  })
end
-- stylua: ignore start
map("n", "<leader>ts", function() Util.toggle("spell") end, { desc = "Toggle Spelling" })
map("n", "<leader>tw", function() Util.toggle("wrap") end, { desc = "Toggle Word Wrap" })
map("n", "<leader>tn", function() Util.toggle("relativenumber") Util.toggle("number") end, { desc = "Toggle Line Numbers" })
map("n", "<leader>tc", function() Util.toggle("conceallevel", false, {2, 0}) end, { desc = "Toggle Conceal Level" })
-- stylua: ignore end

vim.cmd("nmap { [")
vim.cmd("nmap } ]")
