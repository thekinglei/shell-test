

1、find中的-exec参数

在当前目录下(包含子目录)，查找所有txt文件并找出含有字符串"bin"的行

find ./ -name "*.txt" -exec grep "bin" {} \;

在当前目录下(包含子目录)，删除所有txt文件

find ./ -name "*.txt" -exec rm {} \;

Execute  command;  true  if 0 status is returned.  All following arguments to find are taken to be arguments to the command until  an  argument  consisting of `;' is encountered.  The string `{}' is replaced by the current file name being processed  everywhere  it occurs in the arguments to the command, not just in arguments where it is alone.

 

-exec command：command 为其他指令，-exec后面可再接额外的指令来处理搜寻到的结果。

 



 

 

{ }代表的是「由 find 找到的内容」，如上图所示，找到的结果会被放置到 { } 位置中;
-exec一直到 \; 是关键字，代表找到额外动作的开始（-exec）到结束（\），在这中间的就是找到指令内的额外动作

 

因为「;」在bash的环境下是有特殊意义的，因此利用反斜线来跳脱。

 

以上，来自鸟哥[http://linux.vbird.org/linux_basic/0220filemanager.php]的相关介绍2、shell的内置命令命令exec

#!/bin/ksh

export LOG=/tmp/test.log

exec >> $LOG 2>&1

ls -l kevin.txt

exit 0

exec [arg]

If arg is present, executes arg in place of this shell.

(arg will replace this shell).

shell的内建命令exec将并不启动新的shell，而是用要被执行命令替换当前的shell进程，并且将老进程的环境清理掉，而且exec命令后的其它命令将不再执行。

因此，如果你在一个shell里面，执行exec ls那么，当列出了当前目录后，这个shell就自己退出了，因为这个shell进程已被替换为仅仅执行ls命令的一个进程，执行结束自然也就退出了。为了避免这个影响我们的使用，一般将exec命令放到一个shell脚本里面，用主脚本调用这个脚本，调用点处可以用bash a.sh，（a.sh就是存放该命令的脚本），这样会为a.sh建立一个sub shell去执行，当执行到exec后，该子脚本进程就被替换成了相应的exec的命令。

source命令或者”.”，不会为脚本新建shell，而只是将脚本包含的命令在当前shell执行。

不过，要注意一个例外，当exec命令来对文件描述符操作的时候，就不会替换shell，而且操作完成后，还会继续执行接下来的命令。

exec 3<&0:这个命令就是将操作符3也指向标准输入。

原文

[1]http://blog.chinaunix.net/uid-20652643-id-1906436.html

[2]http://zhgw01.blog.163.com/blog/static/1041481220098944425489/

[3]http://blog.csdn.net/clozxy/article/details/5818465

[4]http://www.cnblogs.com/zhaoyl/archive/2012/07/07/2580749.html
