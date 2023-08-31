1.python:

2.c++：

3.仿真器相关(节点交互输入输出)

4.

```
i9 12900：3600
4080:10000
32G:700
2TSSD:1400?
8T:800?

```

git使用
	创建与合并分支命令
		查看分支：git branch
创建分支：git branch name
切换分支：git checkout name
创建+切换分支：git checkout –b name
合并某分支到当前分支：git merge name
删除分支：git branch –d name
	获取分支
		强制覆盖：git fetch --all
git reset --hard origin/master
获取和合并：
git pull <远程主机名> <远程分支名>:<本地分支名>
第一次：
git clone +commit-msg hook
	上传代码
		git status
git add 文件夹
git add .表示当前文件夹下所有文件（
git reset HEAD 可撤回add操作）
git commit -m 'add ...'
git push origin HEAD:refs/for/master
(
gitdir=$(git rev-parse --git-dir); scp -p -P 29418menghan.wang@shaitgrt01:hooks/commit-msg ${gitdir}/hooks/
git commit --amend
git push origin HEAD:refs/for/mastergit使用
	创建与合并分支命令
		查看分支：git branch
创建分支：git branch name
切换分支：git checkout name
创建+切换分支：git checkout –b name
合并某分支到当前分支：git merge name
删除分支：git branch –d name
	获取分支
		强制覆盖：git fetch --all
git reset --hard origin/master
获取和合并：
git pull <远程主机名> <远程分支名>:<本地分支名>
第一次：
git clone +commit-msg hook
	上传代码
		git status
git add 文件夹
git add .表示当前文件夹下所有文件（
git reset HEAD 可撤回add操作）
git commit -m 'add ...'
git push origin HEAD:refs/for/master
)
	repo使用
		repo status
			版本更新
git checkout commit_id
git checkout -b branch_name
repo start branch_name --all
repo abondon branch_name
		拉取仓库所有提交
git fetch --unshallow
	git修改代码
		“git  checkout  filename”      命令，撤销的是工作中文件的修改。
“git  reset  HEAD  filename”  命令，撤销的是暂存区中文件的修改。
		commit后撤销
			git reset --soft HEAD^,不删除工作空间的改动代码 ，撤销commit，不撤销git add file
git reset --hard HEAD^,删除工作空间的改动代码，撤销commit且撤销add
git reset --hard commit_id
git commit --amend,修改commit注释
		push后撤销
			git reset –-soft <版本号>
git push origin 分支名 –-force
	git更新
		git stash(需要切换到其他分支或者处理其他任务时)
 git pull
git stash pop
		git add -u 只添加添加修改
	git分支合并
		--branch dev
git add -u
git commit -m "xxx"
git checkout DropNGoLite
--branch DropNGoLite
#-Xours 保留主分支
git merge -Xtheirs dev
git reset --soft HEAD^(不然会有dev分支的提交信息和merge信息)
git commit -m "xxx"
git push origin HEAD:refs/for/DropNGoLite