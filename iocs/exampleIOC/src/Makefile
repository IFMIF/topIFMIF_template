# -------------------------------------------------------------------------------------------------
# Build an IOC application
# -------------------------------------------------------------------------------------------------

TOP = ../..
include $(TOP)/configure/CONFIG

# Name of the IOC
PROD_IOC = example

# Database definition files
DBD += example.dbd
example_DBD += base.dbd
example_DBD += pvxsIoc.dbd
example_DBD += asynRecord.dbd
example_DBD += drvAsynIPPort.dbd
example_DBD += drvAsynSerialPort.dbd

# Source files
# <name>_registerRecordDeviceDriver.cpp will be created from <name>.dbd
example_SRCS += example_registerRecordDeviceDriver.cpp
example_SRCS_DEFAULT += main.cpp

# Add the support libraries needed by this application
example_LIBS += calc asyn

# Finally include the libraries from base
example_LIBS += pvxsIoc pvxs
example_LIBS += $(EPICS_BASE_IOC_LIBS)
$(info Linking with ${example_LIBS})

# EPICS build rules
include $(TOP)/configure/RULES

#  ADD CUSTOM RULES AFTER THIS LINE
USR_CXXFLAGS += -Wno-deprecated -Werror
