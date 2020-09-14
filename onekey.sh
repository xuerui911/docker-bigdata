#!/bin/sh
yum -y install git
curl -fsSL https://get.docker.com | bash -s docker --mirror Aliyun
#创建宿主机临时存储目录
mkdir components/
#下载所有包
cd components/
#MAVEN			
wget https://mirrors.tuna.tsinghua.edu.cn/apache/maven/maven-3/3.6.3/binaries/apache-maven-3.6.3-bin.tar.gz
#Hadoop			
wget https://mirrors.tuna.tsinghua.edu.cn/apache/hadoop/common/hadoop-3.3.0/hadoop-3.3.0.tar.gz
#Zookeeper		
wget https://mirrors.tuna.tsinghua.edu.cn/apache/zookeeper/zookeeper-3.6.2/apache-zookeeper-3.6.2-bin.tar.gz
#Hive			
wget https://mirrors.tuna.tsinghua.edu.cn/apache/hive/hive-3.1.2/apache-hive-3.1.2-bin.tar.gz
#Flume			
wget https://mirrors.tuna.tsinghua.edu.cn/apache/flume/1.9.0/apache-flume-1.9.0-bin.tar.gz
#Kafka			
wget https://mirrors.tuna.tsinghua.edu.cn/apache/kafka/2.6.0/kafka_2.13-2.6.0.tgz
#Kafka-eagle		
wget https://github.com/smartloli/kafka-eagle-bin/archive/v2.0.1.tar.gz
#HBase			
wget https://mirrors.tuna.tsinghua.edu.cn/apache/hbase/2.3.1/hbase-2.3.1-bin.tar.gz
#Phoenix			
wget https://mirrors.tuna.tsinghua.edu.cn/apache/phoenix/apache-phoenix-5.0.0-HBase-2.0/bin/apache-phoenix-5.0.0-HBase-2.0-bin.tar.gz
#JDK11.0.8（Oracle官网必须登录才给临时下载链接，这是我个人onedrive用工具生成的直链，可能会失效）				
wget https://onedrive.gimhoy.com/1drv/aHR0cHM6Ly8xZHJ2Lm1zL3UvcyFBckxZM25PVHJEM1ZsNWdLelN0RU1zWmdSWHMzSEE/ZT1PNUNXeDI=.tar.gz

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


#重命名
mv /opt/module/apache-flume-1.9.0-bin /opt/module/flume-1.9.0
mv /opt/module/apache-hive-3.1.2-bin /opt/module/hive-3.1.2
mv /opt/module/apache-maven-3.6.3 /opt/module/maven-3.6.3
mv /opt/module/apache-phoenix-5.0.0-HBase-2.0-bin /opt/module/phoenix-5.0.0
mv /opt/module/apache-zookeeper-3.6.2-bin /opt/module/zookeeper-3.6.2
mv /opt/module/kafka-eagle-bin-2.0.1 /opt/module/kafka-eagle-2.0.1

#删除压缩包
#rm -f *gz
