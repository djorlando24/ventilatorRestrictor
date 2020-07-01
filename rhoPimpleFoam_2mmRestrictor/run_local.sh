#!/bin/bash
#
#    OPENFOAM MPIRUN SCRIPT
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

# which solver to use
app=rhoPimpleFoam

# Load Foam-Extend 3.2
source ~/foam/foam-extend-3.2/etc/bashrc

# Find number of processors
ncpu=`grep -e 'numberOfSubdomains' system/decomposeParDict  | cut -d' ' -f2 | tr -d \;`
echo "$ncpu PROCESSORS IN decomposeParDict"

# Decompose case from latest time step
if [ ! -d processor0 ] ; then
	decomposePar | tee log.decomposePar
fi

# check mesh
if [ ! -f log.checkMesh ] ; then
	nice mpirun -np $ncpu checkMesh -parallel -latestTime | tee log.checkMesh
fi

# Move old logs aside
if [ -f log.$app ] ; then
	move_logs.sh log.$app
fi

# Run $app
time {
	echo "$app starting"
	date;echo
    
	nice -n 1 mpirun -np $ncpu --mca opal_set_max_sys_limits 1 $app -parallel | tee log.$app

	echo "$app stopped"
	date
}

if [[ $1 == "-noemail" ]] ; then
	echo "No email sent"
	exit
fi

exit # stop 
