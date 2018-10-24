# tar 

### tar 命令格式

tar `[OPTION...]` `[FILE]`..

### tar 命令选项

- -c: 建立压缩档案
- -x：解压,从备份文件中还原文件
- -t：列出备份文件的内容
- -r：向压缩归档文件末尾追加文件 
- -u：添加改变了和现有的文件到已经存在的压缩文件

> 这五个是独立的命令，压缩解压都要用到其中一个，可以和别的命令连用但只能用其中一个。
> 下面的参数是根据需要在压缩或解压档案时可选的。

1. -z：有gzip属性的,通过gzip指令处理备份文件
2. -j：支持bzip2解压文件
3. -Z：有compress属性的,通过compress指令处理备份文件
4. -v：显示所有过程,显示指令执行过程
5. -O：将文件解开到标准输出
6 -A或--catenate：新增文件到以存在的备份文件；
7. -B：设置区块大小；
8. -C <目录>：这个选项用在解压缩，若要在特定目录解压缩，可以使用这个选项。
9. -d：记录文件的差别；
10. -r：添加文件到已经压缩的文件；
11. -l：文件系统边界设置；
12. -k：保留原有文件不覆盖；
13. -m：保留文件不被覆盖；
14. -w：确认压缩文件的正确性；
15. -p或--same-permissions：用原来的文件权限还原文件；
16. -P或--absolute-names：文件名使用绝对名称，不移除文件名称前的`/`号；
17. -N <日期格式> 或 --newer=<日期时间>：只将较指定日期更新的文件保存到备份文件里；
18. --exclude=<范本样式>：排除符合范本样式的文件

> 参数-f是必须的  -f<备份文件>或--file=<备份文件>：指定备份文件
> -f: 使用档案名字，切记，这个参数是最后一个参数，后面只能接档案名。

### tar 示例

#### 压缩示例

> tar –cvf xx.tar  a b c     表示吧a,b,c打包入xx.tar

1. tar –cvf jpg.tar *.jpg     //将目录里所有jpg文件打包成tar.jpg,仅打包，不压缩
2. tar –zcf jpg.tar.gz *.jpg  //将目录里所有jpg文件打包成jpg.tar后，并且将其用gzip压缩，生成一个gzip压缩过的包，命名为jpg.tar.gz
3. tar –cjf jpg.tar.bz2 *.jpg //将目录里所有jpg文件打包成jpg.tar后，并且将其用bzip2压缩，生成一个bzip2压缩过的包，命名为jpg.tar.bz2
4. tar –cZf jpg.tar.Z *.jpg   //将目录里所有jpg文件打包成jpg.tar后，并且将其用compress压缩，生成一个umcompress压缩过的包，命名为jpg.tar.Z
5. tar -N "2012/11/13" -zcvf log17.tar.gz test  //在文件夹当中，比某个日期新的文件才备份
6. tar --exclude scf/service -zcvf scf.tar.gz scf/*    //备份文件夹内容是排除部分文件
7. tar -zcvpf log31.tar.gz log2014.log log2015.log log2016.log  //保存其权限,这个-p的属性是很重要的，尤其是当您要保留原本文件的属性时.

#### 解压示例

1. tar –xvf file.tar //解压 tar包,到当前目录
2. tar -xzvf file.tar.gz //解压tar.gz，到当前目录
3. tar -xjvf file.tar.bz2   //解压 tar.bz2
4. tar –xZvf file.tar.Z //解压tar.Z
5. tar -jxv -f filename.tar.bz2 -C filename //解压到指定目录
6. tar -zxvf filename.tar.gz go/index.go -C test //filename.tar.gz里面包含go，test文件夹，go里面有很多文件其中就有index.go,
此命令是，从filename.tar.gz解压出go文件加里面的index.go,并解压到test文件夹
7. tar -zxvf test.tar.gz --strip-components 1 -C  aa/   //test.tar.gz 压缩了test文件，里面有很多文件。此命令是解压test
把里面的内容放入aa文件夹

### 总结

1. `*.tar` 用 tar –xvf 解压
2. `*.gz` 用 gzip -d或者gunzip 解压
3. `*.tar.gz`和*.tgz 用 tar –xzf 解压
4. `*.bz2` 用 bzip2 -d或者用bunzip2 解压
5. `*.tar.bz2`用tar –xjf 解压
6. `*.Z` 用 uncompress 解压
7. `*.tar.Z` 用tar –xZf 解压