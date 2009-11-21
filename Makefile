#
# filename : Makefile
# author   : huys
# updated  : 2008.11.21.
# version  : 0.1
#
TOPDIR = .
#
include $(TOPDIR)/make.inc

#
INC      = -I"$(INCDIR)"
LIB      = -L"$(LIBDIR)"
CFLAGS   +=
CXXFLAGS +=
LDFLAGS  +=

#
HEADER =

#
ifeq ($(USE7Z), yes)
    TARCMD = $(P7ZIP) a -t7z -r ulib-win.7z ulib-win -mx=9 -m0=BCJ -m1=LZMA:d=26 -ms -mmt
else
    TARCMD = tar cjvf ulib-win.tgz ulib-win
endif

#
#all: UOBJS URES ULIBS UBINS UDEMO UDOC
#all: UOBJS ULIBS URES UDEMO
all : UOBJS URES ULIBS

#
UOBJS :
	$(MAKE) -C $(OBJDIR) all
#
URES :
	$(MAKE) -C $(RESDIR) all

#
ULIBS :
	$(MAKE) -C $(LIBDIR) all

#
UBINS :
	cd $(BINDIR) && $(MAKE) all

#
UDEMO :
	cd $(DEMODIR) && $(MAKE) all

#
UDOC :
	cd $(DOCDIR) && $(MAKE) all

dist :
	$(MAKE) clean && \
    cd .. && \
    $(TARCMD)

install :

.PHONY: clean
clean:
	cd $(DEMODIR) && $(MAKE) clean
	cd $(OBJDIR) && $(MAKE) clean
	cd $(RESDIR) && $(MAKE) clean
	cd $(LIBDIR) && $(MAKE) clean
	cd $(BINDIR) && $(MAKE) clean
	$(CLEANUP)
