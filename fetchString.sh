#!/bin/bash

#判断参数个数
if [ $# -eq 0 ]; then
    echo '未指定文本文件'
    exit 1
fi


head_str='\/\/'
tail_str='<'
sys_info=''
file_name=output.txt

#读取参数
while getopts ":h:t:w:" opt
do
    case $opt in
        h)
            head_str=${OPTARG}
            ;;
        t)
            tail_str=$OPTARG
            ;;
        w)
            sys_info=$(cat $OPTARG)
            ;;
        ?)
            echo "错误的参数"
            exit 1;;
    esac
done

#新建文件
echo "" > $file_name

line_count=0

#逐行读取
for line in $sys_info
do
    #判断是否包含'http'
    if [[ $line =~ 'http' ]]; then
        url_drophead=${line#*$head_str}
        url_droptail=${url_drophead%$tail_str*}
        echo $url_droptail >> $file_name
        line_count=$[line_count+1]
        echo -ne "$line_count\r"
    fi
done


echo "输出完成！$line_count"
exit 0
