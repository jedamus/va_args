# erzeugt Samstag, 04. Juli 2015 14:04 (C) 2015 von Leander Jedamus
# modifiziert Samstag, 05. Oktober 2024 10:08 von Leander Jedamus
# modifiziert Dienstag, 01. Oktober 2024 10:07 von Leander Jedamus
# modifiziert Montag, 30. September 2024 23:59 von Leander Jedamus
# modifiziert Samstag, 24. August 2024 14:27 von Leander Jedamus
# modifiziert Montag, 12. August 2024 09:39 von Leander Jedamus
# modifiziert Dienstag, 06. August 2024 14:52 von Leander Jedamus
# modifiziert Freitag, 23. Februar 2024 16:26 von Leander Jedamus
# modifiziert Donnerstag, 22. Februar 2024 10:07 von Leander Jedamus
# modifiziert Freitag, 16. Februar 2024 20:52 von Leander Jedamus
# modifiziert Freitag, 15. Dezember 2023 12:41 von Leander Jedamus
# modifiziert Mittwoch, 15. November 2023 16:09 von Leander Jedamus
# modifiziert Dienstag, 07. November 2023 20:35 von Leander Jedamus
# modifiziert Dienstag, 19. September 2023 14:07 von Leander Jedamus
# modifiziert Samstag, 09. September 2023 11:19 von Leander Jedamus
# modifiziert Freitag, 08. September 2023 16:45 von Leander Jedamus
# modifiziert Dienstag, 05. September 2023 08:19 von Leander Jedamus
# modifiziert Samstag, 02. September 2023 11:11 von Leander Jedamus
# modifiziert Mittwoch, 30. August 2023 18:32 von Leander Jedamus
# modifiziert Donnerstag, 17. August 2023 10:31 von Leander Jedamus
# modifiziert Mittwoch, 16. August 2023 17:10 von Leander Jedamus
# modifiziert Dienstag, 15. August 2023 16:54 von Leander Jedamus
# modifiziert Montag, 14. August 2023 08:52 von Leander Jedamus
# modifiziert Donnerstag, 10. August 2023 18:46 von Leander Jedamus
# modifiziert Mittwoch, 09. August 2023 15:00 von Leander Jedamus
# modifiziert Dienstag, 08. August 2023 21:45 von Leander Jedamus
# modifiziert Sonntag, 30. Juli 2023 19:24 von Leander Jedamus
# modifiziert Donnerstag, 27. Juli 2023 14:33 von Leander Jedamus
# modifiziert Mittwoch, 26. Juli 2023 08:22 von Leander Jedamus
# modifiziert Dienstag, 25. Juli 2023 16:22 von Leander Jedamus
# modifiziert Montag, 24. Juli 2023 06:50 von Leander Jedamus
# modifiziert Sonntag, 23. Juli 2023 13:54 von Leander Jedamus
# modifiziert Samstag, 22. Juli 2023 15:15 von Leander Jedamus
# modifiziert Freitag, 21. Juli 2023 10:41 von Leander Jedamus
# modifiziert Donnerstag, 20. Juli 2023 10:46 von Leander Jedamus
# modifiziert Mittwoch, 19. Juli 2023 16:34 von Leander Jedamus
# modifiziert Dienstag, 18. Juli 2023 03:00 von Leander Jedamus
# modifiziert Montag, 17. Juli 2023 22:18 von Leander Jedamus

SUFFIXES := .out .a .ln .o .c .cc .cpp .c++ .cxx .C .p .pas .f .F .for .f77 .f90 .f95 .f03 .f08 .m .r .y .l .ym .yl .s .S \
            .mod .sym .def .h .info .dvi .tex .texinfo .texi .txinfo .w .ch .web .sh .elc .el .latex .ps .nw .cweb .noweb \
	    .mf .ind .sgml .cob .1 .odt .html .pdf .ps .tfm
.SUFFIXES:  .out .a .ln .o .c .cc .cpp .c++ .cxx .C .p .pas .f .F .for .f77 .f90 .f95 .f03 .f08 .m .r .y .l .ym .yl .s .S \
            .mod .sym .def .h .info .dvi .tex .texinfo .texi .txinfo .w .ch .web .sh .elc .el .latex .ps .nw .cweb .noweb \
	    .mf .ind .sgml .cob .1 .odt .html .pdf .ps .tfm

.DEFAULT_GOAL		:= all

.INTERMEDIATE:		# list files here which should be treated as intermediate

.SECONDARY:		# list files here which are intermediate and should not be deleted

.PRECIOUS:		# %.o %.c for example to save intermediate files created by implicit rules

# .NOTPARALLEL:		

.DELETE_ON_ERROR:

VPATH			:= # search path for files not found in the current directpry; separated by :
#vpath			%.h ../headers

.LIBPATTERNS		:= lib%.so lib%.a

debug_switch		:= true# false

# set link_switch to shared, if there is at least one shared library:
link_switch		:= static# shared

DEPENDFILE		:= .depend
PRINTFILE		:= .print

DATE			:= $(shell date +\"%y%m%d\")
DATETIME		:= $(shell date +\"%d.%m.%Y\ %H:%M\")
PROJECT			:= $(shell cat project.txt)
# PROJECT		:= va_args
PROJECT_FILES		:= project.h version.h

PREFIX			:= /usr/local
BINDIR			:= $(PREFIX)/bin
LIBDIR			:= $(PREFIX)/lib
DATADIR			:= $(PREFIX)/share
LOCALEDIR		:= $(DATADIR)/locale

BACKUPDIR		:= $(PROJECT)
TARFILE			:= $(PROJECT).tar.gz
ZIPFILE			:= $(PROJECT)_$(DATE).zip
TEXINFOFILE		:= check.texinfo
INFOFILE		:= $(TEXINFOFILE:%.texinfo=%.info)
XMLFILE			:= $(TEXINFOFILE:%.texinfo=%.xml)
TXTFILE			:= $(TEXINFOFILE:%.texinfo=%.txt)
PDFFILE			:= $(TEXINFOFILE:%.texinfo=%.pdf)
HTMLFILE		:= $(TEXINFOFILE:%.texinfo=%.html)
HTMLDIR			:= $(TEXINFOFILE:%.texinfo=%)

CPPCHECKDIR		:= $(PROJECT)-cppcheck-build-dir

PDFOUTPUT		:= $(PDFFILE)
PDFOUTPUT		+= $(PDFFILE:%.pdf=%.log)
PDFOUTPUT		+= $(PDFFILE:%.pdf=%.toc)
PDFOUTPUT		+= $(PDFFILE:%.pdf=%.aux)
PDFOUTPUT		+= $(PDFFILE:%.pdf=%.cps)
PDFOUTPUT		+= $(PDFFILE:%.pdf=%.cp)

# profiling:
GMONFILE		:= gmon.out
PROFFILE		:= gprof.out.txt
NMFILE			:= nm.out.txt

STRIP			:= strip

include Makefile.c_and_c++
include Makefile.cobol
include Makefile.cweb_and_noweb
include Makefile.documentation
include Makefile.flex_and_bison
include Makefile.FORTRAN
include Makefile.latex
include Makefile.modula2
include Makefile.pascal

DEBUGGER		:= gdb
RM			:= rm -f
GENERATE		:= ./generate2
PRINT			:= a2ps
TOUCH			:= touch
LINT			:= cppcheck
PROF			:= gprof
NM			:= nm

CFLAGS			:= #
DFLAGS			:= #
LDFLAGS			:= #
LDLIBS			:= #
CPPFLAGS		:= #
CXXFLAGS		:= #
ARFLAGS			:= rv
NMFLAGS			:= --extern-only --defined-only -v --print-file-name
LINTFLAGS		:= #

ifeq ($(debug_switch),true)
  CPPFLAGS		+= -g -Wall
  ifeq ($(CC),gcc)
    CPPFLAGS		+= -pg # profiling
    CPPFLAGS		+= -Og # optimize for debug
  endif
else
  CPPFLAGS		+= -O3
endif

DFLAGS			+= -DINLINE=inline
#DFLAGS			+= -DINLINE
DFLAGS			+= -DCONST=const
#DFLAGS			+= -DCONST
DFLAGS			+= -DSYSTEM=$(machtype)
DFLAGS			+= -DCLRSCR
ifeq ($(DEBUG),true)
  DFLAGS		+= -DDEBUG=true
endif

ifeq ($(CC),gcc)
  CPPFLAGS		+= -ansi
endif

CPPFLAGS		+= -pipe

ifeq ($(machtype),MacOS)
  CPPFLAGS		+= -I/usr/local/Cellar/gettext/0.19.3/include
endif

CPPFLAGS		+= # -traditional
CPPFLAGS		+= # -funroll-loops -fomit-frame-pointer
CXXFLAGS		+= # -felide-constructors -fmemoize-lookups
LDFLAGS			+= -L .# -s
LDLIBS			+= -lm
# LDLIBS		+= -lefence
LDLIBS			+= # -lvga
LDLIBS			+= # -ly
LDLIBS			+= # -ltermcap
LDLIBS			+= -ll # lex
LDLIBS			+= -ly # yacc
LDLIBS			+= # -lcurses
LDLIBS			+= # -lncurses

ifeq ($(machtype),MacOS)
  LDFLAGS		+= -L /usr/local/lib
  LDLIBS		+= -lintl
else
  LDLIBS		+= -lpopt # command line parsing
endif

define debug
$(DEBUGGER) $<
endef

define generate
$(GENERATE) $<
endef

define print
$(PRINT) $<
endef

OBJS			:= # put your obj files here \
			    (will be deleted by "make clean")
LIBRARIES		:= # put your libraries here \
			    (will be deleted by "make clean")
CSOURCES		:= # put your c source files here \
			    (will be used e.g. by "make depend")
CDEPENDS		:= # here you add the .d files make from .c files
CCDEPENDS		:= # here you add the .d files make from .cc files
IS_IN_LIB		:= # here you add the .d files, which obj-files are in a library
SHARED_LIBS		:= # put your shared libs here
CCSOURCES		:= # put your c++ source files here. File types \
			    "*.cc,*.cpp,*.c++,*.cxx,*.C" are recognized. \
			    (will be used e.g. by "make depend")
FILES			:= # put your source and other files here, that you \
                            want to be used e.g. in "make backup" and \
			    "make print"

FILES			+= Makefile
FILES			+= Makefile.c_and_c++
FILES			+= run_me_once.sh
FILES			+= depend.sh
FILES			+= translate.sh
FILES			+= backup.sh
FILES			+= distclean.sh
FILES			+= zip.sh
FILES			+= create_project.sh
FILES			+= create_version.sh
FILES			+= install_bin.sh install_lib.sh install_locale.sh
FILES			+= bin_dist.sh
FILES			+= Makefile.cobol
FILES			+= Makefile.cweb_and_noweb
FILES			+= Makefile.documentation
FILES			+= Makefile.flex_and_bison
FILES			+= Makefile.FORTRAN
FILES			+= Makefile.latex
FILES			+= Makefile.modula2
FILES			+= Makefile.pascal
FILES			+= check.texinfo the_version.texinfo check.d
FILES			+= project.txt
FILES			+= version.txt
FILES			+= author.txt author_email.txt license.txt
FILES			+= maintainer.txt maintainer_email.txt
FILES			+= updated.txt url.txt description.txt years.txt
FILES			+= $(PROJECT).cppcheck

# use this for your c++ source files (uncomment for use with your c++-file):
#CCSOURCES.cc		:= #
#CCSOURCES.cpp		:= #
#CCSOURCES.c++		:= #
#CCSOURCES.cxx		:= #
#CCSOURCES.C		:= #

#CCOBJS.cc		:= #
#CCOBJS.cpp		:= #
#CCOBJS.c++		:= #
#CCOBJS.cxx		:= #
#CCOBJS.C		:= #

#CCSOURCES.cc		+= check1.cc
#CCSOURCES.cpp		+= check2.cpp
#CCSOURCES.c++		+= check3.c++
#CCSOURCES.cxx		+= check4.cxx
#CCSOURCES.C		+= check5.C

#CCOBJS.cc		+= $(CCSOURCES.cc:%.cc=%.o)
#CCOBJS.cpp		+= $(CCSOURCES.cpp:%.cpp=%.o)
#CCOBJS.c++		+= $(CCSOURCES.c++:%.c++=%.o)
#CCOBJS.cxx		+= $(CCSOURCES.cxx:%.cxx=%.o)
#CCOBJS.C		+= $(CCSOURCES.C:%.C=%.o)

# you have to uncomment these, if you use c++:
#CCSOURCES		+= $(CCSOURCES.cc) $(CCSOURCES.cpp) $(CCSOURCES.c++) \
			   $(CCSOURCES.cxx) $(CCSOURCES.C)
#FILES			+= $(CCSOURCES.cc) $(CCSOURCES.cpp) $(CCSOURCES.c++) \
			   $(CCSOURCES.cxx) $(CCSOURCES.C)
#CCOBJS			+= $(CCOBJS.cc) $(CCOBJS.cpp) $(CCOBJS.c++) \
			   $(CCOBJS.cxx) $(CCOBJS.C)
#OBJS			+= $(CCOBJS)

LIB1CFILES		:= minmax.c getlocaledir.c
LIB1CFILES2		:= getch.c
CSOURCES		+= $(LIB1CFILES)
FILES			+= $(LIB1CFILES)
LIB1HFILES		:= types.h gettext.h clrscr.h macros.h
LIB1HFILES		+= $(LIB1CFILES:%.c=%.h)
FILES			+= $(LIB1HFILES)
FILES			+= $(LIB1CFILES2)
FILES			+= $(LIB1CFILES2:%.c=%.h)
CDEPENDS		+= $(LIB1CFILES:%.c=%.d)
LIB1OBJS		:= $(LIB1CFILES:%.c=%.ol)
ifeq ($(machtype),Linux)
  CSOURCES		+= $(LIB1CFILES2)
  CDEPENDS		+= $(LIB1CFILES2:%.c=%.d)
  LIB1OBJS		+= $(LIB1CFILES2:%.c=%.ol)
endif 
ifeq ($(machtype),Arm)
  CSOURCES		+= $(LIB1CFILES2)
  CDEPENDS		+= $(LIB1CFILES2:%.c=%.d)
  LIB1OBJS		+= $(LIB1CFILES2:%.c=%.ol)
endif 
ifeq ($(machtype),MacOS)
  CSOURCES		+= $(LIB1CFILES2)
  CDEPENDS		+= $(LIB1CFILES2:%.c=%.d)
  LIB1OBJS		+= $(LIB1CFILES2:%.c=%.ol)
endif 
OBJS			+= $(LIB1OBJS)
LIB1RARYNAME		:= subs
LIB1RARY		:= lib$(LIB1RARYNAME).a

LOADLIBES		:= -l$(LIB1RARYNAME)

LIBRARIES		+= $(LIB1RARY)

CMAINFILE		:= main.c
CSOURCES		+= $(CMAINFILE)
CDEPENDS		+= $(CMAINFILE:%.c=%.d)
FILES			+= $(CMAINFILE)
MAINOBJS		:= $(CMAINFILE:%.c=%.o)
OBJS			+= $(MAINOBJS)

CLEAN			= $(strip $(filter %.o,$(OBJS)) \
		            $(filter %.osl,$(OBJS)) \
		            $(filter %.ol,$(OBJS)) \
			    $(LIBRARIES) $(PROGRAMS) \
			    $(INFOFILE) $(XMLFILE) \
			    $(TXTFILE) $(PDFOUTPUT) \
			   )
CLEANDIRS		= $(strip $(HTMLDIR) $(CPPCHECKDIR))

PROGRAM1		:= $(PROJECT)
#PROGRAM2		:= $(PROJECT)

PROGRAMS		:= $(PROJECT_FILES) $(strip $(PROGRAM1) $(PROGRAM2))

.PHONY:			all
all:			$(PROGRAMS)
			@echo done.

.PHONY:			install
install:		$(PROJECT_FILES) $(PROGRAMS)
			@sh ./install_bin.sh $(BINDIR) $(PROGRAM1) $(PROGRAM2)
#			@sh ./install_lib.sh $(LIBDIR) $(LIB2RARY)
			@sh ./install_locale.sh $(LOCALEDIR) $(PROJECT).mo

.PHONY:			bin_dist
bin_dist:		$(PROJECT_FILES) $(PROGRAMS)
			@sh ./bin_dist.sh $(PROGRAM1) $(PROJECT) $(SHARED_LIBS)
#			@sh ./bin_dist.sh $(PROGRAM2) $(PROJECT) $(SHARED_LIBS)

.PHONY:			strip
strip:			$(PROGRAMS)
			$(STRIP) $(PROGRAMS)

.PHONY:			debug
debug:
			@echo "$$""(CLEAN)=$(strip $(CLEAN))"
			@echo "$$""(CLEANDIRS)=$(strip $(CLEANDIRS))"
			@echo "$$""(OBJS)=$(strip $(OBJS))"
			@echo "$$""(FILES)=$(strip $(FILES))"
			@echo "$$""(CSOURCES)=$(strip $(CSOURCES))"
			@echo "$$""(CCSOURCES)=$(strip $(CCSOURCES))"
			@echo "$$""(CDEPENDS)=$(strip $(CDEPENDS))"
			@echo "$$""(CCDEPENDS)=$(strip $(CCDEPENDS))"
			@echo "$$""(OBJS1)=$(strip $(OBJS1))"
			@echo "$$""(PROGRAMS)=$(strip $(PROGRAMS))"
			@echo "$$""(PC)=$(strip $(PC))"
			@echo "$$""(DATETIME)=$(strip $(DATETIME))"
			@echo "$$""(LIB1OBJS)=$(strip $(LIB1OBJS))"

.PHONY:			debugger
debugger:		$(PROGRAM1)
			$(debug)

.PHONY:			lint
lint:
			$(LINT) $(LINTFLAGS) .

.PHONY:			prof
prof:			$(PROGRAM1)
			$(PROGRAM1)
			$(PROF) $(PROGRAM1) $(GMONFILE) > $(PROFFILE)
			$(NM) $(NMFLAGS) $(PROGRAM1) > $(NMFILE)

.PHONY:			doc
doc:			$(INFOFILE) $(XMLFILE) $(TXTFILE) \
			$(HTMLFILE)
			# $(PDFFILE) 

$(PROGRAM1):		$(LIB1RARY) $(CDEPENDS) $(MAINOBJS)
			$(link.c)

#$(PROJECT):			$(CCOBJS)
#			$(link.cc)

$(LIB1RARY):		$(LIB1OBJS)
			$(static_library)

.PHONY:			clean
clean:
			$(RM) $(CLEAN)
			$(RM) -r $(CLEANDIRS)
ifeq ($(machtype),MacOS)
			$(RM) -r $(PROJECT).dSYM
endif

.PHONY:			distclean
distclean:
			$(RM) -r $(CLEANDIRS)
			@./distclean.sh $(strip $(CDEPENDS) $(CCDEPENDS) $(PRINTFILE) $(GMONFILE) $(PROFFILE) $(NMFILE) $(PROJECT_FILES) $(CLEAN))
ifeq ($(machtype),MacOS)
			$(RM) -r $(PROJECT).dSYM
endif

.PHONY:			print
print:			$(PRINTFILE)

$(PRINTFILE):		$(FILES)
			$(PRINT) $?
			$(TOUCH) $(PRINTFILE)

.PHONY:			dummy
dummy:

project.h:		project.txt author.txt author_email.txt license.txt maintainer.txt maintainer_email.txt url.txt description.txt years.txt create_project.sh
			@echo "creating $@"
			@./create_project.sh $@

version.h:		version.txt author.txt updated.txt create_version.sh
			@echo "creating $@"
			@./create_version.sh $@

.PHONY:			create_project
create_project:		project.h version.h

.PHONY:			update_version
update_version:		version.h

#.PHONY:			depend
#depend:
#			echo "# automatically created" \
#			     "$(DATETIME)" \
#			     "by \"make depend\"" > $(DEPENDFILE)
#ifneq ($(strip $(CSOURCES)),)
#			$(DEPEND.c) $(CSOURCES) >> $(DEPENDFILE)
#endif
#ifneq ($(strip $(CCSOURCES)),)
#			$(DEPEND.cc) $(CCSOURCES) >> $(DEPENDFILE)
#endif

.PHONY:			depend
depend:			$(CDEPENDS) $(CCDEPENDS) ;

.PHONY:			backup
backup:
			@./backup.sh $(BACKUPDIR) $(TARFILE) $(strip $(FILES))

.PHONY:			zip
zip:
			@./zip.sh $(BACKUPDIR) $(ZIPFILE) $(strip $(FILES))

.PHONY:			translate
translate:
			@./translate.sh

#
# include a dependency file if one exists
#
#ifeq ($(DEPENDFILE),$(wildcard $(DEPENDFILE)))
#  include $(DEPENDFILE)
#endif

#
# include dependency files if exists
#
ifneq (,$(wildcard *.d))
  include *.d
endif

# vim:ai sw=2 noexpandtab

