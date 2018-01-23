build:
	crystal build --link-flags='-static' --no-debug -o bin/lovely --release bin/lovely.cr

format:
	crystal tool format

.PHONY: build format
