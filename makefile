#======================================== User/local variables========================================
F03 = gfortran
INCLUDE_PATH := $(HOME)/.rsg_libs/include

#======================================== Setup commandline flags ========================================

MY_LIBRARIES = 3N2_direct_PES : asymptote : init_eval : gp-oo : 2N2_PES_Feb23
ALL_LIBRARIES = $(STANDARD_LIBRARIES): $(MY_LIBRARIES)

FCFLAGS = -O3 -I$(INCLUDE_PATH)
FLFLAGS = ${subst :, -l,$(ALL_LIBRARIES)} -L $(HOME)/.rsg_libs/


#======================================== Compilation  ========================================

SOURCES= main.f90
OBJECTS = $(addsuffix .o,$(basename $(SOURCES)))
PRODUCT= a.out
VPATH=./


$(PRODUCT): $(OBJECTS)
	$(F03) $(FLFLAGS) -o  $@ $^

%.o: %.f03
	$(F03) -c $(FCFLAGS) -o $@ $<


clean:
	rm -f *.o
	rm $(PRODUCT)