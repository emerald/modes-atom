###
# Inspired by: https://stackoverflow.com/a/18137056/5801152
mkfile_path := $(abspath $(lastword $(MAKEFILE_LIST)))
mkfile_dir := $(dir $(mkfile_path))
###

synhi_dir := $(mkfile_dir)../syntax-highlighting/

all:
	make -C $(synhi_dir) atom-grammar
	cp $(synhi_dir)/build/emerald.cson grammars/

.PHONY: all
