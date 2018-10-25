# git clone 用法

###  git clone 命令格式

> git clone `[options]` `[--]` `<repo>` `[<dir>]`

###  git clone 参数

| 选项  | 英文注解   |  中文注解  |
| :--------: | :-----:  | :----:|
| -v, --verbose | be more verbose | 会打印出被拉取的项目详情，进度，错误等 |
| -q, --quiet  | be more quiet | 与`-v`相反,什么都不对打印 |
| --progress | force progress reporting | 强制进度报告 |
| -n, --no-checkout | don't create a checkout | 只会拉取`.git`文件,项目文件需要自行`pull` |
| --bare | create a bare repository | 创建一个裸存储库 |
| --mirror | create a mirror repository (implies bare) | 创建镜像存储库(加强版`bare`) |
| -l, --local | to clone from a local repository | 从本地文件克隆仓库 |
| --no-hardlinks | don't use local hardlinks, always copy | 不要使用本地硬链接,请始终复制 |
| -s, --shared | setup as shared repository | 设置为共享存储库 |
| --recurse-submodules`[=<pathspec>]` | initialize submodules in the clone | 初始化克隆中的子模块 |
| -j, --jobs `<n>` | number of submodules cloned in parallel | 并行克隆的子模块数量 |
| --template `<template-directory>` | directory from which templates will be used | 将使用模板的目录 |
| --reference `<repo>` | reference repository |  参考仓库 |
| --reference-if-able `<repo>` | reference repository | 参考仓库 |
| --dissociate | use --reference only while cloning | 使用 - 仅在克隆时使用引用 |
| -o, --origin `<name>`  | use <name> instead of 'origin' to track upstream | 使用`<name>`代替`origin`来跟踪上游 |
| -b, --branch `<branch>` | checkout <branch> instead of the remote's HEAD | `checkout <branch>`而不是`remote's HEAD`,选择分支拉取 |
| -u, --upload-pack `<path>` | path to git-upload-pack on the remote | 远程上`git-upload-pack`的路径 |
| --depth `<depth>`  | create a shallow clone of that depth | 创建一个指定深度的浅层克隆 |
| --shallow-since `<time>` | create a shallow clone since a specific time | 从特定时间开始创建一个浅层克隆 |
| --shallow-exclude `<revision>` | deepen history of shallow clone, excluding rev | 加深浅层克隆的历史，不包括转速 |
| --single-branch | clone only one branch, HEAD or --branch | 仅仅克隆一个分支，`HEAD`或`--branch` |
| --no-tags | don't clone any tags, and make later fetches not to follow them | 不要克隆任何标记，并使以后的提取不遵循它们 |
| --shallow-submodules | any cloned submodules will be shallow | 浅克隆子模块 |
| --separate-git-dir `<gitdir>` | separate git dir from working tree | 将`git dir`与工作树分开 |
| -c, --config `<key=value>` | set config inside the new repository | 在新存储库中设置配置信息 |
| -4, --ipv4 | use IPv4 addresses only | 仅使用IPv4地址 |
| -6, --ipv6 | use IPv6 addresses only |  仅使用IPv6地址 |
                            

###  `git clone -v  https://github.com/ZRothschild/git.git`
> 印出被拉取的项目详情，进度，错误

![git clone -v](git/img/clone/v.jpg)

###  `git clone -q  https://github.com/ZRothschild/git.git`
> 与`-v`相反,什么都不对打印

![git clone -q](git/img/clone/q.jpg)

###  `git clone --progress  https://github.com/ZRothschild/git.git`
> 强制打印进度报告

![git clone -progress](git/img/clone/progress.jpg)

###  `git clone -n  https://github.com/ZRothschild/git.git`
>  只会拉取`.git`文件,项目文件需要自行`pull`

![git clone -n](git/img/clone/n.jpg)


###  `git clone --bare  https://github.com/ZRothschild/git.git`
> 1. 制作一个简单的`Git`存储库.也就是说,不是创建`<directory>`并将管理文件放在`<directory>/.git`中,而是将`<directory>`本身设为`$GIT_DIR`.
> 2. 这显然意味着`-n`因为无处可查看工作树.远程处的分支头也直接复制到相应的本地分支头,而不将它们映射到`refs/remotes/origin/`.
> 3. 使用此选项时,既不会创建远程跟踪分支,也不会创建相关的配置变量.不包含工作区.

![git clone -bare](git/img/clone/bare.jpg)

> 拉取文件示例

![git clone -bare](git/img/clone/bare_rep_one.jpg)

>  `config`文件配置信息

```go
[core]
	repositoryformatversion = 0
	filemode = false
	bare = true
	symlinks = false
	ignorecase = true
[remote "origin"]
	url = https://github.com/ZRothschild/git.git
```

###  `git clone --mirror  https://github.com/ZRothschild/git.git`
> 1. 是`--bare`升级命令
> 2. 所有引用中的每一个都将按原样复制.您将获得所有标签，本地分支,远程分支,以及其他.一切都与克隆的仓库完全一样.
> 3. 设置远程跟踪,这样如果你运行`git`远程更新,所有引用都将被覆盖,就好像你刚刚删除了镜像并重新克隆它一样.
> 4. 正如文档最初所说,它是一面镜子.它应该是功能相同的副本,可与原始副本互换.

![git clone -mirror](git/img/clone/mirror.jpg)

> 拉取文件示例与`--bare`一样,只是配置文件不同

![git clone -mirror](git/img/clone/bare_rep_one.jpg)

>  config 文件配置信息

```go
[core]
	repositoryformatversion = 0
	filemode = false
	bare = true
	symlinks = false
	ignorecase = true
[remote "origin"]
	url = https://github.com/ZRothschild/git.git
	fetch = +refs/*:refs/*
	mirror = true
```

###  `git clone -l ./git/.git  ./test`
> 1. 当要克隆的存储库位于本地计算机上时,此标志会绕过正常的`Git aware`传输机制,并通过制作`HEAD`副本以及对象和`refs`目录下的所有内容来克隆存储库.
> 2. `.git/objects/`目录下的文件是硬链接的,以便在可能的情况下节省空间,当参考的仓库被删除,将导致本仓库也会出现问题.
> 3. 如果将存储库指定为本地路径(例如,`/path/to/repo`),则这是默认值,而`--local`本质上是无操作.如果将存储库指定为URL,则忽略此标志(并且我们从不使用本地优化).
> 4. 指定`--no-local`将在使用常规`Git`传输时给出`/path/to/repo`时覆盖默认值,不懂什么是硬链接的自己百度.

![git clone -l](git/img/clone/l.jpg)

###  `git clone --no-hardlinks ./git/.git  ./test`
> 1. 从本地文件系统上的存储库强制克隆进程,以复制`.git/objects`目录下的文件,而不是使用硬链接. 如果您尝试备份存储库,则可能需要这样做.
> 2. `-l .git/objects/`目录下的文件是硬链接,而 `--no-hardlinks`是复制,当参考的仓库被删除,将导致本仓库也会出现问题.

![git clone -l](git/img/clone/no-hardlinks.jpg)


###  `git clone -s ./git/.git`

> 1. 当要克隆的存储库位于本地计算机上而不是使用硬链接时,自动设置.`git/objects/info/alternates`以与源存储库共享对象.
> 2. 生成的存储库在没有任何自己的对象的情况下开始。
> 3. 注意：这是一个可能危险的操作;除非你明白它的作用,否则不要使用它.
> 4. 如果使用此选项克隆存储库,然后在源存储库中删除分支(或使用任何其他任何现有提交未引用的Git命令).则某些对象可能会变为未引用(或悬空).
> 5. 这些对象可以通过正常的`Git`操作(例如`git commit`)来删除,这些操作会自动调用`git gc --auto`(请参阅git-gc [1]).
> 6. 如果删除了这些对象并被克隆的存储库引用,则克隆的存储库将损坏.
> 7. 请注意，在使用`-s`克隆的存储库中运行不带`-l`选项的`git repack`会将对象从源存储库复制到克隆存储库中的包中,从而消除克隆的磁盘空间节省.
> 8. 但是，运行`git gc`是安全的,它默认使用`-l`选项。
> 9. 如果要打破在其源存储库中使用`-s`克隆的存储库的依赖关系,只需运行`git repack -a`即可将源存储库中的所有对象复制到克隆存储库中的包中.

###  `git clone --recurse-submodules[=<pathspec>] https://github.com/ZRothschild/git.git`

> 1. 创建克隆后,根据提供的`pathspec`初始化和克隆子模块.如果未提供`pathspec`,则初始化并克隆所有子模块.
> 2. 对于包含多个条目的`pathspec`,可以多次给出此选项.生成的克隆将`submodule.active`设置为提供的`pathspec`,或"."(如果没有提供`pathspec`,则表示所有子模块).
> 3. 子模块使用其默认设置进行初始化和克隆.这相当于在克隆完成后立即运行`git`子模块更新`--init --recursive <pathspec>`.
> 4. 如果克隆的存储库没有`worktree/checkout`(即,如果给出了`--no-checkout/-n`,`-bare`或`--mirror`中的任何一个),则忽略此选项.

###  `git clone -j 2 https://github.com/ZRothschild/git.git`

> 1. 同时获取的子模块数.默认为`submodule.fetchJobs`选项.

###  `git clone --template  https://github.com/ZRothschild/git.git`

> 1. 指定将使用模板的目录;(参见`git-init [1]`的`TEMPLATE DIRECTORY`部分)


###  `git clone --reference  https://github.com/ZRothschild/git.git`

> 1. 如果引用存储库位于本地计算机上,则自动设置`.git/objects/info/alternates`以从引用存储库获取对象.
> 2. 使用现有存储库作为备用存储库将需要从克隆的存储库中复制更少的对象,从而降低网络和本地存储成本.
> 3. 使用`--reference-if-able`时,将跳过不存在的目录,并显示警告而不是中止克隆.
> 4. 注意:请参阅`--shared`选项的注释,以及`--dissociate`选项.