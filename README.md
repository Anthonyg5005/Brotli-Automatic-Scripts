# Brotli scripts

This is something I decided to make on my phone during class because it *could* be useful to someone.

I made the original for Windows a while ago while sending [Brotli](https://github.com/google/brotli) archives to friends to help them easily decompress them. I changed it to be much more easily configured to any file.

## Why use Brotli

I chose this compression format for it's fast decompression and good compression ratio. These decompression scripts make it easier for anyone who doesn't have 7zip installed and uses less bandwidth than zip for it's better compression. Compression ratio is close to 7zip.

## Downsides of Brotli

Brotli compression is **very** slow. Depending on the size of the folder, it may take hours for many GBs of data. This is why I usually use my phone to compress Tar archives to Brotli with tools like Termius to copy using SFTP and Termux for the terminal.
