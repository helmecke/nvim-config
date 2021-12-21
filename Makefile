.PHONY: hooks
hooks:
	git config core.hooksPath .githooks

.PHONY: fmt
fmt:
	stylua -s nvim/.config/nvim

.PHONY: pre-commit
pre-commit:
	stylua -c -s nvim/.config/nvim
