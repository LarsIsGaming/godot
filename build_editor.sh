#!/bin/sh

# build the editor with mono support
scons editor

# Generate glue sources
godot --headless --generate-mono-glue modules/mono/glue

# Build .NET assemblies
./modules/mono/build_scripts/build_assemblies.py --godot-output-dir=./bin --godot-platform=linuxbsd
