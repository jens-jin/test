#### 1.文件操作

###### 1.文件目录

os.listdir()

os.path.isdir

###### 2.文件名

os.path.join()

os.path.exists()

os.remove（）

###### 3.文件内容

 remotes/shaitgrt01/stable

###### 字符串操作

在carla仿真环境中遍历停车场车位。

进行中

1. 编写自动化测试用例，循环车位信息进行avp指定泊车

2.需在重庆部署carla服务器	

1.

###### json操作

1.匹配

```
        doc = ET.parse(playback_xml_path)
        root = doc.getroot()
        sub= root.find("path")
        sub.text = self.capture_path
        doc.write(playback_xml_path)
        #实现更改xml里某个参数的值
```

with open() as f

f.readlines()

数组：

append()

replace()

字符串：

1.拼接

- +号
- 占位符
  - ---""%s%d" %(a,b)
  - "{位置参数/关键字参数}"format()
  - f-string



split()

###### 格式化输出:

"{}" .format()









#### 2.启动进程的几种方式

###### subprocess

subprocess.call()

```
shell=True,stdout=open(self.launcher_log_file, 'a'), stderr=open(self.launcher_log_file, 'a')
```

subprocess.Popen()

3.时间操作

time.time()

time.strftime()

```
        self.begin_date = time.strftime("%Y-%m-%d %H:%M:%S", time.localtime(time.time()))
```

time.sleep()

#### 3.pip

[pip将python第三方包安装到指定路径下 ](https://www.cnblogs.com/dy99/p/15126213.html)

```
sudo pip3 install 模块名 -t 路径
```

#### 4.编译运行

python如何不生成pyc文件（三种方式）

Recar

于 2018-10-08 12:31:53 发布

9513
 收藏 4
分类专栏： 小技巧 Python
版权

小技巧
同时被 2 个专栏收录
39 篇文章0 订阅
订阅专栏

Python
33 篇文章0 订阅
订阅专栏
pyc文件的生成是什么情况下生成呢：
当 import导入另一个模块的时候会生成
python3会生成 __pycache__
如何不生成编译文件呢：
1.使用 -B参数 即
python3 -B test.py
里面的包含的就不会生成pyc了

2.设置环境变量

export PYTHONDONTWRITEBYTECODE=1
1
还有一种更方便的
3. 在导入的地方写

import sys
sys.dont_write_bytecode = True
1
2
以上三种方式都可以实现不生成pyc文件。