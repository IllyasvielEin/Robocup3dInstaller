# RoboCup3D env install one-lined.

[TOC]

## 简介

One-Line install the Robocup3D Environment.

Thanks for [D0ot](https://github.com/D0ot) and [EzraRT](https://github.com/orgs/hfutrobocup3d/people/EzraRT).

## 说明

使用前**务必阅读以下说明**：

1. 程序适用于Ubuntu18.04，其他版本烦请自行检测。
2. **重要**：使用前更换好国内源，**安装好Nvidia显卡驱动**（A卡，集显核显未测试）
3. 安装前务必确保已经完成2的操作。接着参照[使用方法](#使用方法)进行安装。
4. 如遇安装失败，可以根据setup.sh中的命令进行人工操作并debug。

## 使用方法

commandline enter:

```shell
wget -O- https://gitee.com/IllyasvielEin/Robocup3dInstaller/raw/master/ins.sh | bash
```

or

```shell
wget -O- https://github.com/IllyasvielEin/Robocup3dInstaller/raw/master/ins.sh | bash
```

安装最后使用:

```shell
source ~/.bashrc
```

指令：

```shell
rcssserver #打开服务器

roboviz #启动roboviz
```

## 安装列表

程序会安装或附带以下软件：

1. ode-tbb
2. SimSpark 0.7.4 （2022世界赛版本）
   - rcssserver3d
   - rsgedit
   - simspark相关功能等
3. Roboviz 1.8.2
4. magmaProxy

详见~/.local/Robocup3d/Robocup3dInstaller目录下文件夹。

## 安装解释

程序首先在~/.local目录下创建Robocup3d文件夹，随后将安装包下载至Robocup3dInstaller目录下。启动setup.sh。

该脚本会依次进行安装依赖，下载ode-tbb并安装，启动SimSpark安装脚本（install_simspark.sh），启动Roboviz重定向以及alias操作（bind.sh）。

## 卸载与升级

SimSpark会安装在/usr/local/目录下。升级新版本SimSpark或者需要卸载安装，脚本uninstall.sh拟用于卸载这些软件，

```shell
bash ./uninstall.sh
```

但因为自动rm操作比较危险，所以建议参照脚本的指令手动对文件进行**确认**并删除。

一般来说只需要删除SimSpark的相关文件，之后确保SimSpark是最新的SimSpark Realease，

输入

```shell
bash ./install_simspark.sh
```

即可完成安装升级。

注意setup.sh会写入~/.bashrc，如果需要多次使用可能在文件里需要删除多余的语句。

```shell
alias roboviz="..."
```

