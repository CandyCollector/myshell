#!/bin/bash
set -e

# 批量创建用户
# [root@i-ivipbag1 shell] cat user.txt 
# aaaa,111
# vbbb,22222
# vvvvv,1111
# 111,2222
# 111,2222

while read line ;
do
    if [ `echo $line |awk -F ',' {'print $1'} |xargs useradd &>/dev/null`]; then 
        `echo $line |awk -F ',' {'print $2'} |passwd --stdin $1 >dev/null 2&>1`
    else
        echo "used already exsis"
    fi
done < user.txt