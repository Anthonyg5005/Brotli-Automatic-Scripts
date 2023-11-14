@echo off

setlocal

set FileName=Example Folder

set BrotliFile="%FileName%.tar.br"
set TarFile="%FileName%.tar"

echo Wait as %BrotliFile% is decompressing

echo Step 1: Decompressing Brotli file to TAR archive
Brotli\bin\Brotli.exe -d %BrotliFile% -o %TarFile%

echo Step 2: Extracting contents of %TarFile% to a folder
tar -xf %TarFile%

echo Step 3: Deleting extra files
del %TarFile%
del %BrotliFile%
rmdir /S /Q Brotli
del tar.exe

echo Extraction complete. Files are available in the "%FileName%" folder.
pause
