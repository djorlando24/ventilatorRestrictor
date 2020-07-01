# ventilatorRestrictor
OpenFOAM model for turbulent air flow in a ventilator splitter and restrictor

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

## License

This software is released under the GNU GENERAL PUBLIC LICENSE v3.
You may modify and distribute the code as long as you credit the originating authors of the work.

##  Citing

If you use this software, please cite the following article:

CITATION GOES HERE

## Table of Contents

### calculator
    An iPython notebook that uses the empirical formula in the study referenced above to 
    determine the flow rate, pressure drop or required restrictor diameter for diameters in the
    range of 2-4mm.

### restrictorGeometry
    contains the STL data for the splitters and restrictors used in the study referenced above.
    
### rhoPimpleFoam_2mmRestrictor
    A sample OpenFOAM case with a 2mm diameter restrictor and Y splitter.
    Built and tested on foam-extend-3.2 with swak-tools.
    
    Settings as follows:
    - 2 way 3d printed splitter
    - one 2mm dia restrictor
    - Gas is 80% O2.
    - Ventilator in pressure control mode with empirical profile.
    - Unrestricted lung has 0.1 L/cmH2O compliance
    - Restricted lung has 0.2 L/cmH2O compliance
    - Positive End Expiratory Pressure = +5cm H2O
    - k-Omega SST RANS turbulence model with default coefficients.
    
### snappyHexMesh_2mmRestrictor
    A sample mesh generation setup built and tested using OpenFOAM-v1906 
    Currently set up to generate the mesh for the 2mm restrictor and splitter used in the example case above.

