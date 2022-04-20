local indent = 4

vim.bo.expandtab = true
vim.bo.shiftwidth = indent
vim.bo.smartindent = true
vim.bo.tabstop = indent

vim.o.autowrite = true
vim.o.swapfile = false
vim.o.confirm = true
vim.o.ignorecase = true
vim.o.smartcase = true
vim.o.listchars = 'tab:» ,extends:›,precedes:‹,nbsp:·,trail:·,eol:¬'
vim.o.hidden = true
vim.o.scrolloff = 3
vim.o.showbreak = '﬌ '
vim.o.showmatch = true
vim.o.splitbelow = true
vim.o.splitright = true
vim.o.wildmode = 'longest,full'
vim.o.termguicolors = true
vim.o.spellfile = table.concat({
  vim.fn.expand '~/.local/share/nvim/site/spell/en.utf-8.add',
  vim.fn.expand '~/.local/share/nvim/site/spell/de.utf-8.add',
  vim.fn.expand '~/.local/share/nvim/site/spell/names.utf-8.add',
}, ',')
vim.o.spelllang = 'en,de,names'
vim.o.title = true
vim.o.titlestring = "nvim • %{join(split(substitute(getcwd(), $HOME, '~', ''), '/')[-1:], '')}"

vim.wo.number = true
vim.wo.relativenumber = true
vim.wo.colorcolumn = '80'
vim.wo.cursorline = true
vim.wo.list = true
vim.wo.spell = false
vim.wo.conceallevel = 2
