# -------------------------------------------------------------------------------------------------
# Build an IOC application
# -------------------------------------------------------------------------------------------------

TOP = ../..
include $(TOP)/configure/CONFIG

# Name of the IOC
PROD_IOC = rectangle

# Database definition files
DBD += rectangle.dbd
rectangle_DBD += base.dbd
rectangle_DBD += pvxsIoc.dbd
rectangle_DBD += asynRecord.dbd
rectangle_DBD += drvAsynIPPort.dbd
rectangle_DBD += drvAsynSerialPort.dbd
rectangle_DBD += devIocStats.dbd

# Source files
# <name>_registerRecordDeviceDriver.cpp will be created from <name>.dbd
rectangle_SRCS += rectangle_registerRecordDeviceDriver.cpp
rectangle_SRCS_DEFAULT += main.cpp

# Add the support libraries needed by this application
rectangle_LIBS += calc asyn devIocStats

# Finally include the libraries from base
rectangle_LIBS += pvxsIoc pvxs
rectangle_LIBS += $(EPICS_BASE_IOC_LIBS)
$(info Linking with ${rectangle_LIBS})

# EPICS build rules
include $(TOP)/configure/RULES

#  ADD CUSTOM RULES AFTER THIS LINE
USR_CXXFLAGS += -Wno-deprecated -Werror
