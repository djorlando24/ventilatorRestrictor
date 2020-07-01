#!/bin/bash
#
#    OPENFOAM SNAPPYHEXMESH CLEAN UP SCRIPT
#
#    author Daniel Duke <daniel.duke@monash.edu>
#    copyright (c) 2020 Daniel Duke
#    license GPL-3.0+
#    version 1.0.0
#    date 01/07/2020
#        __   ____________    ___    ______
#       / /  /_  ____ __  \  /   |  / ____/
#      / /    / /   / /_/ / / /| | / /
#     / /___ / /   / _, _/ / ___ |/ /_________
#    /_____//_/   /_/ |__\/_/  |_|\__________/
#
#    Laboratory for Turbulence Research in Aerospace & Combustion (LTRAC)
#    Monash University, Australia

rm -rv processor* *e-08 log.* constant/polyMesh/boundary constant/polyMesh/*.gz constant/triSurface/*.gz constant/extendedFeatureEdgeMesh 
if [ -d VTK ] ; then
	rm -rv VTK
fi
