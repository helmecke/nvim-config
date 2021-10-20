# nvim-config

## Getting Started

I manage _nvim-config_ using [(GNU Stow)](http://www.gnu.org/software/stow/).

Install _nvim-config_ by cloning the git repository. I recommand using [ghq](https://github.com/x-motemen/ghq).

```bash
ghq get https://github.com/helmecke/nvim-config.git

# or

git clone https://github.com/helmecke/nvim-config.git ~/.nvim-config
```

You can now symlink any configurations you wish to use:

```bash
# Enter repository folder
cd $(ghq list -p | grep helmecke/nvim-config)

#or

cd ~/.nvim-config

# Symlink nvim config
stow -t ~ nvim

# Remove nvim symlink
stow -t ~ -D nvim
```
