# -------------------------------------------------------------------------------------------------
# Build an IOC application
# -------------------------------------------------------------------------------------------------

TOP = ../..
include $(TOP)/configure/CONFIG

# Name of the IOC
PROD_IOC = quadratic

# Database definition files
DBD += quadratic.dbd
quadratic_DBD += base.dbd
quadratic_DBD += pvxsIoc.dbd
quadratic_DBD += asynRecord.dbd
quadratic_DBD += drvAsynIPPort.dbd
quadratic_DBD += drvAsynSerialPort.dbd
quadratic_DBD += devIocStats.dbd

# Source files
# <name>_registerRecordDeviceDriver.cpp will be created from <name>.dbd
quadratic_SRCS += quadratic_registerRecordDeviceDriver.cpp
quadratic_SRCS_DEFAULT += main.cpp

# Add the support libraries needed by this application
quadratic_LIBS += calc asyn devIocStats

# Finally include the libraries from base
quadratic_LIBS += pvxsIoc pvxs
quadratic_LIBS += $(EPICS_BASE_IOC_LIBS)
$(info Linking with ${quadratic_LIBS})

# EPICS build rules
include $(TOP)/configure/RULES

#  ADD CUSTOM RULES AFTER THIS LINE
USR_CXXFLAGS += -Wno-deprecated -Werror
