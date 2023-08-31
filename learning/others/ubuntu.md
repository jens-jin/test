ubuntu基本设置

[搜狗输入法](https://blog.csdn.net/small_wu/article/details/125072454)

#### 安装软件

#### deb包

安装：

```
sudo dpkg -i deb包
```

卸载

```
sudo dpkg -r 包名
```

#### rpm包

方案一：

1、先安装 alien 和 fakeroot 这两个工具，其中前者可以将 rpm 包转换为 deb 包。安装命令为：

sudo apt-get install alien fakeroot

2.、将需要安装的 rpm 包提前下载备用（package.rpm）。

3.、使用 alien 将 rpm 包转换为 deb 包：

 fakeroot alien package.rpm

4.、一旦转换成功，我们可以即刻使用以下指令来安装：

sudo dpkg -i package.deb

方案二：

Step1

sudo apt-get install rpm alien

Step2

alien -d package.rpm

Step3

sudo dpkg -i package.deb



#### firefox换背景色

```
#A6CAA2
```

#### chrome弹出enter password

```
find ~/ -name login.keyring
suod rm -rf 文件 
```

#### 进程后台运行

killall

kill -9 

nohup：忽略SIGHUP（挂起）

```
>/dev/null 2>&1 &


>/dev/null 表示将标准输出信息重定向到"黑洞"

2>&1 表示将标准错误重定向到标准输出
```



#### 需要确认才执行的命令自动确认

```
yes Y|yum install ...(输入Y确认)
```



#### sudo卡住

因为修改了主机名，建议同步 /etc/hosts里的主机名

#### 系统字体大小

桌面配置工具

```
sudo apt install gnome-tweaks
gnome-tweaks
font 
```

#### ubuntu系统字体汉语

区域和语言，输入源

#### vscode 安装配置

https://blog.csdn.net/crusierLiu/article/details/106131473

[VScode汉化以及如何设置跳转到函数定义](https://blog.csdn.net/qq_39800732/article/details/112427994)

#### ubuntu普通用户获取root权限

```
推荐方法二： 修改 /etc/sudoers 文件，找到下面一行，在root下面添加一行，如下所示：
root    ALL=(ALL)     ALL
tommy   ALL=(ALL)     ALL
修改完毕，现在可以用tommy帐号登录，然后用命令 su - ，即可获得root权限进行操作。
```

#### vim强制修改只读文件

命令的含义是把当前编辑的文件的内容当做标准输入输入到命令sudo tee 文件名里去

```
%，是vim当中一个只读寄存器的名字，总保存着当前编辑文件的文件路径
tee是一个把stdin保存到文件的小工具
:w !sudo tee %
```

#### 配置 CentOS 或 ubuntu 终端字体颜色

https://blog.csdn.net/CSDN_FengXingwei/article/details/81740446

#### ps常用命令



```
-显示进程参数等ps -aux 显示所有包含其他使用者的进程
ps a
ps -ef
```

#### grep查看日志





#### [ubuntu vscode卡死问题](https://www.jianshu.com/p/176c00115b40)

```
使用vscode的时候，经常会莫名卡顿。

经查，需要去掉gpu的支持

修改 /usr/share/applications/code.desktop

Exec=/usr/share/code/code --disable-gpu --unity-launch %F
修改 /usr/share/applications/google-chrome.desktop

Exec=/usr/bin/google-chrome-stable --disable-gpu %U
```

#### 双屏

https://www.cnblogs.com/arxive/p/13198252.html

#### 卡顿，swap

只需要调整这个值即可，

```javascript
sysctl vm.swappiness=10 #临时修改
echo "vm.swappiness=10" >> /etc/sysctl.conf #永久修改
sysctl -p #生效
```

复制

改完之后就会使用物理内存了，刚才卡的情况也解决了

#### nvidia[显卡驱动](https://blog.csdn.net/wm9028/article/details/110268030)

[vmware ubuntu](https://blog.csdn.net/RadiantJeral/article/details/126919801#:~:text=%E3%80%90Linux%E3%80%91%E3%80%90Ubuntu%E3%80%91%E5%9C%A8VMware%E8%99%9A%E6%8B%9F%E6%9C%BA%E4%B8%AD%E5%AE%89%E8%A3%85Ubuntu18.04%EF%BC%88%E4%BF%9D%E5%A7%86%E7%BA%A7%E5%9B%BE%E6%96%87%E6%95%99%E7%A8%8B%EF%BC%89%201%201.%20%E5%9C%A8%20VMware%20%E4%B8%AD%E6%96%B0%E5%BB%BA%E8%99%9A%E6%8B%9F%E6%9C%BA%20%E5%AE%89%E8%A3%85%20VMware,Ubuntu%2018.04%20%E6%8C%89%E7%85%A7%202.2%20%E4%BF%AE%E6%94%B9%E5%88%86%E8%BE%A8%E7%8E%87.%20Ubuntu%2018.04%20%E5%B7%B2%E7%BB%8F%E6%88%90%E5%8A%9F%E5%AE%89%E8%A3%85.) 安装https://blog.csdn.net/weixin_47100990/article/details/115396068

ubuntu分辨率：https://zhuanlan.zhihu.com/p/194085426
