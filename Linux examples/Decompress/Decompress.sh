#Set the name of the Brotli file here
#Use \ to define spaces in the name
#Example: 'My website backup' would be 'My\ website\ backup'
FileName=Example\ Folder.tar.br

export BrotliFile=$FileName\.tar.br
export TarFile=$FileName\.tar

echo "Step one: Decompressing $BrotliFile to Tar archive"


