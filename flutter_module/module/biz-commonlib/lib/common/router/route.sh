#!/bin/sh
#############################
# @author azhon
#
# 自动生成页面路由地址
# 文件名格式：*_page.dart
#############################
splitSymbol="_"
fileFormat="_page.dart"
page_array=()
index=0
read_file() {
    # shellcheck disable=SC2045
    for file in `ls $1`
    do
        if [ -d $1"/"$file ];then
            read_file $1"/"$file
        else
             if echo "$file" | grep -q -E "\\$fileFormat"
             then
                # 根据文件名 转换成 upperCase格式
                upper_letter $file
                page_array[index]=$clsName
                index=`expr $index + 1`
            fi
        fi
    done

}
#字母转大写
upper_letter(){
  params=$1
  # 删除".dart"
  params=${params%.*}
  #字符串_分割
  name_array=(${params//$splitSymbol/ })
  result=$name_array
  # shellcheck disable=SC2068
  for((i=1;i<=${#name_array[@]};i++));
  do
    firstLetter=${name_array[i]:0:1}
    otherLetter=${name_array[i]:1}
    firstLetter=$(echo $firstLetter | tr '[a-z]' '[A-Z]')
    result+=$firstLetter$otherLetter
  done
  clsName=$result
}
# 获取[/lib]目录下的所以page文件
read_file ../
#生成文件
fileHint="///don't modify this file,use shell (route.sh) auto create.\n"
moduleName='/bizCommon'
startCode="$fileHint class BizRouteName {\n"
endCode="}"
# shellcheck disable=SC2145
echo "获取到需要生成路由的页面:\n${page_array[@]}"
# shellcheck disable=SC2068
for page in ${page_array[@]}
do
   line="  static const $page = '$moduleName/$page';"
   startCode=$startCode$line"\n"
done
echo $startCode$endCode > ./biz_route_name.dart


