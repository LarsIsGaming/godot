#!/bin/bash

PLATFORM=linuxbsd
FLAGS=(
    # build with .net support
    module_mono_enabled=yes

    # generate a visual studio solution for Rider to use
    vsproj=yes

    # generate debug symbols for Rider editor attachment
    dev_build=yes
)

# build the editor with mono support
scons -j8 platform=$PLATFORM ${FLAGS[@]}

# Generate glue sources
bin/godot.$PLATFORM.editor.x86_64.mono --headless --generate-mono-glue modules/mono/glue
# Build .NET assemblies
./modules/mono/build_scripts/build_assemblies.py --godot-output-dir=./bin --godot-platform=$PLATFORM
