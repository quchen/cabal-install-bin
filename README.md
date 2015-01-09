Installing standalone binaries using Cabal
==========================================


A common task to use Cabal for is to install binary packages. In order not to
pollute the global package space, this is often done in a sandbox. This small
bash script automates this process.

1. Create a temporary directory
2. Initialize a Cabal sandbox
3. Build the desired binaries
4. Move all built binaries to `$HOME/.cabal/bin` (prompting on collision
   via `mv -i`)
5. Delete temporary directory