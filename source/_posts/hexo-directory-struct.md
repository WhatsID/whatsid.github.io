---
title: Hexo文件目录结构
date: 2019-08-29 15:11:35
tags:
---

简单记录下Hexo的文件目录结构

<!-- more -->

## 1. 目录结构

```
├── .git
├── .deploy_git
├── _config.yml
├── db.json
├── deploy.sh
├── node_modules
├── package_lock.json
├── package.json
├── public
├── scaffolds
├── source
│      ├─ about
│      ├─ audio
│      ├─ img
│      ├─ _drafts
│      └─ _posts
└─themes
    ├─ landscape
    └─ next
         ├─ _config.yml
         ├─ languages
         ├─ layout
         ├─ scripts
         └─ source
```

## 1.1 .deploy_git
在部署到github后自动创建。

此目录中的内容 = github站点中对于repository中的内容 = 最近一次上传到站点的public目录中的内容。

因此，该目录的结构和 `public` 目录基本一致（不一致的情况是由于重新生成，但是没有发布站点造成，此时 `public` 内容新于 `.deploy_git` 内容）。

## 1.2 _config.yml
网站的配置信息文件，可以在此配置大部分的参数。具体设置参见 [配置 | Hexo](https://hexo.io/zh-cn/docs/configuration.html)。

## 1.3 db.json
执行 `hexo g` 时和 `public` 文件夹一同生成的缓存文件，用户存放生成的文章的信息。使用 `hexo clean` 命令会清除该文件。

## 1.4 deploy.sh
博客部署脚本。

## 1.5 node_modules
存放安装的Hexo扩展。

Hexo 默认安装：

- hexo: 主程序
- hexo-deployer-git: git部署
- hexo-generator-archive: 存档页面生成器
- hexo-generator-category: 类别生成器
- hexo-generator-index: index生成器
- hexo-generator-tag: 标签生成器
- hexo-renderer-ejs: 进一步了解 [EJS tj/ejs · GitHub](https://github.com/tj/ejs)
- hexo-renderer-stylus: 进一步了解 [ Stylus GitHub - hexojs/hexo-renderer-stylus: Stylus renderer for Hexo](https://github.com/hexojs/hexo-renderer-stylus)
- hexo-renderer-marked: Markdown引擎，让你可以用markdown格式书写博客
- hexo-server: 服务器，让你可以本地预览博客

在使用过程中自己安装的扩展也会在此新建目录。

## 1.6 package_lock.json
记录当前系统中所安装的各项依赖的版本，当执行 `npm install package` 命令时，会在本地生成或更新该文件(只有npm 5之后才会生成)，同时也防止版本的自动更新。

## 1.7 package.json
初始化时自动创建。记录项目的所安装的依赖项，当node_modules文件夹被删除之后可以通过该文件中记录的依赖版本来重现安装依赖。

## 1.8 public
执行 `hexo g` 命令，Hexo程序会解析 `source` 、当前使用的theme，生成的静态网页内容目录就是 `piblic` 。执行 `hexo d` 则将该目录内容复制到 `.deploy_git` 目录。

## 1.9 scaffolds
模版文件夹。当新建文章时，Hexo 会根据 scaffold 中的模板来建立文件。更多参见 [模版 | Hexo](https://hexo.io/zh-cn/docs/templates.html)。

## 1.10 source
存放用户资源的地方。

### 1.10.1 _posts
存放博客文章的地方，其中的markdown文件、html文件、org文件等会被解析并放到 `public` 文件夹，发布到站点。

### 1.10.2 其他开头命名为 _ (下划线)的文件 / 文件夹
将会被忽略。因此可以在source目录下创建 _drafts 目录用于存放未完成的草稿，其中内容不会发布到网站。

### 1.10.3 其他开头非_的文件 / 文件夹
会被拷贝到 `public` 目录并上传到站点。

- 可以创建 img 目录来存放在博客引用到的图片等。
- 要添加新的页面（例如about），执行 hexo new page PageName 命令即会在 source 中自动新建子目录 PageName 。

## 1.11 themes
主题 文件夹。默认安装 landscape 主题，你可以安装新主题到 themes 目录，也可以自己新建主题。一个主题的基本结构如下：

```
├── _config.yml
├── languages
├── layout
├── scripts
└── source
```

### 1.11.1 _config.yml
主题的配置文件。

### 1.11.2 languages
语言文件夹。根据 Hexo 目录中 _config.yml 设置的语言来选择站点以哪种语言来呈现。

### 1.11.3 layout
存放主题的模板文件，决定了网站内容的呈现方式。Hexo 根据模板文件的扩展名来决定所使用的模板引擎，例如：

>
- layout.ejs - 使用 EJS
- layout.swig - 使用 Swig

### 1.11.4 scripts
脚本文件夹。在启动时，Hexo 会载入此文件夹内的 JavaScript 文件。

### 1.11.5 sources
资源文件夹，除了模板以外的资源，例如 CSS、JavaScript 文件等，都应该放在这个文件夹中。

文件或文件夹开头名称为 _（下划线）或隐藏的文件会被忽略。

如果文件可以被渲染的话，会经过解析然后储存到 public 文件夹，否则会直接拷贝到 public 文件夹。

以next主题为例，其 source 目录的结构如下：

```
source
  ├─ css
  ├─ fonts
  ├─ images
  ├─ js
  └─ lib
```

#### 1.11.5.1 css
多为styl文件，next的css目录结构如下：

```
css
├─ _common
│  ├─_components
│  ├─_outline
│  └─ scaffolding
├─ _custom
├─ _mixins
├─ _variables
└─ main.styl
```

如果想自定义CSS，主要修改2个地方：

- _variables
- _custom