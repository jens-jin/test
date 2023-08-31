1.安装cget

```
git clone ssh://shaitgrt01:29418/toolschain/cget_release
sudo chmod a+x cget_release/cget
sudo cp cget /usr/bin
```

2.下载发布包和对应include包到/home/user/zros_version_path/

```
shfp07
```

3.拉取版本(在一个空目录下完成)

```
cget init m
input:/home/user/zros_version_path
```

![image-20230614152810372](/home/user/.config/Typora/typora-user-images/image-20230614152810372.png)

![image-20230614152906817](/home/user/.config/Typora/typora-user-images/image-20230614152906817.png)

按空格选择你要下载的源代码仓库，默认不选

![image-20230614153208664](/home/user/.config/Typora/typora-user-images/image-20230614153208664.png)

只会重新编译拉取的模块相关的代码，其他的节点使用编译好的版本

4.添加project--拉取其他模块代码

```
cget add_project
```

```

```

