MAKEFILE_DIR:=$(dir $(abspath $(lastword $(MAKEFILE_LIST))))
OUTPUTS_DIR ?= $(MAKEFILE_DIR)outputs
CPPFILES ?= $(shell find . -name "*.cpp")
BIN_NAME ?= sandbox-cpp
FORMAT_STYLE ?= Google

# https://marmelab.com/blog/2016/02/29/auto-documented-makefile.html
.PHONY: help
help:
	@grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | sort | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-30s\033[0m %s\n", $$1, $$2}'
.DEFAULT_GOAL := help

.PHONY: install
install: ## install container
	sudo apt-get install -y \
		clang \
		clang-format

.PHONY: fmt
fmt: ## format codes
	clang-format -i $(CPPFILES) \
		--style=$(FORMAT_STYLE)

.PHONY: build
build: ## build codes
	clang++ $(CPPFILES) \
		--output=$(OUTPUTS_DIR)/$(BIN_NAME)

.PHONY: run
run: ## run an app
	$(OUTPUTS_DIR)/$(BIN_NAME)

.PHONY: clean
clean: ## build codes
	rm -f $(OUTPUTS_DIR)/$(BIN_NAME)
