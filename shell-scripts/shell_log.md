#/bin/bash
#shell脚本执行过程，日志记录

#日志文件hello.log，fsize为大小；exec 2>>为错误重定向，1为输出重定向；  
log=/root/hello.log  
fsize=20000000  
exec 2>>$log  
exec 1>>$log  

fun1(){  
    echo "start"  
    echo "test"  
    abd  
    echo "end"  
}  

fun1
