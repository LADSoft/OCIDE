# OCIDE

 ** OCIDE**  is an integrated development environment (IDE).  

## Installing OCIDE alongside ORANGEC

1. To use OCIDE alongside orange C, first install orange c (or build it).
2. Then go to the releases folder on the OCIDE page in github, and retrieved the ZippedBinaries*.zip file.   
3. Unzip the contents to some location on your computer.
4. go into the 'ocide' folder and select all contents.  (if you don't want to overwrite the original license or release notes files from Orange C only select the directories).
5. Copy the selected contents into the root folder of the orange c install.   This will normally be something like "c:\Program Files (x86)\OrangeC" for an install or the 'orangec' directory wherever you put the sources to build from.
6. Accept the prompt when it asks if you want to overwrite files

now OCIDE should be installed.   A couple of things to be aware of before using it:

1. You need the ORANGEC environment variable to be set.   If you installed OrangeC it should be by default; if you downloaded the sources you need to do something similar to:

>    set ORANGEC=C:\ORANGEC

but use the path you installed ORANGEC into, e.g. the same path you copied the files for OCIDE into.

2. There may be some glitches if you don't use a version of OrangeC that is compiled with itself.   Such as the installed version.   There are some incompatibilities in other tool's runtime libraries that may disable certain OCIDE features.


## Command Line Options

Most IDE features are best documented in the IDE help files, however there are a few command line options that may be useful, which are documented here.

 The general format of an **OCIDE** command line is:
 
>     OCIDE [options] [list of files]
 
where options are various command line options that can be used to customize the behavior, and the list of files lists files that the IDE should open for editing.


### Help

To view a reminder of what the command line options are, type:

>     OCIDE -h

or

>     OCIDE -?


### Clearing files on startup

To clear files on startup use the **-c** switch

There are two options, which can be combined:

>     OCIDE -cf

closes all edit windows

whereas

>     OCIDE -cw

closes all projects in the selected workspace.

One can also do:

>     OCIDE -cfw

to clear both or

>     OCIDE -c

which is shorthand for the -cf switch

### Loading a workarea

>     OCIDE -wmyworkarea.cwa

loads the workarea myworkarea

### Loading a project

>     OCIDE -pmyproject.exe.cpj

loads the project myproject.exe


One can cascade a workarea and project:

>     OCIDE -wmyworkarea.cwa -pmyproject.exe.cpj

opens myworkarea then loads myproject.exe

At present only one project can be selected on the command line