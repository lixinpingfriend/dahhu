#!/bin/bash
echo 开始

shPath = Assets/Temp/fir.sh

echo "#!/bin/bash" > Assets/Temp/fir.sh
#fir publish /Users/dred/Workbench/Apps/CrazyCowBoy_v0.6.9_2017-0422-1810.apk
echo $1 $2 $3 >> Assets/Temp/fir.sh
echo "press any key to exit" >> Assets/Temp/fir.sh
echo "read " >> Assets/Temp/fir.sh

chmod 777 Assets/Temp/fir.sh
open Assets/Temp/fir.sh


