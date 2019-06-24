#!/bin/bash
echo 开始

#变量赋值，=号两边不能有空格
shPath="Assets/Editor/temp_build_ipa_and_publish_fir.sh"
dingdingShPath="Assets/Temp/robot.sh" 
ipaRootPath=$2      #生产的ipa完整路径
ipaName=$3

echo "#!/bin/bash" > $shPath
echo "open $1 -j" >> $shPath       #需要先用Xcode打开，生成xc_workspace目录
echo "sleep 6" >> $shPath
# echo "killall Xcode" >> $shPath
# echo "$2" >> $shPath
# fir bi /Users/dred/Workbench/Apps/XcodeProject_BullFight_v1.0.0_2017-0429-1301/Unity-iPhone.xcodeproj -S Unity-iPhone -E development -o /Users/dred/Workbench/Apps/ipa/ -n BullFight_v1.0.0_2017-0429-1301.ipa -p -T 509014074736bd3326893fc301864579 -L '123123'
echo "$4" >> $shPath
echo "sleep 3" >> $shPath
if [ "$5" != " " ]; then
    # echo "curl '${12}' ${13} '${14}' ${15} '${16}'" >> $shPath
    echo "if [ -f \"$2$3\" ]; then" >> $shPath
    echo "echo \"\" > $2fir_publish_log.txt" >> $shPath
    echo "$5" >> $shPath

    echo "for line in \`cat $2fir_publish_log.txt\`" >> $shPath
    echo "do" >> $shPath
    echo "if [ "\${line}" = \"Published\" ]; then" >> $shPath
    if [ $6 != " " ]; then
        echo "Published succeed"
        echo "curl '$6' -H 'Content-Type: application/json' -d '{\"msgtype\": \"markdown\", \"markdown\": {\"title\": \"$7\", \"text\": \"$7$8\"}}'" >> $shPath
    fi 
    echo "break" >> $shPath
    echo "fi" >> $shPath
    echo "done" >> $shPath
    echo "fi" >> $shPath
fi
# echo "press any key to exit" >> $shPath
echo "read " >> $shPath

#fir bi XcodeProject_CrazyCowBoy/Unity-iPhone.xcodeproj -S Unity-iPhone -E development -o /Users/dred/Workbench/Apps/ipa/ -p -T 509014074736bd3326893fc301864579
#fir bi CrazyCowBoy_v0.6.10_2017-0423-2023_XcodeProject/Unity-iPhone.xcodeproj -E development -o /Users/dred/Workbench/Apps/ipa/ -p -T 509014074736bd3326893fc301864579

chmod 777 $shPath
open $shPath


