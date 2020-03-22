OCIDE
=======

IDE for Orange C

Project Build Status:
[![Build status Appveyor](https://ci.appveyor.com/api/projects/status/1iuwdscdw84e2gja?svg=true)](https://ci.appveyor.com/project/LADSoft/ocide)

OCIDE is the IDE that goes along with [`Orange C`](https://github.com/LADSoft/OrangeC).   
It is written as a plain WIN32 program, using the WIN32 API in the C language.

OCIDE is a very simple IDE.   it supports building and debugging projects.   With helper programs
OBRC and OCCPR various navigation enhancements are enabled.   The navigation enhancements include
browsing, code completion, and debugging, and work via lookups from SQLITE databases generated 
by other tools.

One of the interesting things about the IDE is the make system - compiler and linker properties (for
example) are stored as 'macros' and then the build steps essentially do macro lookups to get the
parameters to use when running compilers and linkers.   The default properties and related build steps
are stored in xml files that are part of the distribution, but, changes to the properties are stored in
the project files.  Adding a new tool becomes a matter of creating the tool, then generating an xml
configuration file to associate the tool with a source file extension.  This configuration file
also specifies any optional parameters the tool can utilize.   Just formatting a configuration file
properly and adding it to the correct place in the distribution is enough to enable the associated tool
as a build tool, and show properties for that tool.

One thing about the IDE - historically there hasn't been a lot of interest in it and there may be
some minor bugs.

OCIDE used to be a part of the ORANGE C toolchain but was split off as that project is going a different direction.
Long term, the Orange C toolchain will use more more modern mechanisms for sharing debug and other kinds of information
with generic IDEs, which will allow some choice of which IDE a user may choose and removes the need for a separate
IDE to be developed along with the toolchain.

For the project's history see the file [`HISTORY.md`](HISTORY.md).

More documentation on OCIDE may be found in ['OCIDE.md'](doc/OCIDE.md) and ['OCIDE.pdf'](doc/OCIDE.pdf).