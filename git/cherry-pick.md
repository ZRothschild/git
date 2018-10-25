# cherry-pick

### git cherry-pick 命令格式

> git cherry-pick `[<options>]` `<commit-ish>`...
> 或者 git cherry-pick `<subcommand>`

### git cherry-pick 使用场景

`cherry-pick` 和它的名称一样，精心挑选，挑选一个我们需要的`commit`进行操作。它可以用于将在其他分支上的`commit`修改，移植到当前的分支。

一个很常见的场景，就是想在某个稳定版本上，添加一个刚开发完成的版本中的功能。就可以使用`cherry-pick`命令，将这个功能相关的 `commit`提取出来，合入稳定版本的分支上。

`cherry-pick`不仅可以用在不同分支之间, 还可以用在同一个分支上. 同一分支用法也是一样的, 同一分支使用情形:比如说你在某一个向某个分支中添加了一个功能, 
后来处于某种原因把它给删除了,然而后来某一天你又要添加上这个功能了, 这时候就可以使用`cherry-pick`把添加那个功能的`commit`, 再重演一遍.


###  git cherry-pick 参数

| 选项  | 英文注解   |  中文注解  |
| :--------: | :-----:  | :----:|
| --quit | end revert or cherry-pick sequence | 会打印出被拉取的项目详情，进度，错误等 |
| --continue | resume revert or cherry-pick sequence |  |
| --abort | cancel revert or cherry-pick sequence | 取消操作并返回到预序列状态。 |
| -n, --no-commit | don't automatically commit | 只是在当前分支上apply这些commits的改变，但是不提交到当前分支 |
| -e, --edit | edit the commit message | 将允许您在提交之前编辑提交消息 |
| -s, --signoff | add Signed-off-by | 在提交消息的末尾添加签名 |
| -m, --mainline `<parent-number>` | select mainline parent |  |
| --rerere-autoupdate | update the index with reused conflict resolution if possible |  |
| --strategy `<strategy>` | merge strategy |  |
| -X, --strategy-option `<option>` | option for merge strategy |  |
| -S, --gpg-sign`[=<key-id>]` | GPG sign commit |  |
| -x | append commit name | 表示保留原提交的作者信息进行提交 |
| --ff | allow fast-forward | 如果当前`HEAD`与`cherry-pick'ed`提交的父级相同，则将执行该提交的快进 |
| --allow-empty | preserve initially empty commits |  |
| --allow-empty-message | allow commits with empty messages |  |
| --keep-redundant-commits | keep redundant, empty commits |  |
                                         
                      
             
    
                          
    
                          