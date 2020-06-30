#!/bin/bash

## * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * //
## PMDI nozzle - D Duke, LTRAC, Monash University
## daniel.duke@monash.edu
## Last Updated 18/04/18
## * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * //


echo "snappyHexMesh local script"
date

# Load OpenFOAM
#source ~/OpenFOAM/OpenFOAM-v1612+/etc/bashrc
source ~/OpenFOAM/OpenFOAM-v1906/etc/bashrc
NCPU=64

. $WM_PROJECT_DIR/bin/tools/RunFunctions

# set decomp method scotch for the decomposition
echo "Setting decompose method scotch..."
cp system/decomposeParDict.2 system/decomposeParDict

# determine surface feature edges
surfaceFeatureExtract | tee log.surfaceFeatureExtract

# base mesh
blockMesh | tee log.blockMesh

# decompose
decomposePar | tee log.decomposePar

# set decomp method ptscotch for snappyHexMesh
echo "Setting decompose method ptscotch..."
cp system/decomposeParDict.1 system/decomposeParDict

# run snappy
mpirun -np $NCPU snappyHexMesh -parallel | tee log.snappyHexMesh

if [ ! -d processor0/3e-08 ] ; then
    echo "I think something went wrong. Stopping"
    exit 1
fi

# Reconstruct mesh
reconstructParMesh -latestTime | tee log.reconstructParMesh

if [ ! -d 3e-08 ] ; then
    echo "I think something went wrong. Stopping"
    exit 1
fi

# transform co-ordinates
#transformPoints -translate '(x y z)' >> log.transformPoints.translate
transformPoints -scale '(1e-3 1e-3 1e-3)' >> log.transformPoints.scale # convert base unit to mm

# Check mesh integrity
checkMesh | tee log.checkMesh
if [ -f 3e-08/polyMesh/sets/skewFaces.gz ] ; then
	foamToVTK -latestTime -faceSet skewFaces | tee log.foamToVTK-skewFaces
fi

# set decomp method scotch for the solver
echo "Setting decompose method scotch..."
cp system/decomposeParDict.2 system/decomposeParDict

# If running without an attached terminal, email me to tell me it's done.
egrep -q "SigIgn:\s.{15}[13579bdf]" /proc/$$/status && email-alert.sh "SnappyHexMesh complete" "$(tail -n 20 log.snappyHexMesh)"

echo "Done."
date

