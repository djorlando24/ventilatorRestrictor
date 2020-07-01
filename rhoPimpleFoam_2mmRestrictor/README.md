# 3D PRINTED VENTILATOR SPLITTER SIMULATION

    author Daniel Duke <daniel.duke@monash.edu>
    copyright (c) 2020 Daniel Duke
    license GPL-3.0+
    version 1.0.0
    date 01/07/2020
        __   ____________    ___    ______
       / /  /_  ____ __  \  /   |  / ____/
      / /    / /   / /_/ / / /| | / /
     / /___ / /   / _, _/ / ___ |/ /_________
    /_____//_/   /_/ |__\/_/  |_|\__________/

    Laboratory for Turbulence Research in Aerospace & Combustion (LTRAC)
    Monash University, Australia

## Simulation settings

- 2 way 3d printed splitter
- one 2mm dia restrictor 
- Ventilator in pressure control mode with empirical profile
  in order to understand how inspiratory time and tidal volume are related.
- Unrestricted lung has 0.1 L/cmH2O compliance
- Restricted lung has 0.2 L/cmH2O compliance
- initial pressure to +5cm H2O (=PEEP)
- Changed swakExpressions to more useful units
- Use new first-order ODE outlet pressure boundary condition with U&Sf
- Vmax = 2.0L, then compliance will drop quickly to zero.

## Before you begin

This simulation uses some advanced OpenFOAM features and tricks. If you're not a seasoned OpenFOAM user,
you may find this confusing. Please read the OpenFOAM user manuals and try some simpler tutorial cases first
if this is your first foray into OpenFOAM!

The software requires swak4foam tools to implement the resistance-compliance boundary condition
that allows outlet pressure to vary as a function of total volume flux. This is done using the groovyBC
plugin for foam-extend.

This example case has been developed using foam-extend-3.2 and swak4foam tools.
You should install that software first:
- https://openfoamwiki.net/index.php/Installation/Linux/foam-extend-3.2
- https://openfoamwiki.net/index.php/Installation/swak4Foam/Downloading#FOAM-Extend_3.0_to_3.2

## User guide

- The cumulative volume flux at the outlet is determined using the fieldAveraging plugin.
This requires initialisation of the UMean field from the initial condition. Thus, the simulation needs to first
be bootstrapped for one time step with the groovyBC for pressure deactivated. This is all set up already in 0.orig,
with the dummy pressure boundary condition in 0.orig/p and the genuine groovyBC boundary condition in 0.orig/p.groovyBC.

- To bootstrap the simulation, copy this directory to 0 and link the system/controlDict.pre to controlDict
	cp -r 0.orig 0
        ln -rs system/controlDict.pre system/controlDict

- Make any changes you want to the ICs in 0, fluid properties in constant, etc.

- Bootstrap the first time step:
        source ~/foam/foam-extend-3.2/etc/bashrc
        rhoPimpleFoam

  This should only take a minute or so. You should now see a new timestep, 1e-06 or similar.

- Replace the original IC with this new initial condition:
        cp -r 1e-06 0

- Now, you will need to swap out the pressure boundary condition. Copy the outlet BCs from 0.orig/p.groovyBC and paste into 0/p.gz,
  overwriting the boundary condition but leaving the internalField data intact. I used vim to do this easily.

- Now replace the controlDict with the one for the proper run:
        rm system/controlDict
        ln -rs system/controlDict.run system/controlDict

- Check the number of CPUs in system/decomposeParDict is suitable for your computer

- Now begin the main run using mpirun with ./run_local.sh
  On my 64-thread AMD machine it took at least a couple of days to fully complete given the mesh resolution!
