## 接口

apa自动化测试示例------测试原理

![image-20220820080334400](/home/user/.config/Typora/typora-user-images/image-20220820080334400.png)



## 仿真原理、数据和接口



## topic

1.查看speed

```
/am_vehicle_info_observer__pb.vehicle.speed
```

2.dr

```
/dr_odometry___dot___topic__zviz
```

3.state

```
/planning_state_topic__pb.state  （realtime_path_mgr、standby）
```

4.查看location state

```
/location_result_topic__pb.state_flag   (0/1)定位
/location_status_topic__pb   ("LocStMapUnavailable"、LocStFixed)

```

5.查看状态pwmm

```
/am_park_with_map_model_report_message_topic__pb
"StandByState"
```

6.入口起点，-5 12 0

## [如何得到一个段错误的核心转储](https://zhuanlan.zhihu.com/p/39736407)

核心转储(core dump)是您的程序内存的一个副本，并且当您试图调试您的有问题的程序哪里出错的时候它非常有用。
当您的程序出现段错误，Linux 的内核有时会把一个核心转储写到磁盘。 当我最初试图获得一个核心转储时，我很长一段时间非常沮丧，因为 - Linux 没有生成核心转储！我的核心转储在哪里？
在启动我的程序之前运行

```
 ulimit -c unlimited
sudo sysctl -w kernel.core_pattern=/home/user/Desktop/core-%e.%p.%h.%t
```

