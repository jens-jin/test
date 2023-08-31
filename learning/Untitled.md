

```
docker run --name test -it --privileged -v /home/user/Documents/pnc/PnC2.0_Columbus1.1/Columbus1.1/columbus_mapping_release_20.04:/root/test 4eec25b850f7b775073eeb03e445a53da00c0fe75c684472e048e21d3c80fdc7 /bin/bash
```

## 配置环境

```
1.安装docker
2.恢复镜像：dokcer load -i *.tar(备份：docker save -o container_name.tar container_name)
3.docker run --name test -it --privileged -v 本地目录:容器目录 镜像 /bin/bash(本地目录应包含建图生成的output_data和compiler-2.3.0-release编译工具包等)
4.如果脚本报错在python脚本中修改(PackPointCloudMap.py,PackSemanticMap.py)
if '/opt/ros/kinetic/lib/python2.7/dist-packages' in sys.path:
    sys.path.remove('/opt/ros/kinetic/lib/python2.7/dist-packages')
```

```
/user_run.sh 123123 /home/user/Documents/pnc/PnC2.0_Columbus1.1/Columbus1.1/data_02/zrosbag2/旺族商业 /home/user/Documents/pnc/PnC2.0_Columbus1.1/Columbus1.1/data_02/vslam/vslam_traj.txt
```

## 运行流程

1.准备zrosbag包

2.准备vslam轨迹

```
1.转rosbag并提取imu.txt(通过程序将imu.txt划分楼层信息)
2.进行columbus vslam 离线处理
  a.配置回放环境
  b.启动camera、vslam_mapping_node、zrosbag2回放模式
  c.初始定位、模拟实车开始建图过程
  d.结束建图生成vslam轨迹
```

3.离线建图

```
/user_run.sh 123123 /home/user/Documents/pnc/PnC2.0_Columbus1.1/Columbus1.1/data_02/zrosbag2/旺族商业 /home/user/Documents/pnc/PnC2.0_Columbus1.1/Columbus1.1/data_02/vslam/vslam_traj.txt
```

4.地图打包

```
/root/test/compiler-2.3.0-release/hpa_map_columbus_1.1.sh -i /root/test/output_data/map -o /root/test/ -n $mapid -r /root/test/output_data/result_map.txt;rm -rf /root/test/output_data/map/vector_info/$mapid
```

5.pnc测试

```
./hpp_map_autotest
sh autotest.sh
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
    # 整理zrosbag2原始数据的路径
    # 检测vslam轨迹是否存在
    # zrosbag2_to_rosbag
    #transf_floor_level_file
    
```

