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

## Disclaimer

Modifying the operation of a ventilator is an unproven and high risk procedure that may endanger human life. Such activities should only be undertaken by trained medical professionals in a clinical setting. The authors of this project do not condone or endorse the use of ventilator splitting or other such modifications.

## License

This program is free software: you can redistribute it and/or modify it under the terms of the GNU General Public License as published by the Free Software Foundation, either version 3 of the License, or (at your option) any later version.

This program is distributed in the hope that it will be useful, but WITHOUT ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License for more details.

You should have received a copy of the GNU General Public License along with this program.  If not, see <https://www.gnu.org/licenses/>.

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

