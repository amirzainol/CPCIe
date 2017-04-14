# Nmake macros for building Windows 32-Bit apps

!include <Win32.Mak>

all: $(OUTDIR) $(OUTDIR)\streamread.exe $(OUTDIR)\streamwrite.exe

#----- If OUTDIR does not exist, then create directory
$(OUTDIR) :
    if not exist "$(OUTDIR)/$(NULL)" mkdir $(OUTDIR)

$(OUTDIR)\streamread.obj: streamread.c
    $(cc) -D_CRT_SECURE_NO_WARNINGS $(cflags) $(cvars) /WX /Fo"$(OUTDIR)\\" /Fd"$(OUTDIR)\\" streamread.c

$(OUTDIR)\streamread.exe: $(OUTDIR)\streamread.obj
    $(link) $(conflags) -out:$(OUTDIR)\streamread.exe $(OUTDIR)\streamread.obj $(conlibs)

$(OUTDIR)\streamwrite.obj: streamwrite.c
    $(cc) -D_CRT_SECURE_NO_WARNINGS $(cflags) $(cvars) /WX /Fo"$(OUTDIR)\\" /Fd"$(OUTDIR)\\" streamwrite.c

#--------------------- Clean Rule --------------------------------------------------------
# Rules for cleaning out those old files
clean:
        $(CLEANUP)
