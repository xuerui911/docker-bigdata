#JDK				
wget 
#MAVEN			
wget https://downloads.apache.org/maven/maven-3/3.6.3/binaries/apache-maven-3.6.3-bin.tar.gz
#Hadoop			
wget https://downloads.apache.org/hadoop/common/hadoop-3.3.0/hadoop-3.3.0.tar.gz
#Zookeeper		
wget https://downloads.apache.org/zookeeper/zookeeper-3.6.2/apache-zookeeper-3.6.2-bin.tar.gz
#Hive			
wget https://downloads.apache.org/hive/hive-3.1.2/apache-hive-3.1.2-bin.tar.gz
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

#解压所有包
tar zxf apache-maven-3.6.3-bin.tar.gz -C /opt/module
tar zxf hadoop-3.3.0.tar.gz -C /opt/module
tar zxf apache-zookeeper-3.6.2-bin.tar.gz -C /opt/module
tar zxf apache-hive-3.1.2-bin.tar.gz -C /opt/module
tar zxf apache-flume-1.9.0-bin.tar.gz -C /opt/module
tar zxf kafka_2.13-2.6.0.tgz -C /opt/module
tar zxf v2.0.1.tar.gz -C /opt/module
tar zxf hbase-2.3.1-bin.tar.gz -C /opt/module

#重命名
mv 
