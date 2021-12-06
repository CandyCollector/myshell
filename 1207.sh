#!/bin/bash
# 检查软件包是否安装

if rpm -q ${1} &>/dev/null; then
  echo "$1 已安装"
else
  echo "$1 未安装"
fi
