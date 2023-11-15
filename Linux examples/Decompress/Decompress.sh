#Set the name of the Brotli file here
#Use \ to define spaces in the name
#Example: 'My website backup' would be 'My\ website\ backup'
export FileName=Example\ Folder.tar.br

export BrotliFile=$FileName\.tar.br
export TarFile=$FileName\.tar

echo "Step one: Decompressing $BrotliFile to Tar archive"

./brotli -d $BrotliFile -o $TarFile

echo "Step two: Extracting files from $TarFile to a directory"

mkdir $FileName
tar -xf $TarFile -C $FileName

echo "Step three: deleting extra files"

rm $BrotliFile
rm $TarFile
rm brotli

#todo: use dpkg --print-architecture to choose correct file

