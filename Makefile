.PHONY: fmt

fmt:
	stylua -s nvim/.config/nvim

pre-commit:
	stylua -c -s nvim/.config/nvim
