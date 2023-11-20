@echo off

setlocal

REM Prompt user for the name of the folder
set Folder=Example Folder

REM Setup variables
set TarFile="%Folder%.tar"
set BrotliFile="%Folder%.tar.br"

echo Step one: Archive the folder into a Tar

tar -cf %TarFile% "%Folder%"

echo Step two: Compress the Tar archive into a Brotli file (Can take a few hours)

mkdir "%Folder%-compressed"
brotli -Zo %BrotliFile% %TarFile%
move %BrotliFile% "%Folder%-compressed"

echo Step three: Removing %TarFile% if exists

del %TarFile%

echo Step four: Add exeuatables to "%Folder%-compressed" folder

copy brotli.exe "%Folder%-compressed"
copy tar.exe "%Folder%-compressed"

echo Step five: Add a batch file to decompress the Brotli file
REM Start of batch file
echo @echo off > "%Folder%-compressed\Click to decompress.bat"
echo setlocal >> "%Folder%-compressed\Click to decompress.bat"
echo echo Wait as %BrotliFile% is decompressing >> "%Folder%-compressed\Click to decompress.bat"
echo echo Step 1: Decompressing Brotli file to TAR archive >> "%Folder%-compressed\Click to decompress.bat"
echo brotli.exe -d %BrotliFile% -o %TarFile% >> "%Folder%-compressed\Click to decompress.bat"
echo echo Step 2: Extracting contents of %TarFile% to a folder >> "%Folder%-compressed\Click to decompress.bat"
echo tar -xf %TarFile% >> "%Folder%-compressed\Click to decompress.bat"
echo echo Step 3: Deleting extra files >> "%Folder%-compressed\Click to decompress.bat"
echo del %TarFile% >> "%Folder%-compressed\Click to decompress.bat"
echo del %BrotliFile% >> "%Folder%-compressed\Click to decompress.bat"
echo del brotli.exe >> "%Folder%-compressed\Click to decompress.bat"
echo del tar.exe >> "%Folder%-compressed\Click to decompress.bat"
echo echo Extraction complete. Files are available in the "%Folder%" folder. >> "%Folder%-compressed\Click to decompress.bat"
echo pause  >> "%Folder%-compressed\Click to decompress.bat"
REM End of batch file

REM Optional, just lets user know when compression is done
echo Playing Windows tada sound
powershell -c (New-Object Media.SoundPlayer "C:\Windows\Media\tada.wav").PlaySync();

pause