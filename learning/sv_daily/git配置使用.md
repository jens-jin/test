1.windows用**管理员权限安装和打开**git（不要装官网的，避免其他错误），默认安装即可

```
路径：\\shfp08\SmartECU_Shares\Software\Shared\Mcu_department\01-software\06-GIT
```

2.以管理员权限打开git bash中运行下面命令,输入命令后，一路按回车

```
ssh-keygen -t rsa
```

3.复制key

```
cat ~/.ssh/id_rsa.pub
```

到gerrit网站:[右上角用户名/setting/SSH Public Keys](http://shaitgrt01/#/settings/ssh-keys)，输入key并add

4.修改配置

```
echo HostKeyAlgorithms ssh-rsa>>/etc/ssh/ssh_config
```

5.配置用户名和邮箱

```
 每次 Git 提交时都会引用这两条信息，说明是谁提交了更新，所以会随更新内容一起被永久纳入历史记录
git config --global user.name "你的用户名"
git config --global user.email "你的邮箱"
git config --global url."ssh://你的用户名@shaitgrt01".insteadOf ssh://shaitgrt01
```

6.拉取代码验证，选择有权限的仓库，如

```
git clone ssh://用户名@shaitgrt01:29418/zros/autotest_tools && scp -p -P 29418 用户名@shaitgrt01:hooks/commit-msg autotest_tools/.git/hooks/
```

报错：

```
1.rm ~/.ssh/known_hosts
2.用管理员权限打开
3...
解决后再git clone
```



### GIt上传代码

\- 查看仓库状态：git status
\- 添加文件：git add filename
\- 添加**当前文件夹下**所有修改的文件：git add . (可使用 git reset HEAD 撤回 add 操作)
\- 提交代码到本地：git commit -m '你的提交信息'
\- 推送到远程仓库：git push origin HEAD:refs/for/master

-网页上verify+1,选择reviewer
