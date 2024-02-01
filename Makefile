TOPLEVEL_LANG ?= verilog
SIM ?= questa
PWD=$(shell pwd)


ifeq ($(TOPLEVEL_LANG),verilog)
    VERILOG_SOURCES = $(PWD)/RTL/*.sv 
else ifeq ($(TOPLEVEL_LANG),vhdl)
    VHDL_SOURCES = $(PWD)/ALU.vhdl
else
    $(error A valid value (verilog or vhdl) was not provided for TOPLEVEL_LANG=$(TOPLEVEL_LANG))
endif

TOPLEVEL := i2c_mem              #Module_NAME
MODULE   := tb     	             #File_Python_Name

include $(shell cocotb-config --makefiles)/Makefile.sim