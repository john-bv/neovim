.PHONY: install font deps

install: font deps
	rsync -av --exclude='.git' . ~/.config/nvim/

font:
	brew install --cask font-jetbrains-mono-nerd-font

deps:
	brew install tree-sitter-cli
	@echo "Installing Rust toolchain..."
	@command -v rustup >/dev/null 2>&1 && echo "rustup already installed, skipping" || \
		curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh -s -- -y
	@echo "Installing LSP servers via Mason..."
	nvim --headless "+MasonInstall rust-analyzer lua-language-server" +qa
