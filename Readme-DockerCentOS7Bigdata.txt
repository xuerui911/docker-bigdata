Maintainer XUE RUI<xuerui911@126.com>

BaseOS:
		CentOS:7
Including:
		JDK 11.0.8
		Maven 3.6.3
		Hadoop 3.3.0
		Zookeeper 3.6.1
		Hive 3.1.2
		Flume 1.9.0
		Scala 2.13
		Kafka 2.13-2.6.0
		KafkaEagle 2.0.1
		HBase 2.3.1
		Phoenix 5.0.0
		
ModuleLocation:	/opt/module/*
Scripts:		/opt/module/scripts/*
ENV:
{$Module}_HOME	/opt/module/{$Module}/
SH_HOME			/opt/module/scripts/
PATH			$PATH:{$Module}_HOME/bin:$SH_HOME


		
		
		
