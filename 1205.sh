#!/bin/sh

#titile:获取随机字符串或数字

set -e

# 1
echo $RANDOM | md5sum | cut -c 1-8

# 2
#使用 openssl 生成密码
#几乎所有 Linux 发行版都包含 openssl。我们可以利用它的随机功能来生成可以用作密码的随机字母字符串。
openssl rand -base64 8

# 3
#Unix/Linux环境中大都有一个名为uuidgen的小工具，运行即可生成一个UUID到标准输出
#读取文件/proc/sys/kernel/random/uuid即得UUID，例如
cat /proc/sys/kernel/random/uuid