# Brotli scripts

This is something I decided to make on my phone during class because it *could* be useful to someone.

I made the original for Windows a while ago while sending [Brotli](https://github.com/google/brotli) archives to friends to help them easily decompress them. I changed it to be much more easily configured to any file.

The way this is set up is to keep all files until the decompression is done. This means you should have at least ×3 of the original file size available on your drive. I'll make it more storage optimized which could bring it down to about ×1.75 of the original file size but still recommend ×2.

## Why use Brotli

I chose this compression format for it's fast decompression and good compression ratio. These decompression scripts make it easier for anyone who doesn't have 7zip installed and uses less bandwidth when sharing files than zip for it's better compression. Compression ratio for Brotli is close to 7zip.

## Downsides of Brotli

Brotli compression is **very** slow. It may take hours for folders with more than a few MBs of data.

## Supported platforms

I've only built Brotli for **Windows x86_64** (now replaced with *[offical precompiled binary](https://github.com/google/brotli/releases/tag/v1.1.0))*, **Linux x86_64**, and **Linux aarch64**. The scripts should work if you compile Brotli for your platform and have Tar installed. *Windows 11, Windows 10 build 17063 or later, and Linux have Tar preinstalled*

***Haven't tested included tar.exe on a computer without it preinstalled***

## Progress

So far I only have examples for Linux and Windows. For Linux I only have decompression scripts. For Windows I have both decompression and compression.

On Windows I also included a compression script that automatically adds a decompression script for the archived file into a folder. *This allows for faster sharing*

### To do

- add compression to linux
- add automatic compression for linux
- optimize for storage
- add instructions
