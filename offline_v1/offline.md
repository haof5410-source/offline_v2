[//]: # (fuhao)
### 2025/9/16
今天开始
做项目![img.png](..%2Fimg%2Fimg.png)
### 2025/9/17
现在开始mysql有了数据
![img_1.png](..%2Fimg%2Fimg_1.png)
现在开始写一个python脚本生成一下mysql数据导入到hive里面的一个脚本
![img_3.png](..%2Fimg%2Fimg_3.png)
运行的脚本是(这个是单机的所以要改好执行要加上 -c local,然后路径要改并且文件夹要改好)
![img_4.png](..%2Fimg%2Fimg_4.png)
运行正确的话就会显示
![img_2.png](..%2Fimg%2Fimg_2.png)
hive开始有了数据
![img_5.png](..%2Fimg%2Fimg_5.png)
### 2025/9/18
今天我发现了我的hive数据有问题没有全量和增量所以我就改了一下生成文件分成两个一个是生成增量一个是全量![img_6.png](..%2Fimg%2Fimg_6.png)![img_7.png](..%2Fimg%2Fimg_7.png)
并且的我给执行脚本添加了一个执行命令加个1就是全量加2就是增量这样的话方便了我们可以更好的从mysql当中提取增量数据到hive里面![img_8.png](..%2Fimg%2Fimg_8.png)