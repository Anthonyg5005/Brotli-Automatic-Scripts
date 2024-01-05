#Remember, when editing this file, you need to use a text editor that can save in UNIX format.
#For example, setting vsc from CRLF to LF will fix this issue.
#For vim users, you can use :set ff=unix to fix this issue.
#For Notepad++, you can right click Windows (CR LF) and change it to Unix (LF).
#If you open this in any of those programs you won't need to change anything. Windows Notepad is supported but unable to switch between formats.

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

#Remove from here and replace with './brotli -d "$BrotliFile" -o "$TarFile"' if you are using a different architecture.
if [ "$arch" = "x86_64" ]; then
    ./brotli -d "$BrotliFile" -o "$TarFile"
elif [ "$arch" = "aarch64" ]; then
    ./brotli-aarch64 -d "$BrotliFile" -o "$TarFile"
else
    echo "Unsupported architecture: $arch"
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
#Remove brotli-aarch64 if you replaced brotli with your target architecture.

echo "Files are now decompressed and extracted to $FileName"
read -n1 -r -p "Press any key to continue..."