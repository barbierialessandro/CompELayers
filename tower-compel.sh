#! /bin/bash

version="v1.0 2023-05-20"

echo "                       
╔╦╗╔═╗╦ ╦╔═╗╦═╗   ┌─┐┌─┐┌┬┐┌─┐┌─┐┬   #####################################        
 ║ ║ ║║║║║╣ ╠╦╝───│  │ ││││├─┘├┤ │    Author: Dr Alessandro Barbieri, PhD  
 ╩ ╚═╝╚╩╝╚═╝╩╚═   └─┘└─┘┴ ┴┴  └─┘┴─┘  $version  
                                     #####################################" 

doublegro="$1"
index="$2"
Splitgroup1="$3"
Splitgroup2="$4"
Filtgroup="$5"

double=`echo "$doublegro" | cut -d'.' -f1`
gmx make_ndx -f $doublegro -n $index -o tower.ndx
gmx editconf -quiet -f $doublegro -o tower-double.pdb
for GROUP in $Splitgroup1  ; do
    echo -e "$GROUP \n q \n" | gmx editconf -quiet -f $doublegro -o tower-Splitgroup1.pdb -n tower.ndx
done
for GROUP in  $Splitgroup2 ; do
    echo -e "$GROUP \n q \n" | gmx editconf -quiet -f $doublegro -o tower-Splitgroup2.pdb -n tower.ndx
done
for GROUP in  $Filtgroup; do
    echo -e "$GROUP \n q \n" | gmx editconf -quiet -f $doublegro -o tower-Filtgroup.pdb -n tower.ndx
done

echo "open ./tower-Filtgroup.pdb" > tower.cmd
echo "open ./tower-Splitgroup1.pdb" >> tower.cmd
echo "open ./tower-Splitgroup2.pdb" >> tower.cmd
echo "measure center #1 mark true radius 3 color dark red modelID #3 name Center1=-1.0" >> tower.cmd
echo "measure center #2 mark true radius 3 color navy blue modelID #11 name Center2=+1.0" >> tower.cmd
echo "measure center #3,11 mark true radius 3 color green modelID #7 name Bulkoffset=0.0" >> tower.cmd
echo "measure center #3,7 mark true radius 3 color orange modelID #5 name Bulkoffset=-0.5" >> tower.cmd
echo "measure center #3,5 mark true radius 3 color red modelID #4 name Bulkoffset=-0.75" >> tower.cmd
echo "measure center #5,7 mark true radius 3 color yellow modelID #6 name Bulkoffset=-0.25" >> tower.cmd
echo "measure center #7,11 mark true radius 3 color dodger blue modelID #9 name Bulkoffset=+0.5" >> tower.cmd
echo "measure center #7,9 mark true radius 3 color light sea green modelID #8 name Bulkoffset=+0.25" >> tower.cmd
echo "measure center #9,11 mark true radius 3 color blue modelID #10 name Bulkoffset=+0.75" >> tower.cmd
echo "shape rectangle width 150 height 150 color dark red modelName Bulkoffset=-1.0 center #3" >> tower.cmd 
echo "shape rectangle width 150 height 150 color red modelName Bulkoffset=-0.75 center #4" >> tower.cmd
echo "shape rectangle width 150 height 150 color orange modelName Bulkoffset=-0.5 center #5" >> tower.cmd
echo "shape rectangle width 150 height 150 color yellow modelName Bulkoffset=-0.25 center #6" >> tower.cmd
echo "shape rectangle width 150 height 150 color green modelName Bulkoffset=0.0 center #7" >> tower.cmd
echo "shape rectangle width 150 height 150 color light sea green modelName Bulkoffset=+0.25 center #8" >> tower.cmd
echo "shape rectangle width 150 height 150 color dodger blue modelName Bulkoffset=+0.5 center #9" >> tower.cmd
echo "shape rectangle width 150 height 150 color blue modelName Bulkoffset=+0.75 center #10" >> tower.cmd
echo "shape rectangle width 150 height 150 color navy blue modelName Bulkoffset=+1.0 center #11" >> tower.cmd
echo "shape cylinder radius 50 height 2 modelName cyl1-r50 color red center #3" >> tower.cmd
echo "shape cylinder radius 50 height 2 modelName cyl0-r50 color blue center #11" >> tower.cmd
echo "shape cylinder radius 40 height 2 modelName cyl1-r40 color red center #3" >> tower.cmd
echo "shape cylinder radius 40 height 2 modelName cyl0-r40 color blue center #11" >> tower.cmd
echo "shape cylinder radius 30 height 2 modelName cyl1-r30 color red center #3" >> tower.cmd
echo "shape cylinder radius 30 height 2 modelName cyl0-r30 color blue center #11" >> tower.cmd
echo "shape cylinder radius 20 height 2 modelName cyl1-r20 color red center #3" >> tower.cmd
echo "shape cylinder radius 20 height 2 modelName cyl0-r20 color blue center #11" >> tower.cmd
echo "shape cylinder radius 10 height 2 modelName cyl1-r10 color red center #3" >> tower.cmd
echo "shape cylinder radius 10 height 2 modelName cyl0-r10 color blue center #11" >> tower.cmd 
echo "shape cylinder radius 5 height 15 modelName cyl1-updown=7.5+7.5 color red center #3" >> tower.cmd
echo "shape cylinder radius 5 height 30 modelName cyl1-updown=15+15 color red center #3" >> tower.cmd
echo "shape cylinder radius 5 height 60 modelName cyl1-updown=30+30 color red center #3" >> tower.cmd
echo "shape cylinder radius 5 height 15 modelName cyl0-updown=7.5+7.5 color blue center #11" >> tower.cmd
echo "shape cylinder radius 5 height 30 modelName cyl0-updown=15+15 color blue center #11" >> tower.cmd   
echo "shape cylinder radius 5 height 60 modelName cyl0-updown=30+30 color blue center #11" >> tower.cmd
echo "~display :PC" >> tower.cmd 
echo "display element.P" >> tower.cmd 
echo "represent sphere element.P" >> tower.cmd 
echo "transparency 70,s #21-36" >> tower.cmd
echo "close #4-10" >> tower.cmd
