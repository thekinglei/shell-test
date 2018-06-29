#!/bin/bash
#监控某些进程是否存在，否：重启，1h轮询一次
#!/bin/bash
set -e -x -u
#/opt/apache-activemq-5.8.0/bin/activemq start
activemq(){
    /opt/apache-activemq-5.8.0/bin/activemq start
    Pid_num=$(ps -ef|grep "${process_name}"|grep -v grep |awk '{print $2}')
    if [[ "${Pid_num}x" == "x" ]];then
        echo "start activemq failed"
        return 1
    else
        echo "start success,pid is :${Pid_num}"
        return 0
    fi
}
zookeeper(){
    /opt/zookeeper-3.4.9/bin/zkServer.sh start
    Pid_num=$(ps -ef|grep "${process_name}"|grep -v grep |awk '{print $2}')
    if [[ "${Pid_num}x" == "x" ]];then
        echo "start zookeeper failed"
        return 1
    else
        echo "start zookeeper success,pid is :${Pid_num}"
        return 0
    fi

}
get_process(){
    process_name=$1
    Pid_num=$(ps -ef|grep "${process_name}"|grep -v grep |awk '{print $2}')
    if [[ "${Pid_num}x" == "x" ]];then
        echo "need to restart ${process_name}"
        eval "${process_name}"        
    else
        echo "${process_name} is running;no need to start"
    fi

}
while true
do
    get_process activemq
    get_process zookeeper-3.4.9
    sleep 600
done
