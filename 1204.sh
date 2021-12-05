#!/bin/sh

#titile:获取随机字符串或数字

set -e
#获取8位字符串

# 1
echo $RANDOM |md5sum |cut -c 1-8
#同理，也可以使用 sha512sum、sha1sum

# 2
#使用 openssl 生成密码
#几乎所有 Linux 发行版都包含 openssl。我们可以利用它的随机功能来生成可以用作密码的随机字母字符串。
openssl rand -base64 8

# 3
#Unix/Linux环境中大都有一个名为uuidgen的小工具，运行即可生成一个UUID到标准输出
#读取文件/proc/sys/kernel/random/uuid即得UUID，例如
cat /proc/sys/kernel/random/uuid

#获取8位数字

#1
echo $RANDOM |cksum |cut -c 1-8
#cksum命令 是检查文件的CRC是否正确，确保文件从一个系统传输到另一个系统的过程中不被损坏。这种方法要求校验和在源系统中被计算出来，在目的系统中又被计算一次，两个数字进行比较，如果校验和相等，则该文件被认为是正确传输了。
#注意：CRC是指一种排错检查方法，即循环冗余校验法。
#指定文件交由cksum命令进行校验后，会返回校验结果供用户核对文件是否正确无误。若不指定任何文件名称或是所给予的文件名为"-"，则cksum命令会从标准输入设备中读取数据。

#2
openssl rand -base64 4 |cksum |cut -c 1-8

#3
date +%n |cut -c 1-8