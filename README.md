# docker-bigdata
------------------------------------------------------------------------------------------------
成功做到Windows可ping通Linux中容器，容器内可ping通Windows
------------------------------------------------------------------------------------------------
大数据各组件版本参见Readme-DockerCentOS7Bigdata.txt
------------------------------------------------------------------------------------------------
自学Docker基础知识：B站搜“docker基础”一堆教程（B站打钱）
------------------------------------------------------------------------------------------------

我的环境：WIN10 VMWare

网卡VMNet8配置: 

    IP    192.168.88.1 
    
    网关  192.168.88.2
    
    掩码  255.255.255.0

VMWare→编辑→虚拟网络编辑器→VMNet8→子网IP改为192.168.88.0 NAT设置→网关改为网卡一样的192.168.88.2
    
------------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------

虚拟机为CentOS7

#安装git：

	yum -y install git

国内docker网速过慢：自行搜索docker国内镜像加速

------------------------------------------------------------------------------------------------

#一键构建：
------------------------------------------------------------------------------------------------

将此仓库克隆到本地并运行脚本一键构建（假设使用root用户）：

	git clone https://github.com/xuerui911/docker-bigdata.git && cd docker-bigdata && sh onekey.sh

国内访问github过慢的话可尝试我的gitee：

	git clone https://gitee.com//xuerui911/docker-bigdata.git && cd docker-bigdata && sh onekey.sh

（同理访问其它github仓库过慢的话可以尝试自己用gitee账户克隆他人github仓库）（gitee打钱）

------------------------------------------------------------------------------------------------

常用命令：

安装Docker：https://docs.docker.com/engine/install/

	docker官方一键安装脚本：curl -fsSL https://get.docker.com | bash -s docker --mirror Aliyun
	  
启动docker服务：

	systemctl enable docker && systemctl start docker

用我的Dockerfile构建镜像

	docker build -f Dockerfile-CentOS7Bigdata -t centos-bigdata .

（-f代表file，即指定dockerfile为哪个文件，如果dockerfile名字就为Dockerfile，-f Dockerfile可省略）

（-t代表target，即目标镜像。末尾的“.”代表dockerfile和dockerfile中所需的文件在当前目录下，不能省略，如果你的dockerfile和所需文件不在同一目录，自行修改此处路径和dockerfile文件中的路径）

------------------------------------------------------------------------------------------------

构建成功后,查看已存在的镜像:

	docker images

------------------------------------------------------------------------------------------------

Docker默认网络所谓的桥接实际为NAT，想要将Docker网络改为像VMWare一样子机器运行在宿主机同一网段，需要借助pipework（pipework作者好像也是docker团队的大佬，https://github.com/jpetazzo/pipework）

参考教程：

https://blog.csdn.net/ypc123ypc/article/details/77839099#pipework%E7%9A%84%E4%BD%BF%E7%94%A8%E4%BB%A5%E5%8F%8A%E6%BA%90%E7%A0%81%E5%88%86%E6%9E%90	

https://blog.51cto.com/13480443/2097340

	git clone https://github.com/jpetazzo/pipework

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

-----------------------------------------------------------------------------------------------------

通过构建的image创建容器


run代表创建并运行 -i表示interactive交互 -t表示terminal终端 -d表示daemon后台 --net表示用哪个docker网络，想用pipework此处必须用none，--name为自定义容器名，--privileged为容器开启最高权限（慎用），centos-bigdata为从哪个image创建，/usr/sbin/init为容器创建之后运行哪个程序，默认是/bin/bash，想在容器里能使用systemctl就得用/usr/sbin/init

	docker run -itd --net=none --name hadoop102 --privileged centos-bigdata /usr/sbin/init

	docker run -itd --net=none --name hadoop103 --privileged centos-bigdata /usr/sbin/init

	docker run -itd --net=none --name hadoop104 --privileged centos-bigdata /usr/sbin/init

----------------------------------------------------------------------------------------------------------

pipework指定IP

	pipework br0 hadoop102 192.168.88.102/24@192.168.88.2

	pipework br0 hadoop103 192.168.88.103/24@192.168.88.2

	pipework br0 hadoop104 192.168.88.104/24@192.168.88.2

#br0为我们修改过的桥接网卡，之后是创建容器时指定的容器名，之后是指定的IP，/24为掩码255.255.255.0，@后面是默认网关

------------------------------------------------------------------------------------------------------------------------------------------------
#创建容器之后总是忘了指定IP，写到一条命令里

	docker run -itd --net=none --name hadoop102 --privileged centos-bigdata /usr/sbin/init && pipework br0 hadoop102 192.168.88.102/24@192.168.88.2

	docker run -itd --net=none --name hadoop103 --privileged centos-bigdata /usr/sbin/init && pipework br0 hadoop103 192.168.88.103/24@192.168.88.2

	docker run -itd --net=none --name hadoop104 --privileged centos-bigdata /usr/sbin/init && pipework br0 hadoop104 192.168.88.104/24@192.168.88.2
	
#一键脚本会默认创建这3个容器

-----------------------------------------------------------------------------------------------------------------------------------------------

#将主机eth0桥接到br0上，并把eth0的IP配置在br0上。这里由于是远程操作，中间网络会断掉，所以放在一条命令中执行。

	ip addr add 192.168.88.102/24 dev br0; \
    	ip addr del 192.168.88.102/24 dev eth0; \
    	brctl addif br0 eth0; \
    	ip route del default; \
    	ip route add default gw 192.168.88.2 dev br0
	
----------------------------------------------------------------------------------------------------------

进入运行中的容器

	docker exec -it hadoop102 /bin/sh

在容器中想返回到宿主机而让容器后台运行：

	ctrl+p+q同时按
    
在容器中想返回到宿主机并退出容器：

	输入exit并执行

查看运行中的容器：
	
	docker ps

查看包括已停止的容器在内的所有容器
	
	docker ps -a

删除镜像

	docker rmi *
	
删除容器
	 docker rm *

--------------------------------------------------------------------------------------------------------------

#Windows不能被ping通：

#WIN10开启ping：

控制面板→→防火墙→→高级设置→→入站规则→→文件和打印机共享(回显请求-icmp )，选中4个，右键启用规则，可以被ping




