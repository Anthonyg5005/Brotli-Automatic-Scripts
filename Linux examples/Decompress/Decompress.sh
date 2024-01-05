export FileName=Example\ Folder

export BrotliFile=$FileName.tar.br
export TarFile=$FileName.tar
arch=$(uname -m)

chmod +x brotli
chmod +x brotli-aarch64

echo "Step one: Decompressing $BrotliFile to Tar archive"

if [ "$arch" = "x86_64" ]; then
    ./brotli -d "$BrotliFile" -o "$TarFile"
elif [ "$arch" = "aarch64" ]; then
    ./brotli-aarch64 -d "$BrotliFile" -o "$TarFile"
else
    echo "Unsupported architecture for this example: $arch"
    read -n 1 -s -r -p "Press any key to exit"
    exit 1
fi

echo "Step two: Extracting files from $TarFile to a directory"

tar -xf "$TarFile" -C "$FileName"

echo "Step three: deleting extra files"

rm "$BrotliFile"
rm "$TarFile"
rm brotli
rm brotli-aarch64

echo "Files are now decompressed and extracted to $FileName"
read -n1 -r -p "Press any key to continue..."