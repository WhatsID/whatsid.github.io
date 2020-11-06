---
title: Android反编译的一些姿势
date: 2020-11-06 15:14:36
tags:
---

## 1. 反编译

### 1.1 工具下载

- [apktool](https://ibotpeaches.github.io/Apktool/install)
- [dex2jar](https://github.com/pxb1988/dex2jar/releases/)
- [jd-gui](http://java-decompiler.github.io/)

将上述三个文件放在同一个文件夹中，例如~/Code/Decompile

### 1.2 环境搭建

#### 1.2.1 配置环境变量
 - 执行 `open ~/.bash_profile` ，配置环境变量和alias：

```
export PATH=${PATH}:~/Documents/Code/Decompile

alias dex2jar='d2j-dex2jar.sh'
alias jd-gui='java -jar /Users/WhatsID/Documents/Code/Decompile/jd-gui-osx/jd-gui-1.6.6.jar'
```

#### 1.2.2 验证是否安装成功
执行 `apktool -v` ，如果输出版本号则证明配置成功

执行 `jd-gui`，如果打开jd-gui的窗口则证明配置成功

### 1.3 工具使用

#### 1.3.1 反编译

##### 反编译资源
执行命令 `apktool d [apk文件]`, 会在当前目录下生成apk文件名的文件夹，该文件夹中的xml文件可以直接查看。

##### 反编译代码
**方法1：**

1. `apktool d -s apk_file.apk`
2.  apk_file文件夹中会看到classesN.dex

**方法2：**

1. 将apk_file.apk重命名为 apk_file.zip：`mv apk_file.apk apk_file.zip`
2. 解压zip文件到out文件夹中 `mkdir out; unzip apk_file.zip -d out`
3. out文件夹中会看到classesN.dex

#### 1.3.2 查看java代码
1. 执行 `dex2jar classesN.dex`,会在当前目录生成classesN-dex2jar.jar
2. 将该文件拖到jd-gui的窗口中即可查看java代码

### 1.4 注意事项

- 打开jar文件时jd-gui可能会出现 Invalid input fileloader错误，在命令行输入：sudo chmod +xr classes-dex2jar.jar即可解决
- 遇到 Permission denied，需要给当前脚本授权，例如：`chmod +x apktool`

## 2. 令App可调试

1. [工具下载](https://github.com/WindySha/ManifestEditor/releases/download/v1.0.2/ManifestEditor-1.0.2.jar)
2. 环境配置，将工具同样放在Decompile文件夹下，并配置alias为manifest-editor
3. 执行 `apktool d -s -r apk_file.apk`, 生成apk_file文件夹
4. 新增debuggable=true的属性：`manifest-editor apk_file/AndroidManifest.xml -d 1`
5. 上一步会在apk_file文件夹生成AndroidManifest-new.xml，将其重命名为AndroidManifest.xml并覆盖源文件: `mv apk_file/AndroidManifest-new.xml apk_file/AndroidManifest.xml`
6. 回编代码：`apktool b apk_file -o apk_file_unsigned.apk`
7. 重签名：`jarsigner -verbose -keystore keystore_path -signedjar apk_file_signed.apk apk_file_unsigned.apk keystore_alias`
8. 安装新生成的apk文件：`apk install apk_file_signed.apk`
9. 完成

更多manifest-editor命令可以看[这里](https://github.com/WhatsID/ManifestEditor)