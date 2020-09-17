#!/bin/sh

#Docker官方脚本，自行判断是否已安装docker，已安装则跳过，未安装会自动安装
curl -fsSL https://get.docker.com | bash -s docker --mirror Aliyun 
systemctl start docker 
systemctl enable docker

#创建宿主机临时存储目录
if [ ! -d "components" ]; then
mkdir components/
fi

#下载所有包
cd components/
#MAVEN			
if [ ! -f "maven-3.6.3.tar.gz" ]; 
    then
        echo "maven-3.6.3二进制包不存在，从清华源下载"
        wget -c -O maven-3.6.3.tar.gz https://mirrors.tuna.tsinghua.edu.cn/apache/maven/maven-3/3.6.3/binaries/apache-maven-3.6.3-bin.tar.gz
    else
        echo "maven-3.6.3二进制包已存在"
fi

#Hadoop			
    if [ ! -f "hadoop-3.3.0.tar.gz" ]; 
        then
            echo "hadoop-3.3.0二进制包不存在，从清华源下载"
            wget -c https://mirrors.tuna.tsinghua.edu.cn/apache/hadoop/common/hadoop-3.3.0/hadoop-3.3.0.tar.gz
        else
            echo "hadoop-3.3.0二进制包已存在"
    fi

#Zookeeper		
    if [ ! -f "zookeeper-3.6.2.tar.gz" ]; 
        then
            echo "zookeeper-3.6.2二进制包不存在，从清华源下载"
            wget -c -O zookeeper-3.6.2.tar.gz https://mirrors.tuna.tsinghua.edu.cn/apache/zookeeper/zookeeper-3.6.2/apache-zookeeper-3.6.2-bin.tar.gz
        else
            echo "zookeeper-3.6.2二进制包已存在"
    fi

#Hive			
    if [ ! -f "hive-3.1.2.tar.gz" ]; 
        then
            echo "hive-3.1.2二进制包不存在，从清华源下载"
            wget -c -O hive-3.1.2.tar.gz https://mirrors.tuna.tsinghua.edu.cn/apache/hive/hive-3.1.2/apache-hive-3.1.2-bin.tar.gz
        else
            echo "hive-3.1.2二进制包已存在"
    fi

#Flume			
    if [ ! -f "flume-1.9.0.tar.gz" ]; 
        then
            echo "flume-1.9.0二进制包不存在，从清华源下载"
            wget -c -O flume-1.9.0.tar.gz https://mirrors.tuna.tsinghua.edu.cn/apache/flume/1.9.0/apache-flume-1.9.0-bin.tar.gz
        else
            echo "flume-1.9.0二进制包已存在"
    fi

#Kafka			
    if [ ! -f "kafka_2.13-2.6.0.tgz" ]; 
        then
            echo "kafka_2.13-2.6.0二进制包不存在，从清华源下载"
            wget -c -O kafka_2.13-2.6.0.tgz https://mirrors.tuna.tsinghua.edu.cn/apache/kafka/2.6.0/kafka_2.13-2.6.0.tgz
        else
            echo "kafka_2.13-2.6.0二进制包已存在"
    fi

#Kafka-eagle		
    if [ ! -f "kafka-eagle-2.0.1.tar.gz" ]; 
        then
            echo "kafka-eagle-2.0.1二进制包不存在，从github下载"
            wget -c -O kafka-eagle-2.0.1.tar.gz https://github.com/smartloli/kafka-eagle-bin/archive/v2.0.1.tar.gz
        else
            echo "kafka-eagle-2.0.1二进制包已存在"
    fi

#HBase			
    if [ ! -f "hbase-2.3.1.tar.gz" ]; 
        then
            echo "hbase-2.3.1二进制包不存在，从清华源下载"
            wget -c -O hbase-2.3.1.tar.gz https://mirrors.tuna.tsinghua.edu.cn/apache/hbase/2.3.1/hbase-2.3.1-bin.tar.gz
        else
            echo "hbase-2.3.1二进制包已存在"
    fi

#Phoenix			
    if [ ! -f "phoenix-5.0.0.tar.gz" ]; 
        then
            echo "phoenix-5.0.0二进制包不存在，从清华源下载"
            wget -c -O phoenix-5.0.0.tar.gz https://mirrors.tuna.tsinghua.edu.cn/apache/phoenix/apache-phoenix-5.0.0-HBase-2.0/bin/apache-phoenix-5.0.0-HBase-2.0-bin.tar.gz
        else
            echo "phoenix-5.0.0二进制包已存在"
    fi

#JDK11.0.8（Oracle官网必须登录才给临时下载链接，这是我个人onedrive用工具生成的直链，可能会失效）				
    if [ ! -f "jdk-11.0.8.tar.gz" ]; 
        then
            echo -e "jdk-11.0.8二进制包不存在，下载\n（现在Oracle官网必须登录才给临时下载链接，这是我用工具生成的个人Onedrive直链，可能会失效）"
            wget -c -O jdk-11.0.8.tar.gz https://onedrive.gimhoy.com/1drv/aHR0cHM6Ly8xZHJ2Lm1zL3UvcyFBckxZM25PVHJEM1ZsNWdLelN0RU1zWmdSWHMzSEE/ZT1PNUNXeDI=.tar.gz
        else
            echo "jdk-11.0.8二进制包已存在"
    fi

#解压所有包
#tar zxf apache-maven-3.6.3-bin.tar.gz -C /opt/module
#tar zxf hadoop-3.3.0.tar.gz -C /opt/module
#tar zxf apache-zookeeper-3.6.2-bin.tar.gz -C /opt/module
#tar zxf apache-hive-3.1.2-bin.tar.gz -C /opt/module
#tar zxf apache-flume-1.9.0-bin.tar.gz -C /opt/module
#tar zxf kafka_2.13-2.6.0.tgz -C /opt/module
#tar zxf v2.0.1.tar.gz -C /opt/module
#tar zxf hbase-2.3.1-bin.tar.gz -C /opt/module
#tar zxf jdk-11.0.8.tar.gz -C /opt/module
#tar zxf apache-phoenix-5.0.0-HBase-2.0-bin.tar.gz -C /opt/module

#重命名
#mv /opt/module/apache-flume-1.9.0-bin /opt/module/flume-1.9.0
#mv /opt/module/apache-hive-3.1.2-bin /opt/module/hive-3.1.2
#mv /opt/module/apache-maven-3.6.3 /opt/module/maven-3.6.3
#mv /opt/module/apache-phoenix-5.0.0-HBase-2.0-bin /opt/module/phoenix-5.0.0
#mv /opt/module/apache-zookeeper-3.6.2-bin /opt/module/zookeeper-3.6.2
#mv /opt/module/kafka-eagle-bin-2.0.1 /opt/module/kafka-eagle-2.0.1

#docker构建镜像
docker build -f DockerCentOS7Bigdata -t centos7-bigdata .


cd .. && git clone https://github.com/jpetazzo/pipework

cp pipework/pipework /usr/local/bin/

#请确保你的Linux虚拟机已设置静态IP

#复制网卡配置文件ifcfg-ens33为ifcfg-br0，修改ifcfg-br0

cp /etc/sysconfig/network-scripts/ifcfg-ens33 /etc/sysconfig/network-scripts/ifcfg-br0


#修改br0,TYPE改为Bridge

sed -i 's/^TYPE=*/TYPE=Bridge/' /etc/sysconfig/network-scripts/ifcfg-br0

sed -i 's/^NAME=*/NAME=br0/' /etc/sysconfig/network-scripts/ifcfg-br0

sed -i 's/^DEVICE=*/DEVICE=br0/' /etc/sysconfig/network-scripts/ifcfg-br0

#修改ens33，注释掉UUID IPADDR GATEWAY DNS，结尾加一行BRIDGE=br0

sed -i 's/^UUID*/#&/' /etc/sysconfig/network-scripts/ifcfg-ens33

sed -i 's/^IPADDR*/#&/' /etc/sysconfig/network-scripts/ifcfg-ens33

sed -i 's/^GATEWAY*/#&/' /etc/sysconfig/network-scripts/ifcfg-ens33

sed -i 's/^DNS*/#&/' /etc/sysconfig/network-scripts/ifcfg-ens33

echo "BRIDGE=br0" >> /etc/sysconfig/network-scripts/ifcfg-ens33


重启网络服务

systemctl restart network

