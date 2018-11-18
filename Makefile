build:
	crystal build --no-debug -o bin/lovely --release bin/lovely.cr

format:
	crystal tool format

test: format
	crystal spec && bin/ameba

.PHONY: build format test
