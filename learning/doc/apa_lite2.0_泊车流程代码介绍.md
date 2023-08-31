time:2023.03.23

author:jing

```
  InitializeTimeout();//设置进程LIVE_MSG_ODOMETER_POSE结束计时器
  InitializeProfile();//xml配置文件读取
  InitializeAmParkIn();//初始化apa_parkin模式，并开始搜索车位
  InitializePoseSubscriber();//订阅车位姿信息(LIVE_MSG_ODOMETER_POSE),当车位置超过预设的终点之后，结束进程
  Initialize();//仿真接口，启动车行驶（按照配置文件res/manual_pose.pb.txt里的轨迹（这两个点是python修改的）--直线轨迹）
  InitializeCrashedSubscriber();//订阅crash节点信息(接受system_monitor节点发出的信息)
  InitializeFpSubscriber();//订阅感知融合的objectmap信息，包括障碍物高低属性、动静态等信息
  InitializeFsSubscriber();//订阅融合车位的信息，用来判断
  InitializeTrajSubscriber();//订阅车辆泊车时pnc发来的轨迹信息，记录其中的速度和加速度
  /*
  整体流程
	1.初始化apa_parkin模式，并设置开始搜车位
	2.让车按照给定轨迹行进，记录其过程中的融合车位信息和障碍物信息等
	3.判断扫到的车位(布置的场景默认指两个障碍物的中心附近车位)或障碍物是否符合要求
	4.(3符合要求)开始自动泊车并记录过程相关信息
	5.正常结束/超时结束/未扫到目标车位结束
  */
```

三个接口

```
OnUpdateFusedSlotsAtOdom
```

