#### 自动驾驶级别定义

目前世界范围内对于自动驾驶等级的判定有两套标准，而比较主流的是一套来自于 SAE（国际自动机工程师学会，原译：美国汽车工程师学会），分为 0~5 级别，其具体含义如下图所示。

![img](https://pic2.zhimg.com/80/v2-dd1930bce782eae88c41a8c2290841ad_720w.jpg)

可以看出这图上下分为蓝色和绿色两大部分，而这两部分的划分存在一个临界值，只有达到/超过了这个临界值才可以称之为「自动驾驶」，否则只能算在「辅助驾驶」的范畴内。

#### [自动驾驶汽车关键技术|感知](https://zhuanlan.zhihu.com/p/75772265)

- **两套标准**
  - NHSTA
    - L0、L1、L2、L3、L4
  - SAE
    - L0、L1、L2、L3、L4、L5
- **自动驾驶系统结构**
  - lidar激光雷达
  - mradar毫米波雷达
  - camera
  - gps
  - uss超声波
  - imu惯性测量单元
  - mcu
- 自动驾驶的关键技术
  - 感知（perception）
    - 环境感知
    - 定位
  - 规划（planning）
  - 控制（control）



启动launcher一共会启动35个进程（弄清各节点功能）

- launcher
- zros_launcher --mode=simulator
  - log_center --mode=core
  - mcu_simulation
    - 
  - message_center
  - camera
  - spsd_node
  - dr_loc_node
    - 航迹推算
  - landmark_node
    - 
  - landmark_loc_node
    - 
  - location_service_node 
  - planning_ngp_node
    - NGP*智能导航辅助*驾驶*，*NGP*的英文全程是Navigation Guided Pilot，简称为*NGP*，可以基于用户设定的导航路线，实现从A点到B点的智能导航辅助*驾驶
  - marker_park_slot_detector
    - 指定泊车
  - topic_sod2
    - 
  - remote_ros
  - uss_node
    - 高级驾驶辅助系统(adas)中常用的超声波
  - visual_perception
    - 视觉感知(od)
  - mradar_service
    - 毫米波雷达
  - mradar_node
  - fused_perception_node
    - 
  - planning_park_node
  - object_sector_node
    - 
  - pnc_server_node
    - 规划控制
  - fusion_slot_target
    - 
  - fpse_node
    - 
  - visual_object
  - map_data_recorder
  - system_stat
  - park_agent
  - ui_dropngo
  - camera_data
  - communicate_agent
  - system_monitor
  - scene_classifier_node
  - zviz_node
    - ROS系统原生自带一个Visualization的工具RViz
    - [Foxglove](https://foxglove.dev/docs/studio)项目是webviz项目的一个延伸

#### 1.项目结构(zros_framework)

- doc

- include---头文件

  - adas

  - zros

- lib
  - base
    - log...
  - ...
- node---节点
  - example
  - ...
- tools
  - zrosbag2
  - zsil
    - data
    - hpp_test
    - avp_test
    - avp_nearby_test
    - loc_test
  - zsim
  - zviz
  - avp_test_node
  - map_test

#### 2.自定义node

###### avp_test_node

- node继承zros::core::Node，初始化（定位、车位），纯虚函数重载。
- 创建pwmm，和vehicleinfo对象并初始化
  - vehicle 参数为this(event_loop)
  - pwmm参数为this和vehicle
- 读取文件
  - ifstream()---create pointer
    - is_open()

- 加载坐标数据和停车点数据
  - std::string
  - std::regex
    - std::sregex_iterator it(str.begin(),str.end(),pattern)
  - vector

- vehicle继承amvehicleinfoobserverinterface

###### vehicleinfo_presenter

- vehicle继承AmVehicleInfoObserverInterface

  ```
    pwmm_client_presenter_ = zros::application_model::AmFactory::Instance()->GetApplicationModelClient<AmParkWithMapModelClientInterface>(zros::application_model::am_name_root);
    pwmm_client_presenter_->Initialize(event_loop_);
    pwmm_client_presenter_->RegisterObserver(this);
    pwmm_client_presenter_->OnForegroundActive();
  ```

- OBSERVER_INTF_IMPL()(不懂)

  - vehicle
  - capture
  - location

- GetVehicleInfo

- GetLocationStatus

- GetGnssOdom

- GetCarPosition

- StartCapture


###### Pwmm_presenter

- pwmm继承AmParkWithMapModelClientObserver
- initmap()
-  CreatePickUpJson()
- 

###### main函数

- 初始化zros::application_model::AmPluginManager::instance函数(例子)
  - plugin 插件
- 调用node类Loop函数

###### 纯虚函数的一个继承方法（免实现）

```
std::shared_ptr<AmParkWithMapModelClientInterface> pwmm_client_presenter_;
void Start(){
 pwmm_client_presenter_->StartCommand();//StartCommand()是基类的纯虚函数
}
```



























