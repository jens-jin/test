1.编译

```
1.创建文件夹把建图好的非
```

```
袁瑞: ssh root@47.88.4.63
Zongmu123$
袁瑞: /columbus/columbus1-0.tar
袁瑞: 把这个拉下来
袁瑞: 在本地启动容器：docker run --name XXXXX -it --privileged -v 本地目录:容器目录 镜像 /bin/bash
袁瑞: 编译工具也拉下来：/columbus1-1/compiler-2.3.0-release整个目录
袁瑞: 你恢复tar文件就得到了一个镜像
袁瑞: 目录建议你仿照着/Application/zongmu/DropNGoCloud/oss_downloads/3/274877953025来建
袁瑞: 调用地图编译工具的脚本类似：/Application/zongmu/DropNGoCloud/oss_downloads/3/274877953025/274877953025_bash_file.sh

袁瑞: ssh -p 31415 aladmin@47.101.45.57
Zongmu123$%^
提权：sudo su
/root/columbus/columbus1-0.tar

```

```
cd /columbus1-1/compiler-2.3.0-release
/bin/bash /columbus1-1/compiler-2.3.0-release/hpa_map_columbus_1.1.sh -i /Application/zongmu/DropNGoCloud/oss_downloads/3/274877953025/output/output_data/map -o /Application/zongmu/DropNGoCloud/oss_downloads/3/274877953025/output/output_data -n 1073742004 -r /Application/zongmu/DropNGoCloud/oss_downloads/3/274877953025/output/output_data/result_map.txt

input/vslam|zrosbag2 ouput/output_data
```





test

```
docker run --name test -it --privileged -v /home/user/Documents/pnc/PnC2.0_Columbus1.1/Columbus1.1/columbus_mapping_release_20.04:/root/test 4eec25b850f7b775073eeb03e445a53da00c0fe75c684472e048e21d3c80fdc7 /bin/bash
```

```
if '/opt/ros/kinetic/lib/python2.7/dist-packages' in sys.path:
    sys.path.remove('/opt/ros/kinetic/lib/python2.7/dist-packages')
PP.py
PS.py
```

配置环境

```
1.安装docker
2.恢复镜像：dokcer load -i *.tar(备份：docker save -o container_name.tar container_name)
3.docker run --name test -it --privileged -v 本地目录:容器目录 镜像 /bin/bash(本地目录应包含建图生成的output_data和compiler-2.3.0-release编译工具包等)
4.修改
```

```
/user_run.sh 123123 /home/user/Documents/pnc/PnC2.0_Columbus1.1/Columbus1.1/data_02/zrosbag2/旺族商业 /home/user/Documents/pnc/PnC2.0_Columbus1.1/Columbus1.1/data_02/vslam/vslam_traj.txt
```

运行流程

```
建图
1.拉取（更新？）zrosbag2和vslam（暂不执行，zrosbag2太大）
2.运行建图脚本+map_id+zrosbag2路径
3.判断result_batch.txt result
编译
1.启动容器
2.重启sql（编译报错时）
3.运行编译脚本
4.判断result_map.txt
mv ouput 
rm -rf output_data(容器里)
```

挂载共享盘shfp14

```
sudo mkdir /mnt/shfp14 && sudo mount -t cifs //192.168.92.24/shares /mnt/shfp14 -o username=jing.jiang
```

```
sudo vim /etc/samba/cred.passwd
Username=jing.jiang
Password=
```

```
sudo vim /etc/fstab
//192.168.92.24/shares /mnt/shfp14 cifs credentials=/etc/samba/cred.passwd,iocharset=utf8,gid=1000,uid=1000,file_mode=0777,dir_mode=0777 0 0
```

```
test:
export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:/home/user/Documents/pnc/columbus_test/src/zrosbag2rosbag&&cd /home/user/Documents/pnc/columbus_test/src/zrosbag2rosbag &&./zrosbag2rosbag /home/user/Documents/pnc/columbus_test/src/zrosbag2rosbag/config_loc_2.0.yaml /home/user/Documents/pnc/PnC2.0_Columbus1.1/Columbus1.1/data_02/zrosbag2/旺族商业 /home/user/Documents/pnc/PnC2.0_Columbus1.1/Columbus1.1/data_02/rosbag/zrosbag2_20220526_191153.bag

export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:/home/user/Documents/pnc/columbus_test/src/zrosbag2rosbag&&cd /home/user/Documents/pnc/columbus_test/src/zrosbag2rosbag &&./zrosbag2rosbag /home/user/Documents/pnc/columbus_test/src/zrosbag2rosbag/config_loc_2.0.yaml /home/user/Documents/pnc/zrosbag2数据/20230223/泊车避障撞障碍物/zrosbag2/bag2_20230223 /home/user/Documents/pnc/zrosbag2数据/20230223/泊车避障撞障碍物/rosbag/泊车避障撞障碍物.bag
```



```
    # 整理zrosbag2原始数据的路径
    # 检测vslam轨迹是否存在
    # zrosbag2_to_rosbag
    #transf_floor_level_file
    
```

