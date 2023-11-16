@echo off

setlocal

REM Prompt user for the name of the folder
set /p "Folder=Folder name: "

REM Setup variables
set TarFile="%Folder%.tar"
set BrotliFile="%TarFile%.br"

echo Step one: Archive the folder into a Tar

tar -cf %TarFile% %Folder%

echo Step two: Compress the Tar archive into a Brotli file

brotli -Zo %BrotliFile% %TarFile%

echo Step three: Removing %TarFile%

del %TarFile%