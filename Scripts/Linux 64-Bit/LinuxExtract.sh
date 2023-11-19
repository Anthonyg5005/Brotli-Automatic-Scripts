#Remember, when editing this file, you need to use a text editor that can save in UNIX format.
#If you use a text editor that saves in Windows format, the script will not work.
#For example, setting vsc from CRLF to LF will fix this issue.
#For vim users, you can use :set ff=unix to fix this issue.

#Set the name of the Brotli file here
#Use \ to define spaces in the name
#Example: 'My website backup' would be 'My\ website\ backup'
#Do not add the .tar.br extension
export FileName=Archive\ Name

export BrotliFile=$FileName.tar.br
export TarFile=$FileName.tar
arch=$(uname -m)

chmod +x brotli
chmod +x brotli-aarch64

echo "Step one: Decompressing $BrotliFile to Tar archive"

#Remove from here and replace with "./brotli -d "$BrotliFile" -o "$TarFile"" if you are using a different architecture
if [ "$arch" = "x86_64" ]; then
    ./brotli -d "$BrotliFile" -o "$TarFile"
elif [ "$arch" = "aarch64" ]; then
    ./brotli-aarch64 -d "$BrotliFile" -o "$TarFile"
else
    echo "Unsupported architecture for this example: $arch"
    read -n 1 -s -r -p "Press any key to exit"
    exit 1
fi
#To here

echo "Step two: Extracting files from $TarFile to a directory"

tar -xf "$TarFile" -C "$FileName"

echo "Step three: deleting extra files"

rm "$BrotliFile"
rm "$TarFile"
rm brotli
rm brotli-aarch64

echo "Files are now decompressed and extracted to $FileName"