Installing standalone binaries using Cabal
==========================================



Motivation
----------

A common task to use Cabal for is to install binary packages. In order not to
pollute the global package space, this is often done in a sandbox. This small
bash script automates this process for packages that support it.

More accurately, the script does the following:

1. Create a temporary directory
2. Initialize a Cabal sandbox
3. Build the desired binaries. Link statically, build with minimal profiling
   overhead (no profiling, no shared libs, no Haddock).
4. Move all built binaries to `$HOME/.cabal/bin` (prompting on collision
   via `mv -i`)
5. Delete temporary directory

Usage
-----

`cabal-install-bin (package)+`



Pitfalls
--------

This process does obviously only work for relocatable binaries. The most common
non-relocatable types of binaries are dynamically linked ones and those that
need external data files. That said, many (if not all) binaries I've installed
for myself over the years were relocatable. Check whether the process worked
after building!