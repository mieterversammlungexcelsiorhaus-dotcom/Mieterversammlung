.PHONY: install serve build help

help:
	@echo "Available commands:"
	@echo "  make install   - Install Ruby dependencies"
	@echo "  make serve     - Serve site on localhost:4000"
	@echo "  make build     - Build the site"
	@echo "  make clean     - Clean build artifacts"
	@echo "  make brew       - Install dependencies via brew"

setup: clean
	export PATH="$HOME/.rbenv/bin:$PATH"
	eval "$(rbenv init - zsh)"

brew: 
	brew install rbenv
	rbenv install 3.3.8
	rbenv global 3.3.8
	ruby -v
	make setup

install: setup clean
	cd docs && bundle install

serve: install setup clean
	cd docs && bundle exec jekyll serve

build: install setup clean
	cd docs && bundle exec jekyll build

clean:
	cd docs && rm -rf _site
