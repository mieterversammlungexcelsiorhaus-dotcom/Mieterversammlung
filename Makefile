.PHONY: install serve build help stop

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

serve: install setup clean stop
	cd docs && bundle exec jekyll serve

build: install setup clean
	cd docs && bundle exec jekyll build

clean:
	cd docs && rm -rf _site

stop:
	@echo "Stopping Jekyll server (port 4000)..."
	@pids="$$(lsof -ti TCP:4000 2>/dev/null)"; \
	if [ -n "$$pids" ]; then \
		echo "Killing: $$pids"; \
		kill -9 $$pids || true; \
		echo "Stopped."; \
	else \
		echo "No process listening on port 4000. Trying pkill for 'jekyll'..."; \
		pkill -f "jekyll" 2>/dev/null || echo "No jekyll process found."; \
	fi
