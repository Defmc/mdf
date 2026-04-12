#!/bin/sh

p="$(find ~/dev -maxdepth 1 -mindepth 1 -type d | fuzzel --dmenu)"

cd $p && foot nvim #MESA_GL_VERSION_OVERRIDE=3.3 MESA_GLSL_VERSION_OVERRIDE=330 neovide
