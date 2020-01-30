# Software License Agreement
# 
#     Copyright(C) 1994-2019 David Lindauer, (LADSoft)
# 
#     This file is part of the Orange C Compiler package.
# 
#     The Orange C Compiler package is free software: you can redistribute it and/or modify
#     it under the terms of the GNU General Public License as published by
#     the Free Software Foundation, either version 3 of the License, or
#     (at your option) any later version.
# 
#     The Orange C Compiler package is distributed in the hope that it will be useful,
#     but WITHOUT ANY WARRANTY; without even the implied warranty of
#     MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
#     GNU General Public License for more details.
# 
#     You should have received a copy of the GNU General Public License
#     along with Orange C.  If not, see <http://www.gnu.org/licenses/>.
# 
#     contact information:
#         email: TouchStone222@runbox.com <David Lindauer>
# 

ifneq "$(COMPILER)" "gcc-linux"
SHELL=cmd.exe
endif

ZIP:="c:/program files/7-zip/7z" -tzip -bd

OCC_VERSION := $(word 3, $(shell cmd /C type \orangec\src\version.h))
OCC_VERSION := $(subst ",,$(OCC_VERSION))
export OCC_VERSION
VERNAME := $(subst .,,$(OCC_VERSION))

DISTEXE=/ocide/dist/ZippedBinaries$(VERNAME).zip
DISTSRC=/ocide/dist/ZippedSources$(VERNAME).zip

DISTRIBUTE:
ifneq "$(ORANGEC_ONLY)" "YES"
	-del $(subst /,\,$(DISTEXE))
	-del $(subst /,\,$(DISTSRC))
	-mkdir $(DISTROOT)\appdata
	$(ZIP) -r0 a $(DISTEXE) ocide/bin/*.exe ocide/bin/*.pdb ocide/bin/*.app ocide/bin/*.spc ocide/bin/*.dll ocide/bin/*.cfg  ocide/bin/general.props
	$(ZIP) a $(DISTEXE) ocide/lib/*.* ocide/include/*.* ocide/examples/*.* ocide/doc/*.* ocide/license/*.* 
	$(ZIP) a $(DISTEXE) ocide/lib/* ocide/include/* ocide/examples/* ocide/doc/* ocide/license/*
	$(ZIP) d $(DISTEXE) doc/tools.htm
	$(ZIP) a $(DISTEXE) ocide/rule/*.rul ocide/help/*.* ocide/addon/*.* ocide/appdata
	$(ZIP) a $(DISTEXE) ocide/license.txt ocide/readme.txt ocide/relnotes.txt
	$(ZIP) -r0 -xr@ocide/src/xclude.lst a $(DISTSRC) ocide/src/*.adl ocide/src/*.cpp ocide/src/*.c ocide/src/*.h ocide/src/*.nas ocide/src/*.ase ocide/src/*.asi ocide/src/*.inc ocide/src/*.p ocide/src/*.rc ocide/src/*.spc ocide/src/*.app ocide/src/*.cfg ocide/src/makefile* ocide/src/*.mak ocide/src/*.txt ocide/src/copying ocide/src/*.def ocide/src/*.lst 
	$(ZIP) -r0 -xr@ocide/src/xclude.lst a $(DISTSRC) ocide/src/ocl/ocl.lic ocide/src/clibs/cpp/* ocide/src/clibs/platform/copyrght.asm ocide/src/help/*.* ocide/doc/*.*
	$(ZIP) -r0 a $(DISTSRC) ocide/src/clibs/platform/dos32/extender/*.* ocide/src/clibs/platform/dos32/extender/*
	$(ZIP) -r0 a $(DISTSRC) ocide/src/*.vcxproj ocide/src/*.vcxproj.filters ocide/src/*.sln
	$(ZIP) a $(DISTSRC) ocide/src/ocide/fonts/ttf-bitstream-vera-1.10/*.* ocide/src/ocide/res/*.* ocide/src/ocide/rule/*.rul ocide/src/ocide/rule/*.props
	$(ZIP) a $(DISTSRC) ocide/src/*.exe ocide/src/*.iss ocide/src/*.bmp ocide/src/config.bat ocide/src/ocidehld.bat
	$(ZIP) a $(DISTSRC) ocide/src/LICENSE.TXT ocide/license/*.* ocide/src/readme.txt ocide/src/relnotes.txt
	$(ZIP) a $(DISTSRC) ocide/src/clibs/repobj.bat ocide/src/copying ocide/src/ocl.lic ocide/src/addon.txt
#	"/program files (x86)/inno setup 6/iscc" /Q /FWindowsInstaller$(VERNAME) /O/ocide/dist ocide/src/occ.iss
	-rmdir $(DISTROOT)\appdata
endif
