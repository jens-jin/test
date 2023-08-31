# ROS中基本坐标系

ROS中基本坐标系的理解：map，odom，base_link，base_laster

![在这里插入图片描述](https://img-blog.csdnimg.cn/20201114181620403.png#pic_center)

## 1.map

地图坐标系，顾名思义，一般设该坐标系为固定坐标系，一般与机器人所在的世界坐标是重合的。

## 2.base_link

机器人本体坐标系，与机器人中心重合，当然有些机器人是base_footprint。

## 3.odom

**里程计坐标系**，这里主要区分**odom topic**，这是两个概念，一个是坐标系，一个是根据编码里程计计算得到的里程计信息。但是两者也有关系，odom topic转化得到的位姿[矩阵](https://so.csdn.net/so/search?q=矩阵&spm=1001.2101.3001.7020)是odom->base_link的tf关系。这时可能会有疑问：

**①位姿矩阵得到的不应该是map->base_link的tf关系吗？**
**②map坐标系与odom坐标系又有什么关系？**

其实机器人刚开始运动时，odom坐标系与map坐标系是重合的，即odom->base_link与map->base_link的tf是一致的。
但是随着时间的推移，出现了偏差，出现的偏差也就是里程计的累计误差，如果里程计精确度很高，没有计算误差，**那么map坐标系与odom坐标系会一直是重合的**。

然而实际情况中，里程计是有偏差的，所以我们计算里程计得到的位姿矩阵是odom->base_link，与map->base_link还是有偏差的。

**③那么map->odom的tf是怎么得到的呢？**

除去里程计还有一些合作校正的传感器例如imu，这些传感器可以估计出机器人在地图中的位置也就是map->base_link的tf，我们估计机器人在地图中的位置和解算里程计得到的位置的偏差也就是map->odom的tf。

## 4.base_laser

激光雷达坐标系，与激光雷达的安装点有关，它与base_link的tf是固定的。



# TF

#### topic通信

话题通信是一种异步通信，即数据的传输是单向的，只出不进.

两个node之间建立数据通讯需要经过上图所示的7步骤

1. talker注册：通过1234端口想master注册信息，其中包括话题名
2. listener注册
3. ros master信息匹配：通过listener的订阅信息，在注册列表中查找，没有找到发布者，就等待发布者的加入；找到的话，就通过RPC向listener发布talker的RPC地址信息。
4. listener发送连接请求：根据master给的地址，通过RPC向talker发送连接请求、话题名、消息类型、通讯协议
5. talker确认连接请求：通过RPC向listener确认连接信息，其中包含TCP地址
6. listener尝试与talker建立网络连接
7. talker向listener发布数据

前五个步骤都是RPC通信协议，最后才用到TCP