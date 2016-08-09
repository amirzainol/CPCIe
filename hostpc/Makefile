# Nmake macros for building Windows 32-Bit apps

!include <Win32.Mak>

all: $(OUTDIR) $(OUTDIR)\xw.exe $(OUTDIR)\xr.exe 

#----- If OUTDIR does not exist, then create directory
$(OUTDIR) :
    if not exist "$(OUTDIR)/$(NULL)" mkdir $(OUTDIR)
	
$(OUTDIR)\xw.obj: xw.c
    $(cc) -D_CRT_SECURE_NO_WARNINGS $(cflags) $(cvars) /WX /Fo"$(OUTDIR)\\" /Fd"$(OUTDIR)\\" xw.c

$(OUTDIR)\xw.exe: $(OUTDIR)\xw.obj
    $(link) $(conflags) -out:$(OUTDIR)\xw.exe $(OUTDIR)\xw.obj $(conlibs)
	
$(OUTDIR)\xr.obj: xr.c
    $(cc) -D_CRT_SECURE_NO_WARNINGS $(cflags) $(cvars) /WX /Fo"$(OUTDIR)\\" /Fd"$(OUTDIR)\\" xr.c

$(OUTDIR)\xr.exe: $(OUTDIR)\xr.obj
    $(link) $(conflags) -out:$(OUTDIR)\xr.exe $(OUTDIR)\xr.obj $(conlibs)

#--------------------- Clean Rule --------------------------------------------------------
# Rules for cleaning out those old files
clean:
        $(CLEANUP)
