OUTPUTS_DIR ?= ./outputs
CPPFILES ?= $(shell find . -name "*.cpp")
FORMAT_STYLE ?= Google

# https://marmelab.com/blog/2016/02/29/auto-documented-makefile.html
.PHONY: help
help:
	@grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | sort | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-30s\033[0m %s\n", $$1, $$2}'
.DEFAULT_GOAL := help

.PHONY: install
install: ## install container
	sudo apt-get install -y \
		git \
		cmake \
		clang \
		clang-format

.PHONY: fmt
fmt: ## format codes
	clang-format -i $(CPPFILES) \
		--style=$(FORMAT_STYLE)

.PHONY: gtest
gtest:
	cd externals/googletest && \
		mkdir -p build && \
		cd build && \
		cmake .. && \
		make && \
		sudo make install

.PHONY: ci
ci: fmt gtest ## run ci tests
	# src
	clang++ src/main.cpp --output=$(OUTPUTS_DIR)/main
	$(OUTPUTS_DIR)/main
	# tests
	clang++ tests/main.cpp -pthread -lgtest_main -lgtest --output=$(OUTPUTS_DIR)/test
	$(OUTPUTS_DIR)/test
