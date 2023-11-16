@echo off

setlocal

REM Example: 'backup file.tar.br' should be set as 'backup file'
set FileName=Compressed file name

set BrotliFile="%FileName%.tar.br"
set TarFile="%FileName%.tar"

echo Wait as %BrotliFile% is decompressing

echo Step 1: Decompressing Brotli file to TAR archive
Brotli\bin\Brotli.exe -d %BrotliFile% -o %TarFile%

echo Step 2: Extracting contents of %TarFile% to a folder
tar -xf %TarFile%

REM Remove anything that should be saved from the list below
echo Step 3: Deleting extra files
del %TarFile%
del %BrotliFile%
rmdir /S /Q Brotli
del tar.exe

echo Extraction complete. Files are available in the "%FileName%" folder.
pause
