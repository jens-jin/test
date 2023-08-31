#### 良好git发布流程的习惯:

```
# 分支合并发布流程：
git add .			# 将所有新增、修改或删除的文件添加到暂存区
git commit -m "版本发布" # 将暂存区的文件发版
git status 			# 查看是否还有文件没有发布上去
git checkout test	# 切换到要合并的分支
git pull			# 在test 分支上拉取最新代码，避免冲突
git merge dev   	# 在test 分支上合并 dev 分支上的代码
git push			# 上传test分支代码

```

```
Git专门提供了一个cherry-pick命令，让我们能复制一个特定的提交到当前分支
```

[git命令学习](https://www.liaoxuefeng.com/wiki/896043488029600/900375748016320)

[Git操作详解](https://zhuanlan.zhihu.com/p/263050507)

```
查看远程库信息，使用git remote -v；
本地新建的分支如果不推送到远程，对其他人就是不可见的；
从本地推送分支，使用git push origin branch-name，如果推送失败，先用git pull抓取远程的新提交；
在本地创建和远程分支对应的分支，使用git checkout -b branch-name origin/branch-name，本地和远程分支的名称最好一致；
建立本地分支和远程分支的关联，使用git branch --set-upstream branch-name origin/branch-name；
从远程抓取分支，使用git pull，如果有冲突，要先处理冲突。
```



# Git使用

### 创建与合并分支命令

\- 查看分支：git branch
\- 创建分支：git branch <branch_name>
\- 切换分支：git checkout <branch_name>
\- 创建并切换分支：git checkout -b <branch_name>
\- 合并某分支到当前分支：git merge <branch_name>
\- 删除分支：git branch -d <branch_name>

### 获取分支

\- 强制覆盖：git fetch --all
\- 重置到远程分支：git reset --hard origin/master
\- 获取和合并：git pull <remote_name> <remote_branch>:<local_branch>

### 第一次使用

\- 克隆仓库并获取钩子：git clone <repository_url> && cp commit-msg <repository_path>/.git/hooks/

### 上传代码

\- 查看状态：git status
\- 添加文件：git add <filename>
\- 添加**当前文件夹下**所有修改的文件：git add . (可使用 git reset HEAD 撤回 add 操作)
\- 提交代码到本地：git commit -m 'commit message'
\- 推送到远程仓库：git push origin HEAD:refs/for/master

### Repo使用

\- 查看状态：repo status
\- 版本更新
\- 切换到指定提交：git checkout <commit_id>
\- 创建并切换到新分支：git checkout -b <branch_name>
\- 开始新分支：repo start <branch_name> --all
\- 放弃分支：repo abandon <branch_name>
\- 拉取仓库所有提交：git fetch --unshallow

### Git修改代码

\- 撤销工作区文件修改：git checkout <filename>
\- 撤销暂存区文件修改：git reset HEAD <filename>

### 撤销commit

\- 保留工作空间的改动代码，撤销commit，不撤销git add：git reset --soft HEAD^
\- 删除工作空间的改动代码，撤销commit且撤销git add：git reset --hard HEAD^
\- 恢复到指定commit：git reset --hard <commit_id>
\- 修改commit注释：git commit --amend

### 撤销push

\- 恢复到指定版本：git reset --soft <commit_id>
\- 强制推送到远程分支：git push origin <branch_name> --force

### Git更新

\- 暂存当前修改：git stash
\- 拉取最新代码：git pull
\- 恢复暂存的修改：git stash pop

### Git分支合并

\- 切换到目标分支：git checkout <target_branch>
\- 添加修改到暂存区：git add -u
\- 提交修改：git commit -m "commit message"
\- 切换回原分支：git checkout <original_branch>
\- 合并目标分支到原分支：git merge <target_branch>
\- 提交合并结果：git commit -m "commit message"
\- 推送到远程仓库：git push origin HEAD:refs/for/<target_branch>

```
/home/user/projects/Clash.for.Windows-0.18.5-x64-linux/Clash-for-Windows-0.18.5-x64-linux
```

```
   [Desktop Entry]
   Type=Application
   Name=clash
   Exec=/home/user/projects/Clash.for.Windows-0.18.5-x64-linux/Clash-for-Windows-0.18.5-x64-linux/cfw
   Icon=/home/user/projects/Clash.for.Windows-0.18.5-x64-linux/Clash-for-Windows-0.18.5-x64-linux/icon.png
```

