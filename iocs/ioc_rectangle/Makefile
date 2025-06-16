# -------------------------------------------------------------------------------------------------
# Build instructions for a single IOC.
#
# Author: José Franco Campos <franco.jose@qst.go.jp>
# Last update: 2025-03-01
# -------------------------------------------------------------------------------------------------

TOP = ..
include $(TOP)/configure/CONFIG

DIRS := $(DIRS) $(filter-out $(DIRS), $(wildcard *src*))
DIRS := $(DIRS) $(filter-out $(DIRS), $(wildcard *db*))

include $(TOP)/configure/RULES_DIRS

# Copy 'boot' to the target folder
install:
	@cp -r boot $(INSTALL_LOCATION)
	@chmod +x $(INSTALL_LOCATION)/boot/*.cmd
