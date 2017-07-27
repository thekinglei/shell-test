#!/bin/bash

#read命令操作示例


read -n 5 -s -t 2 -d ":" -p "Enter your password:" var 
#说明：从输入中以无回显的方式读取5个字符并存入变量var中，且需要在2秒内输入，以:作为输入行的结束符，终端会有”Enter your password:”的提示
-n:五个字符
-s:无回显，输入时不显示
-t：超时设置，2s
-p：提示


更改登录shell

更改为bash：

chsh -s /bin/bash

更改为sh

chsh -s /bin/sh

更改为fish：
安装fish：apt-get install fish

chsh -s /bin/fish
