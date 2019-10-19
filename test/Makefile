# Basic Makefile for Fortran 90 projects with makedepf90
# nescirem @2019-10-19
# 

SHELL:=/bin/bash

.SUFFIXES:
.SUFFIXES: .f90 .o

INC_DIR = 
SRC_DIR = ./src
OBJ_DIR = ./obj
BIN_DIR = ./bin

FC      = gfortran
FFLAGS  = -O2
LDFLAGS = -fbacktrace -Wall -Wextra -Wno-maybe-uninitialized -Wno-unused-function -pedantic -std=f2008ts
LIBS    =

SRC = $(wildcard $(SRC_DIR)/*.f90)
OBJ = $(patsubst %.f90,$(OBJ_DIR)/%.o,$(notdir $(SRC)))

TARGET  = main

BIN_TARGET = $(BIN_DIR)/$(TARGET)

.PHONY: clean depend info all after

VPATH:=$(INC_DIR) $(SRC_DIR) $(OBJ_DIR) $(BIN_DIR)

all: depend info $(TARGET) after

$(OBJ_DIR)/%.o:$(SRC_DIR)/%.f90
	$(FC) -c $(FFLAGS) $< -o $@
	@echo "-------------------------------"

$(OBJ_DIR):
	@if [ ! -d $(OBJ_DIR) ]; then \
		echo 'make: Creating $(OBJ_DIR)/';\
		mkdir $(OBJ_DIR) ;	fi
$(BIN_DIR):
	@if [ ! -d $(BIN_DIR) ]; then \
		echo 'make: Creating $(BIN_DIR)/';\
		mkdir $(BIN_DIR) ;	fi

info:
	@echo "make: Compiler options:"
	@echo "make: Compiler = $(FC)"
	@echo "make: FFLAGS = $(FFLAGS)"
	@echo "make: LDFLAGS = $(LDFLAGS)"
	@echo "make: SOURCES = $(SRC)"
	@echo "make: OBJECTS = $(OBJ)"
	@echo "-------------------------------"

include .depend

clean:
	rm -f $(OBJ_DIR)/*.o
	rm -f *.mod
	rm -f $(TARGET)
	rm -f $(BIN_TARGET)
	@rm -rf bin obj

depend .depend: $(BIN_DIR) $(OBJ_DIR)
	@-makedepf90 -o $(TARGET) $(SRC) -b $(OBJ_DIR) > .depend

after:
	@if [ -f $(TARGET) ]; then \
		mv -u $(TARGET) $(BIN_DIR);\
		fi

