Install binary packages in a temporary Cabal sandbox
====================================================



Motivation
----------

A common task to use Cabal for is to install binary packages. In order not to
pollute the global package space, this is often done in a sandbox. This small
script automates this process for packages that support it.

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



Programs tested with
--------------------

This process does obviously only work for relocatable binaries. The most common
non-relocatable types of binaries are dynamically linked ones and those that
need external data files. That said, many (if not all) binaries I've installed
for myself over the years were relocatable. Check whether the process worked
after building!

### Successful

Program   | `--version` | package name
----------|-------------|-------------
Alex      | 3.1.4       | alex-3.1.4
C2Hsc     | 0.6.4       | c2hsc-0.6.5
Cabal     | 1.22.0.0    | cabal-install-1.22.0.0
GHC Core  | n/a         | ghc-core-0.5.6
Happy     | 1.19.5      | happy-1.19.5
HLint     | 1.9.15      | hlint-1.9.15
HsColour  | 1.20        | hscolour-1.20.3

### Unsuccessful

Program   | package name | Problem
----------|--------------|-----------------------------------------------------
(None so far!) | |