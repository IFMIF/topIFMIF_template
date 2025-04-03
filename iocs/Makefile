# -------------------------------------------------------------------------------------------------
# Build instructions: compile each ./xxxIOC folder to ./target/xxxIOC/
#
# Author: José Franco Campos <franco.jose@qst.go.jp>
# Last update: 2025-03-01
# -------------------------------------------------------------------------------------------------

define pretty_text
    @echo "$(shell tput setaf 2)"
	@echo "--------------------------------------------------------------------------------"
	@echo "$1"
	@echo "--------------------------------------------------------------------------------"
	@echo "$(shell tput sgr0)"
endef

TOP_TARGETS := all clean

SOURCE_DIRS := $(wildcard *_ioc)

TARGET_DIR = $(CURDIR)/target

$(TOP_TARGETS): $(SOURCE_DIRS)

$(SOURCE_DIRS):
	@$(call pretty_text, $@)
	$(MAKE) -C $@ $(MAKECMDGOALS) INSTALL_LOCATION=$(TARGET_DIR)/$@

.PHONY: $(TOP_TARGETS) $(SOURCE_DIRS)
