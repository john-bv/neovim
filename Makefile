.PHONY: install font

install: font
	rsync -av --exclude='.git' . ~/.config/nvim/

font:
	brew install --cask font-jetbrains-mono-nerd-font
