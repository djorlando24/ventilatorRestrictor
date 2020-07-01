# Mesh generation for 3d printed ventilator splitter and restrictors

    author Daniel Duke <daniel.duke@monash.edu>
    copyright (c) 2020 Daniel Duke
    license GPL-3.0+
    version 1.0.0
    date 30/07/2020
        __   ____________    ___    ______
       / /  /_  ____ __  \  /   |  / ____/
      / /    / /   / /_/ / / /| | / /
     / /___ / /   / _, _/ / ___ |/ /_________
    /_____//_/   /_/ |__\/_/  |_|\__________/

    Laboratory for Turbulence Research in Aerospace & Combustion (LTRAC)
    Monash University, Australia

# User guide

- This case was run using OpenFOAM-v1906, please see: https://www.openfoam.com/releases/openfoam-v1906/

- This case is currently set up to mesh the 2mm restrictor. Swap out STL files in constant/triSurface as required.

- Base mesh resolution is governed by constant/polyMesh/blockMeshDict

- Refinements and final resolution is governed by system/snappyHexMeshDict

- run_local.sh will attempt parallel mesh generation. Number of CPUs must be set in system/decomposeParDict.? files (all must match)

- cleanup.sh will wipe away the mesh and start over, leaving the STL files intact.

- Once the mesh is generated, copy it to your simulation case:

        cp -r 3e-08/polyMesh $MYCASE/constant/
