#### [zros docker指南](http://zmwiki.zongmutech.com/index.php/ZROS_docker%E4%BD%BF%E7%94%A8%E6%8C%87%E5%8D%97)

#### 操作docker镜像

- ~/.zros_config/user_config.#.sh：配置文件
- 使用
  - 在用zros docker image时，我们会为每个zros目录，创建一个专属的container.
    - zros代码会被mount到container的~/zros
    - host的根目录，会被mount到container的/opt/host_root
    - 注意：不要把重要文件放在container的其它路径下。container删除后，这些文件都会丢失。
  - zros顶层目录下的./d程序是zros docker操作的唯一入口。
    - ./d start //创建并启动一个container
    - ./d stop //关闭并删除一个container
    - ./d terminator //打开一个GUI的terminal。可以用ctrl+shift+t创建多个tab页
    - ./d bash //在当前console下，进入container的bash
    - ./d //等于./d terminator
  - container里现在可以运行x86_64的zros的ui app; rviz; gazebo
- long life container VS one time container:
  - 如果不使用./d start创建，就直接使用./d terminator或./d bash的话，./d会创建一个新的container去运行，当命令退出后，这个container就会被删除。
  - 如果使用./d start创建一个container， 那么这个container就一直存在（host reboot后也存在），直到用./d stop才删除它。

#### docker 客户端使用

- 拉取、编译等均在容器内执行

- 容器挂载了两个目录：

  ```
  /home/carla/zros:/home/user/zros
  /home/carla/workspace:/home/user/wokspace
  ```

- 自动化策略是jenkins连上外面的ubuntu22.04,执行/home/carla/workspace/CE_SIL_02/start.sh的shell命令去启动自动化任务（包括环境变量设置、拉取、编译、执行）

  ```
  docker exec docker_name /bin/bash -c 'command'
  ```

  carla更新
  
  ```
  docker run -itd --restart=always --net=host --name carla2000 192.168.90.160:8888/repository/sage/sys/carla:1.0.0 /bin/bash ./CarlaUE4.sh -RenderOffScreen -carla-port=2000
  ```
  
  