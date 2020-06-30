#!/bin/bash
rm -rv processor* *e-08 log.* constant/polyMesh/boundary constant/polyMesh/*.gz constant/triSurface/*.gz constant/extendedFeatureEdgeMesh 
if [ -d VTK ] ; then
	rm -rv VTK
fi
