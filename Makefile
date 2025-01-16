.PHONY:
serve:
	@echo serving site on http://localhost:8000
	mkdocs serve

.PHONY: build
build:
	@echo building site!
	mkdocs build --strict --verbose --site-dir public

.PHONY: lint
lint:
	@echo linting files at docs/**/*.md
	markdownlint docs/**/*.md

.PHONY: linfix
lintfix:
	@echo linting and fixing files at docs/**/*.md
	markdownlint docs/**/*.md -f