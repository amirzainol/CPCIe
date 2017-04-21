# Nmake macros for building Windows 32-Bit apps

!include <Win32.Mak>

all: $(OUTDIR) $(OUTDIR)\xcr.exe $(OUTDIR)\xcw.exe

#----- If OUTDIR does not exist, then create directory
$(OUTDIR) :
    if not exist "$(OUTDIR)/$(NULL)" mkdir $(OUTDIR)

$(OUTDIR)\xcr.obj: xcr.c
    $(cc) -D_CRT_SECURE_NO_WARNINGS $(cflags) $(cvars) /WX /Fo"$(OUTDIR)\\" /Fd"$(OUTDIR)\\" xcr.c

$(OUTDIR)\xcr.exe: $(OUTDIR)\xcr.obj
    $(link) $(conflags) -out:$(OUTDIR)\xcr.exe $(OUTDIR)\xcr.obj $(conlibs)
	
$(OUTDIR)\xcw.obj: xcw.c
    $(cc) -D_CRT_SECURE_NO_WARNINGS $(cflags) $(cvars) /WX /Fo"$(OUTDIR)\\" /Fd"$(OUTDIR)\\" xcw.c

$(OUTDIR)\xcw.exe: $(OUTDIR)\xcw.obj
    $(link) $(conflags) -out:$(OUTDIR)\xcw.exe $(OUTDIR)\xcw.obj $(conlibs)
	
#--------------------- Clean Rule --------------------------------------------------------
# Rules for cleaning out those old files
clean:
        $(CLEANUP)
