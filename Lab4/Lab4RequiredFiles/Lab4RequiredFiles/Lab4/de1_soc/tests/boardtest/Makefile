
# This is a GNU Makefile.

# It can be used to compile an OpenCL program with
# the Intel(R) FPGA SDK for OpenCL(TM).
# See README.txt for more information.


# You must configure INTELFPGAOCLSDKROOT to point the root directory of the Intel(R) FPGA SDK for OpenCL(TM)
# software installation.
# See doc/getting_started.txt for more information on installing and
# configuring the Intel(R) FPGA SDK for OpenCL(TM).

HOST_DIR ?= host
TARGET = boardtest_host

# Where is the Intel(R) FPGA SDK for OpenCL(TM) software?
ifeq ($(wildcard $(INTELFPGAOCLSDKROOT)),)
$(error Set INTELFPGAOCLSDKROOT to the root directory of the Intel(R) FPGA SDK for OpenCL(TM) software installation)
endif
ifeq ($(wildcard $(INTELFPGAOCLSDKROOT)/host/include/CL/opencl.h),)
$(error Set INTELFPGAOCLSDKROOT to the root directory of the Intel(R) FPGA SDK for OpenCL(TM) software installation.)
endif

SRCS = $(subst $(HOST_DIR)/,,$(wildcard $(HOST_DIR)/*.cpp))
SRCS_FILES = $(foreach F, $(SRCS), $(HOST_DIR)/$(F))


# OpenCL compile and link flags.
AOCL_COMPILE_CONFIG=$(shell aocl compile-config)
#AOCL_LINK_CONFIG=$(shell aocl link-config)
AOCL_LINK_CONFIG=$(wildcard $(INTELFPGAOCLSDKROOT)/host/arm32/lib/*.so) $(wildcard $(AOCL_BOARD_PACKAGE_ROOT)/arm32/lib/*.so)

# Make it all!
all : 
	arm-linux-gnueabihf-g++ -fPIC -DARM $(SRCS_FILES) -o $(TARGET) -DLINUX $(AOCL_COMPILE_CONFIG) $(AOCL_LINK_CONFIG) -lrt 

# Standard make targets
clean :
	@rm -f $(OBJS) $(TARGET)

