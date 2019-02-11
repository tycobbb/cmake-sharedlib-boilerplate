.DEFAULT_GOAL := help

# -- context --
target_name=hello

dev_bin=build/dev
dev_target=$(dev_bin)/$(target_name)

test_bin=build/test
test_target=$(test_bin)/$(target_name)

# -- run --
## builds and runs the binary
r: b
	$(dev_target)
.PHONY: r

# -- build --
## builds the binary
b: b/pre
	make -C $(dev_bin)/lib && \
	make -C $(dev_bin)/main
.PHONY: b

# -- build/helpers --
$(dev_bin)/lib:
	mkdir -p $(dev_bin)/lib

$(dev_bin)/main:
	mkdir -p $(dev_bin)/main

b/pre: $(dev_bin)/lib $(dev_bin)/main
	cmake -B$(dev_bin)/lib -Hlib && \
	cmake -B$(dev_bin)/main -Hmain
.PHONY: b/pre

# -- test --
## builds & runs the tests
test: test/pre
	$(test_target)
.PHONY: test

# -- test/helpers --
$(test_bin):
	mkdir -p $(dev_bin)

test/pre: $(test_bin)
	cmake -B$(test_bin) -H.
.PHONY: test/pre

# -- help --
help:
	@awk "$$HELP" $(MAKEFILE_LIST)

define HELP
BEGIN {
	print "\033[4;37musage:\033[0m";
	print "  \033[1;37mmake <target>\033[0m\n";
	print "\033[4;37mcommands:\033[0m";
}
/^## (.*)$$/ {
	$$1=""; docs=$$0;
	getline;
	sub(/:/, "", $$1);
	printf "  \033[1;31m%-9s\033[0;90m %s\033[0m\n", $$1, docs;
}
endef
export HELP

.PHONY: help
