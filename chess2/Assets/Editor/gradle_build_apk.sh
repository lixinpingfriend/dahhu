#!/bin/bash
echo 开始构建APK包
shPath="Assets/Temp/gradle_build.sh"
echo "#!/bin/bash" > $shPath
echo $1 >> $shPath
echo "cd $1" >> $shPath
echo "gradle assembleRelease" >> $shPath
chmod 777 $shPath
open $shPath
echo APK包完成