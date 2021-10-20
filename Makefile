.PHONY: fmt

fmt:
	stylua --glob '**/*.lua' -- nvim/.config/nvim

pre-commit:
	stylua -c --glob '**/*.lua' -- nvim/.config/nvim
