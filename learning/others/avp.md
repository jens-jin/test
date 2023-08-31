#### 1.目标

完成停车场所有车位的avp测试。(多次进行)

#### 2.方案细节

###### 方案一

- 读取车位信息

- 获取车辆信息

- 初始化地图

- 切图定位(放在哪里？standby是什么时候可以的)

- 判断location状态是否为LocStFixed，

- 不断获取pwmm的message，判断是否改变,改变时把记录下来。

- 循环执行泊车
  - 判断车辆状态
    - StandbyState，进行一次泊车。
    
      ```
        if (state == "StandbyState"){
          this->InitialPose();
          while (1){
            if (pose_attitude == "LocStFixed"){
              ZINFO << "-------------------" << '\n';
              this->RequestGlobalRoute(pickup_msg++);
              this->Start();
              break;
            }
      ```
    
    - ActiveState，正在泊车中。
    - FinishedState，记录结果，重新定位
    - AbortState,记录结果，重新定位
  - 每次泊车结束，重新定位
  
    - 记录当前位置，熄火存储，然后relaunch加载之前位置
  
- 记录泊车结果
  - state
  - endtime
  - position
    - slot_positon
    - vehicle_position

执行任务条件：

1.发送定位

2.定位成功



方案二

1.每次launcher完成一个车位，再起一次launcher进行下一个，python完成（已完成）

2.异常情况处理：

​	a.间断测试（被抢占了记录下当前车位，下一次重新测试该车位）

​	b.车停下，流程不继续。

​	c.结果z=-2,分析原因。abortstate.

车停很可能是因为车实际上碰到障碍物了，仿真车的初始位置由out/B_DropnGo_stable/ubuntu1804_x86_64/res/carlasdk/zsim_map/tengfei_area/init_pose.pb.txt确定



# 就近泊车与指定泊车

## 产品需求

http://shapolarion01/polarion/#/project/DropnGo__Platform/workitem?id=DropnGo-646

http://shapolarion01/polarion/#/project/DropnGo__Platform/workitem?id=DropnGo-647



## Use Case

基于以下日常use case，进行泊车全局路径的终点与车位释放的参数设计。

### Case 1：直道上指定车位泊车，保证车位扫出

![img](/home/user/Documents/dropngo/02 Design/Pictures/Use Case/直道.jpg)



### Case 2：转弯处指定车位泊车，保证车位扫出

![img](/home/user/Documents/dropngo/02 Design/Pictures/Use Case/转弯.jpg)



### Case 3：靠墙处指定车位泊车，保证车位扫出

![img](/home/user/Documents/dropngo/02 Design/Pictures/Use Case/遇到墙体.jpg)



### Case 4：就近泊入，要求准确释放就近的空车位

![img](/home/user/Documents/dropngo/02 Design/Pictures/Use Case/就近泊入.jpg)



## Parameter Configuration

《fpse_config.pb》中：

car_len_ratio，决定了释放车位的早晚，值越大，释放得越早

建议取值：1.0，或者0.5
