# git push

### git push 命令格式 
> `git push` <远程主机名> <本地分支名>:<远程分支名>
 
`git push origin dev:dev` 将本地分支`dev`上传到远程主机名为`origin`的`dev`分支

> `git push` <远程主机名> <本地分支名>

`git push origin dev` 把本地`dev`分支推送到远程主机名为`origin`的`dev`分支

省略远程主机名`git push dev`，`git push dev:dev` 表示把本地分支`dev`推送到与本地参考的克隆的远程主机名的`dev`分支

> `git push` <远程主机名>

如果当前分支和远程分支存在追踪关系，则本地分支和远程分支都可以忽略

> `git push origin master`

上面命令表示，将本地的`master`分支推送到`origin`主机的`master`分支。如果`master`不存在，则会被新建

> `git push origin :master`  等同于 `git push origin --delete master`

上面命令表示删除`origin`主机的`master`分支。如果当前分支与远程分支之间存在追踪关系，则本地分支和远程分支都可以省略。

> `git push origin HEAD` 

将当前分支推送到远程的同名的简单方法

> `git push origin HEAD:master`

将当前分支推送到源存储库中的远程引用匹配主机。 这种形式方便推送当前分支，而不考虑其本地名称

> `git push -u origin master`

上面命令将本地的`master`分支推送到`origin`主机，同时指定`origin`为默认主机，后面就可以不加任何参数使用`git push`了

不带任何参数的`git push`，默认只推送当前分支，这叫做`simple`方式。此外，还有一种`matching`方式，会推送所有有对应的远程分支的本地分支。`Git 2.0`版本之前，默认采用`matching`方法，现在改为默认采用`simple`方式。如果要修改这个设置，可以采用`git config`命令

```bash
git config --global push.default matching

git config --global push.default simple

```

还有一种情况，就是不管是否存在对应的远程分支，将本地的所有分支都推送到远程主机，这时需要使用–all选项

```bash

git push --all origin

```
> 查看`push`结果

```bash

gitk rbranch-1

```

> [参考教材](https://www.yiibai.com/git/git_push.html)



