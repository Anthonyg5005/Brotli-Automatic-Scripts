# Brotli scripts

This is something I decided to make on my phone during class because it *could* be useful to someone.

I made the original for Windows a while ago while sending [Brotli](https://github.com/google/brotli) archives to friends to help them easily decompress them. I changed it to be much more easily configured to any file.

The way this is setup is to keep all files until the decompression is done. This means you should have at least ×3 of the original file size available on your drive. I'll add a storage optimized which could bring it down to ×1.75 of the original file size.

## Why use Brotli

I chose this compression format for it's fast decompression and good compression ratio. These decompression scripts make it easier for anyone who doesn't have 7zip installed and uses less bandwidth than zip for it's better compression. Compression ratio for Brotli is close to 7zip.

## Downsides of Brotli

Brotli compression is **very** slow. Depending on the size of the folder, it may take hours for many GBs of data. This is why I usually use my phone to compress Tar archives to Brotli with tools like Termius to copy using SFTP and Termux for the terminal.

## Supported platforms

I've only built Brotli for **Windows x86_64**, **Linux x86_64**, and **Linux aarch64**. The scripts should work if you compile Brotli for your platform and have Tar installed. *Windows 11, and most Linux distros, have Tar preinstalled*
