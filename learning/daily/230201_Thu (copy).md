1.超时时间20min,加个判断30s

2.apa SIL plan:

```
1.地图组工具添加静态障碍物
2.仿真地图可视化，支持json等配置文件
3.仿真帧率确认30fps时，各节点的帧率，以及时间是否同步
```



周三：

1.pnc/planning仓库没权限，导致无法开启召唤泊车功能，申请权限。

2.优化ppn模块，增加启动功能的超时判断。

周四：

1.优化、维护dg21

```
video_encoder 更改了8155的配置没有更改 x86,在Ubuntu上还没有完成； 主要影响zrecorder，和communication_againt
```

2.整理各个case输出文档到重庆人员（zy）

3.学习工具使用（加强分析能力）eg.foxglove

4.apa lite了解

5.验证pnc1.0出现的问题，在pnc2.0是否解决



周五：

1.repo sync -f -j16(j4)+ depth=1节约11分钟（从19分钟到8分钟）

2.尝试优化hpp超时问题