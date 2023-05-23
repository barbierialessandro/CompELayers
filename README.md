# Tower (CompEL) 🗼 v1.0
Computational Electrophysiology Scripts  (barbierialessandro@hotmail.it)

**Tower** is a Bash/UCSFchimera script (ETA 30 seconds) for the graphical estimation of a list of parameters (bulk-offsetA/B, cyl0-r/up/down, cyl1-r/up/down) required by GROMACS for running **Computational Electrophysiology (CompEL)** simulations. 

**Instructions**: The double membrane partition into two compartments A and B is estimated from the .gro and .ndx files of the duplicated system using split-group0 and split-group1 as basis. The user must define .gro ($1) and .ndx ($2) files and the names of the following subgroups that will be present in the new inde Splitgroup0 ($3), Splitgroup1 ($4) and Splitgroup0+Splitgroup1 groups that will be present in the new index file (tower.ndx). 

WARNING! The colouring of the layers might be inverted. Required software: UCSF Chimera, Gromacs 

**tower-compel.sh** _$1 $2 $3 $4 $5_

**STEP1 : List of input files for the creation of tower.ndx (GROMACS installed)**:
- doublegro="$1"          _; Filename.gro of the duplicated system_
- index="$2"              _; Index.ndx    of the duplicated system_

**STEP2 : List of values for the creation of tower.cmd (UCSF Chimera cmd input)**:
- Splitgroup1="$3"        _; Name given to Splitgroup0 in tower.ndx_  
- Splitgroup2="$4"        _; Name given to Splitgroup1 in tower.ndx_ 
- Filtgroup="$5"          _; Name given to sum of Splitgroup0 + Splitgroup1 in tower.ndx_

**List of parameters**: 
- bulk-offsetA = 0.00 
- bulk-offsetB = 0.00
- cyl0-r       = 0.0      ; Split cylinder 0 radius (nm)
- cyl0-up      = 0.0      ; Split cylinder 0 upper extension (nm)
- cyl0-down    = 0.0      ; Split cylinder 0 lower extension (nm) 
- cyl1-r       = 0.0      ; same for the other unit 
- cyl1-up      = 0.0 
- cyl1-down    = 0.0

![CompLANES_4](https://user-images.githubusercontent.com/100777525/168336198-ea55569f-da06-4bd4-964f-5ddcc1e3180a.png)

https://user-images.githubusercontent.com/100777525/173398925-21928f1f-0002-418a-a3ea-b794d9e77e8b.mp4


