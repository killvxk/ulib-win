#
TOPDIR = ../../..
#
include $(TOPDIR)/make.inc

#
INCS = -I"$(TOPDIR)/inc"
LIBS = -L"$(TOPDIR)/lib"
CFLAGS +=
CXXFLAGS += $(INCS)
LDFLAGS += $(LIBS)

#
OBJ = test_sort.o
BIN = test_sort.exe
RC  =
RES = ${RC:.rc=.res}
#
HEADER = $(INCDIR)/adt/uadt.h
#
all: $(BIN)

#
$(BIN) : $(OBJ) $(RES)
	$(CXX) -o $(BIN) $^ $(LIBS) $(RES)

#
.PHONY : test
test:
	$(WINE) ./$(BIN)

.PHONY : clean
clean :
	${RM} ${OBJ} ${BIN} $(RES)
