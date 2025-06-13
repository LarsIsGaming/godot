#!/bin/sh

# exit script on first error, 
# (stops execution any further commands)
set -e

# build the editor with mono support
scons platform=linuxbsd

# get thea absolute path to the godot executable
EXE=$(readlink -f ./bin/godot*)

# create a symlink to the godot executable in the local bin directory
ln -sf $EXE ~/.local/bin/godot

# Generate .net glue sources
$EXE --headless --generate-mono-glue modules/mono/glue

dotnet nuget add source ~/local_nuget --name MyLocalNugetSource

# Build .NET assemblies
./modules/mono/build_scripts/build_assemblies.py --godot-output-dir=./bin --godot-platform=linuxbsd --precision=double --push-nupkgs-local ~/local_nuget
