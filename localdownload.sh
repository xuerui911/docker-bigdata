#!/bin/sh
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
