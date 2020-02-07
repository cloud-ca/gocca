# Project variables
NAME        := gocca
DESCRIPTION := A cloud.ca client for the Go programming language
VENDOR      := cloud.ca
URL         := https://github.com/cloud-ca/gocca
LICENSE     := MIT

# Build variables
BUILD_DIR   := bin
COMMIT_HASH := $(shell git rev-parse --short HEAD 2>/dev/null)
GIT_VERSION := $(shell git describe --tags --exact-match 2>/dev/null || git describe --tags 2>/dev/null || echo "v0.0.0-$(COMMIT_HASH)")
BUILD_DATE  := $(shell date +%FT%T%z)

# Go variables
GOCMD       := GO111MODULE=on go
MODVENDOR   := -mod=vendor
GOPKGS      ?= $(shell $(GOCMD) list $(MODVENDOR) ./... | grep -v /vendor)
GOFILES     ?= $(shell find . -type f -name '*.go' -not -path "./vendor/*")

GOBUILD     ?= GOOS=$(GOOS) GOARCH=$(GOARCH) $(GOCMD) build $(MODVENDOR)
GORUN       ?= GOOS=$(GOOS) GOARCH=$(GOARCH) $(GOCMD) run $(MODVENDOR)

# Binary versions
GITCHGLOG_VERSION := 0.9.1
GOLANGCI_VERSION  := v1.23.1

.PHONY: all
all: clean verify checkfmt lint test

.PHONY: version
version: ## Show version of provider
	@echo "$(NAME) - $(VERSION) - $(BUILD_DATE)"

#########################
## Development targets ##
#########################
.PHONY: clean
clean: ## Clean builds
	@ $(MAKE) --no-print-directory log-$@
	rm -rf ./$(BUILD_DIR) $(NAME)

.PHONY: vendor
vendor: ## Install 'vendor' dependencies
	@ $(MAKE) --no-print-directory log-$@
	$(GOCMD) mod vendor

.PHONY: verify
verify: ## Verify 'vendor' dependencies
	@ $(MAKE) --no-print-directory log-$@
	$(GOCMD) mod verify

.PHONY: tidy
tidy: ## Tidy up 'vendor' dependencies
	@ $(MAKE) --no-print-directory log-$@
	$(GOCMD) mod tidy

.PHONY: lint
lint: ## Run linter
	@ $(MAKE) --no-print-directory log-$@
	GO111MODULE=on golangci-lint run ./...

.PHONY: fmt
fmt: ## Format all go files
	@ $(MAKE) --no-print-directory log-$@
	goimports -w $(GOFILES)

.PHONY: checkfmt
checkfmt: RESULT ?= $(shell goimports -l $(GOFILES) | tee >(if [ "$$(wc -l)" = 0 ]; then echo "OK"; fi))
checkfmt: SHELL  := /usr/bin/env bash
checkfmt: ## Check formatting of all go files
	@ $(MAKE) --no-print-directory log-$@
	@ echo "$(RESULT)"
	@ if [ "$(RESULT)" != "OK" ]; then exit 1; fi

.PHONY: test
test: ## Run tests
	@ $(MAKE) --no-print-directory log-$@
	$(GOCMD) test $(MODVENDOR) -v $(GOPKGS)

####################
## Helper targets ##
####################
.PHONY: changelog
changelog: NEXT ?=
changelog: PUSH ?= false
changelog: ## Generate Changelog
	@ $(MAKE) --no-print-directory log-$@
	git-chglog --config ./scripts/chglog/config-full-history.yml --tag-filter-pattern v[0-9]+.[0-9]+.[0-9]+$$ --output CHANGELOG.md $(NEXT)
	@ git add CHANGELOG.md
	@ git commit -m "Update Changelog"
	@ if [ "$(PUSH)" = "true" ]; then git push origin master ; fi

.PHONY: goimports
goimports:
ifeq (, $(shell which goimports))
	GO111MODULE=off go get -u golang.org/x/tools/cmd/goimports
endif

.PHONY: golangci
golangci:
ifeq (, $(shell which golangci-lint))
	curl -sfL https://install.goreleaser.com/github.com/golangci/golangci-lint.sh | sh -s  -- -b $(shell go env GOPATH)/bin $(GOLANGCI_VERSION)
endif

.PHONY: git-chglog
git-chglog:
ifeq (, $(shell which git-chglog))
	curl -sfL https://github.com/git-chglog/git-chglog/releases/download/$(GITCHGLOG_VERSION)/git-chglog_$(shell go env GOOS)_$(shell go env GOARCH) -o $(shell go env GOPATH)/bin/git-chglog && chmod +x $(shell go env GOPATH)/bin/git-chglog
endif

.PHONY: tools
tools: ## Install required tools
	@ $(MAKE) --no-print-directory log-$@
	@ $(MAKE) --no-print-directory goimports golangci git-chglog

#####################
## Release targets ##
#####################
.PHONY: release patch minor major
PATTERN =

# if the last release was alpha, beta or rc, 'release' target has to used with current
# cycle release. For example if latest tag is v0.8.0-rc.2 and v0.8.0 GA needs to get
# released the following should be executed: "make release version=0.8.0"
release: VERSION ?= $(shell echo $(GIT_VERSION) | sed 's/^v//' | awk -F'[ .]' '{print $(PATTERN)}')
release: PUSH ?= false
release: ## Prepare Module release
	@ $(MAKE) --no-print-directory log-$@
	@ ./scripts/release/release.sh "$(VERSION)" "$(PUSH)" "$(GIT_VERSION)" "1"

patch: PATTERN = '\$$1\".\"\$$2\".\"\$$3+1'
patch: release ## Prepare Module Patch release

minor: PATTERN = '\$$1\".\"\$$2+1\".0\"'
minor: release ## Prepare Module Minor release

major: PATTERN = '\$$1+1\".0.0\"'
major: release ## Prepare Module Major release

####################################
## Self-Documenting Makefile Help ##
####################################
.PHONY: help
help:
	@ grep -h -E '^[a-zA-Z0-9_-]+:.*?## .*$$' $(MAKEFILE_LIST) | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-20s\033[0m %s\n", $$1, $$2}'

log-%:
	@ grep -h -E '^$*:.*?## .*$$' $(MAKEFILE_LIST) | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m==> %s\033[0m\n", $$2}'
