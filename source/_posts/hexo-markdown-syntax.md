---
title: Hexo博客的Markdown语法
date: 2019-08-21 13:00:12
modify: true
tags:
---

# 1.Markdown语法
## 1.1 标题
---
Markdown支持6种级别的标题，对应html标签 h1 ~ h6

```
# h1   //一级标题 对应 <h1> </h1>
## h2   //二级标题 对应 <h2> </h2>
### h3  //三级标题 对应 <h3> </h3>
#### h4  //四级标题 对应 <h4> </h4>
##### h5  //五级标题 对应 <h5> </h5>
###### h6  //六级标题 对应 <h6> </h6>
```

## 1.2 段落及区块引用
---
Markdown提供了一个特殊符号 > 用于段首进行强调，被强调的文字部分将会高亮显示

```
> 这段文字将会被高亮显示
```
以上标记显示效果如下：
> 这段文字将会被高亮显示

## 1.3 插入链接或图片
---
Markdown针对链接和图片的处理也比较简单，可以使用下面的语法进行标记

```
[点击跳转至Google](https://www.google.com)
![图片](http://e.hiphotos.baidu.com/image/pic/item/55e736d12f2eb93867023248df628535e5dd6f19.jpg)
```
以上标记显示效果如下：
[点击跳转至Google](https://www.google.com)
![图片](http://e.hiphotos.baidu.com/image/pic/item/55e736d12f2eb93867023248df628535e5dd6f19.jpg)

*注： 引用图片和链接的唯一区别就是在最前方添加一个感叹号。*

## 1.4 列表
---
Markdown支持有序列表和无序列表两种形式：

```
无序列表使用 * 或 + 或 - 标识
有序列表使用数字加 . 标识，例如：1.
注意：标识和文字之间要有一个空格

- 无序列表1
- 无序列表2
- 无序列表3

1. 有序列表1
2. 有序列表2
3. 有序列表3
```

显示效果如下：

- 无序列表1
- 无序列表2
- 无序列表3

1. 有序列表1
2. 有序列表2
3. 有序列表3

## 1.5 分隔线
---
有时候，为了排版漂亮，可能会加入分隔线。Markdown加入分隔线非常简单，使用下面任意一种形式都可以

```
***
---
```

## 1.6 内容强调
---
有时候，我们对某一部分文字进行强调，使用 * 或 _ 包裹即可。使用单一符号标记的效果是斜体，使用两个符号标记的效果是加粗

```
*这里是斜体*
_这里是斜体_

**这里是加粗**
__这里是加粗__

***这里是加粗并斜体***
___这里是加粗并斜体___
```

以上标记显示效果如下：

*这里是斜体*
_这里是斜体_

**这里是加粗**
__这里是加粗__

***这里是加粗并斜体***
___这里是加粗并斜体___

## 1.7 删除线
```
这样来~~删除一段文本~~
```
以上标记显示效果如下：
这样来~~删除一段文本~~

## 1.8 高亮显示
---
```
使用<code>\`</code>来强调字符 // 想打出 ` (反引号)需要转义
比如`突出背景色`来显示强调效果
```
以上标记显示效果如下：

使用<code>\`</code>来强调字符 //想打出 \` (反引号)需要转义
比如`突出背景色`来显示强调效果

## 1.9 嵌套引用
---
```
> 动物
>> 水生动物
>> 陆生动物
>>> 猴子
>>> 人
>>>> 程序猿
>>>> 攻城狮
>>产品狗 //这里需要注意，没有空行间隔，忽略降级引用标记
射鸡虱   //这里需要注意，没有空行间隔，忽略降级引用标记

>> 两栖类动物
>>> 大鳄鱼
唐老鸭

两个回车结束引用,不在引用范围内了！
```
以上标记显示效果如下：
> 动物
>> 水生动物
>> 陆生动物
>>> 猴子
>>> 人
>>>> 程序猿
>>>> 攻城狮
>>产品狗 //这里需要注意，没有空行间隔，忽略降级引用标记
>>射鸡虱   //这里需要注意，没有空行间隔，忽略降级引用标记

>> 两栖类动物
>>> 大鳄鱼
唐老鸭

两个回车结束引用,不在引用范围内了!

## 1.10 修改图片
### 1.10.1 修改图片尺寸
---
在 markdown 直接使用提供的语法引入图片是无法设置大小的，所以我们需要用到 html 的 img 标签。

```
<img width="  " alt="描述" src="url"/>
```

例如：

```
<img width="267px" alt="这里是一张图片" src="http://e.hiphotos.baidu.com/image/pic/item/55e736d12f2eb93867023248df628535e5dd6f19.jpg"/>
```
效果如下：
<img width="267px" alt="这里是一张图片" src="http://e.hiphotos.baidu.com/image/pic/item/55e736d12f2eb93867023248df628535e5dd6f19.jpg"/>

### 1.10.2 设置图片居中
---
在 markdown 设置图片居中是需要通过 div 来控制的。

```
<div align=center><img width="267px" alt="这里是一张图片" src="http://e.hiphotos.baidu.com/image/pic/item/55e736d12f2eb93867023248df628535e5dd6f19.jpg"/></div>
```
效果如下：
<div align=center><img width="267px" alt="这里是一张图片" src="http://e.hiphotos.baidu.com/image/pic/item/55e736d12f2eb93867023248df628535e5dd6f19.jpg"/></div>

## 1.11 代码块
### 1.11.1 插入代码块
---
Markdown在IT圈子里面比较流行的一个重要原因是，它能够轻松漂亮地插入代码。
方法是，使用三个反引号 \` 进行包裹即可。如果是行内代码引用，使用单个反引号进行包裹
代码块语法遵循标准 markdown 代码，使用 \`\`\` 开始 ， \`\`\` 结束 例如：

````
```Python
#!/usr/bin/env python
# -*- coding: utf-8 -*-
print 'Hello World! 
```
````
以上标记显示效果如下：

```Python
#!/usr/bin/env python
# -*- coding: utf-8 -*-
print 'Hello World! 
```

*注：很多人不知道怎么输入反引号。在英文模式下，找到键盘最左侧esc键下面的第一个键点击即可。
有人会问：
如何在代码块中打出 \`\`\`
实际上是使用 4个\` 包含 3个\` 就可以了，想表示更多，最外层+1就好了。*

````
```
```
````

### 1.11.2 代码块高亮
---
如果你只想高亮语句中的某个函数名或关键字，可以使用 \`function_name()\` 实现

通常编辑器根据代码片段适配合适的高亮方法，但你也可以用 \`\`\` 包裹一段代码，并指定一种语言

```javascript
$(document).ready(function () {
    alert('hello world');
});
```
支持的语言：`1c, abnf, accesslog, actionscript, ada, apache, applescript, arduino, armasm, asciidoc, aspectj, autohotkey, autoit, avrasm, awk, axapta, bash, basic, bnf, brainfuck, cal, capnproto, ceylon, clean, clojure, clojure-repl, cmake, coffeescript, coq, cos, cpp, crmsh, crystal, cs, csp, css, d, dart, delphi, diff, django, dns, dockerfile, dos, dsconfig, dts, dust, ebnf, elixir, elm, erb, erlang, erlang-repl, excel, fix, flix, fortran, fsharp, gams, gauss, gcode, gherkin, glsl, go, golo, gradle, groovy, haml, handlebars, haskell, haxe, hsp, htmlbars, http, hy, inform7, ini, irpf90, java, javascript, json, julia, kotlin, lasso, ldif, leaf, less, lisp, livecodeserver, livescript, llvm, lsl, lua, makefile, markdown, mathematica, matlab, maxima, mel, mercury, mipsasm, mizar, mojolicious, monkey, moonscript, n1ql, nginx, nimrod, nix, nsis, objectivec, ocaml, openscad, oxygene, parser3, perl, pf, php, pony, powershell, processing, profile, prolog, protobuf, puppet, purebasic, python, q, qml, r, rib, roboconf, rsl, ruby, ruleslanguage, rust, scala, scheme, scilab, scss, smali, smalltalk, sml, sqf, sql, stan, stata, step21, stylus, subunit, swift, taggerscript, tap, tcl, tex, thrift, tp, twig, typescript, vala, vbnet, vbscript, vbscript-html, verilog, vhdl, vim, x86asm, xl, xml, xquery, yaml, zephir`

如你不需要代码高亮，可以用下面的方法禁用：

````
```nohighlight
```
````

## 1.12 插入表格
---
表格是Markdown语法中比较复杂的一个，其语法如下：

```
列1   | 列2 | 列3 
----- | --- | ---- 
第1行 | 12  | 13  
第2行 | 22  | 23  
第3行 | 32  | 33
```
以上标记显示效果如下：

列1   | 列2 | 列3 
----- | --- | ---- 
第1行 | 12  | 13  
第2行 | 22  | 23  
第3行 | 32  | 33

可以使用`冒号`来定义对齐方式：
全居中样式：

```
表头|条目一|条目二
:---:|:---:|:---:
项目|项目一|项目二
```
以上标记显示效果如下：

表头|条目一|条目二
:---:|:---:|:---:
项目|项目一|项目二

可能有人喜欢左对齐或者右对齐，也可以设置:

```
| 左对齐    |  右对齐 | 居中 |
| :-------- | -------:| :--: |
| Computer  | 5000 元 |  1台 |
| Phone     | 1999 元 |  1部 |
```

以上标记显示效果如下：

| 左对齐    |  右对齐 | 居中 |
| :-------- | -------:| :--: |
| Computer  | 5000 元 |  1台 |
| Phone     | 1999 元 |  1部 |

注：三个短竖杠左右的冒号用于控制对齐方式，只放置左边冒号表示文字居左，只放置右边冒号表示文字居右，如果两边都放置冒号表示文字居中。

## 1.13 特殊符号处理
### 1.13.1 转义特殊符号
---
Markdown使用反斜杠\插入语法中用到的特殊符号。在Markdown中，主要有以下几种特殊符号需要处理：

```
\   反斜线
`   反引号
*   星号
_   底线
{}  花括号
[]  方括号
()  括弧
#   井字号
+   加号
-   减号
.   英文句点
!   惊叹号
```

例如，如果你需要插入反斜杠，就连续输入两个反斜杠即可：`\\`=> `\` 。

*注：在内容中输入以上特殊符号的时候一定要注意转义，否则将导致内容显示不全，甚至排版混乱。*

### 1.13.2 其他特殊符号
---
#### 竖线
```
一个竖线: &#124;
两个竖线: &#124;&#124;
```
展示效果如下：
一个竖线: &#124;
两个竖线: &#124;&#124;

#### 空格
```
不断行空格 &nbsp;
半角空格 &ensp;
全角空格 &emsp;

例：这&nbsp;是&ensp;个&emsp;例子
```
展示效果如下：
> 这&nbsp;是&ensp;个&emsp;例子

## 1.14 文本居中引用
---

```
{% cq %}
人生乃是一面镜子，
从镜子里认识自己，
我要称之为头等大事，
也只是我们追求的目的！
{% endcq %}
```

以上标记显示效果如下：

{% cq %}
人生乃是一面镜子，
从镜子里认识自己，
我要称之为头等大事，
也只是我们追求的目的！
{% endcq %}

注：如果想修改字号，可以如下面这样设置：

```
<font size="8">
{% cq %}
  人生乃是一面镜子，
  从镜子里认识自己，
  我要称之为头等大事，
  也只是我们追求的目的！
{% endcq %}
</font>
```

以上标记显示效果如下：

<font size="8">
{% cq %}
  人生乃是一面镜子，
  从镜子里认识自己，
  我要称之为头等大事，
  也只是我们追求的目的！
{% endcq %}
</font>

## 1.15 标签
### 1.15.1 note标签
---
通过 note 标签可以为段落添加背景色，语法如下：

```
{% note class %}
文本内容 (支持行内标签)
{% endnote %}
```

支持的 class 种类包括 `default` `primary` `success` `info` `warning` `danger`，也可以不指定 class。

各种 class 种类的效果如下：
{% note default %}
**default** note tag
{% endnote %}

{% note primary %}
**primary** note tag
{% endnote %}

{% note success %}
**success** note tag
{% endnote %}

{% note info %}
**info** note tag
{% endnote %}

{% note warning %}
**warning** note tag
{% endnote %}

{% note danger %}
**danger** note tag
{% endnote %}

也可以用下面的方式来标记
```
<div class="note default"><p>default</p></div>
```
显示效果如下：
<div class="note default"><p>default</p></div>

```
<div class="note primary"><p>primary</p></div>
```
以上标记显示效果如下：
<div class="note primary"><p>primary</p></div>

```
<div class="note success"><p>success</p></div>
```
以上标记显示效果如下：
<div class="note success"><p>success</p></div>

```
<div class="note warning"><p>warning</p></div>
```
以上标记显示效果如下：
<div class="note warning"><p>warning</p></div>

```
<div class="note danger"><p>danger</p></div>
```
以上标记显示效果如下：
<div class="note danger"><p>danger</p></div>

### 1.15.2 lable标签
---
通过 label 标签可以为文字添加背景色，语法如下：

```
{% label [class]@text  %}
```

支持的 class 种类包括 `default` `primary` `success` `info` `warning` `danger`，默认使用 default 作为缺省。

使用示例如下：

```
I heard the echo, {% label default@from the valleys and the heart %}
Open to the lonely soul of {% label info@sickle harvesting %}
Repeat outrightly, but also repeat the well-being of
Eventually {% label warning@swaying in the desert oasis %}
{% label success@I believe %} I am
{% label primary@Born as the bright summer flowers %}
Do not withered undefeated fiery demon rule
Heart rate and breathing to bear {% label danger@the load of the cumbersome %}
Bored
```

展示效果如下：
I heard the echo, {% label default@from the valleys and the heart %}
Open to the lonely soul of {% label info@sickle harvesting %}
Repeat outrightly, but also repeat the well-being of
Eventually {% label warning@swaying in the desert oasis %}
{% label success@I believe %} I am
{% label primary@Born as the bright summer flowers %}
Do not withered undefeated fiery demon rule
Heart rate and breathing to bear {% label danger@the load of the cumbersome %}

### 1.15.3 button 按钮
---
通过 button 标签可以快速添加带有主题样式的按钮，语法如下：

```
{% button /path/to/url/, text, icon [class], title %}
```

也可简写为：

```
{% btn /path/to/url/, text, icon [class], title %}
```

其中， 图标 ID 来源于 [FontAwesome](https://fontawesome.com/v4.7.0/icons/)

使用示例如下：

```
{% btn #, 文本 %}
{% btn #, 文本 & 标题,, 标题 %}
{% btn #, 文本 & 图标, home %}
{% btn #, 文本 & 大图标 (固定宽度), home fa-fw fa-lg %}
```

展示效果如下：

{% btn #, 文本 %}

{% btn #, 文本 & 标题,, 标题 %}

{% btn #, 文本 & 图标, home %}

{% btn #, 文本 & 大图标 (固定宽度), home fa-fw fa-lg %}

### 1.15.4 tab 标签
---
tab 标签用于快速创建 tab 选项卡，语法如下

```
{% tabs [Unique name], [index] %}
  <!-- tab [Tab caption]@[icon] -->
  标签页内容（支持行内标签）
  <!-- endtab -->
{% endtabs %}
```

其中，各参数意义如下：

- Unique name: 全局唯一的 Tab 名称，将作为各个标签页的 id 属性前缀
- index: 当前激活的标签页索引，如果未定义则默认选中显示第一个标签页，如果设为 - 1 则默认隐藏所有标签页
- Tab caption: 当前标签页的标题，如果不指定则会以 Unique name 加上索引作为标题
- icon: 在标签页标题中添加 Font awesome 图标

使用示例如下：

```
{% tabs Tab标签列表 %}
  <!-- tab 标签页1 -->
    标签页1文本内容
  <!-- endtab -->
  <!-- tab 标签页2 -->
    标签页2文本内容
  <!-- endtab -->
  <!-- tab 标签页3 -->
    标签页3文本内容
  <!-- endtab -->
{% endtabs %}
```

展示效果如下：
{% tabs Tab标签列表 %}
  <!-- tab 标签页1 -->
    标签页1文本内容
  <!-- endtab -->
  <!-- tab 标签页2 -->
    标签页2文本内容
  <!-- endtab -->
  <!-- tab 标签页3 -->
    标签页3文本内容
  <!-- endtab -->
{% endtabs %}



## 1.16 文字处理
### 1.16.1 文字背景色
---
```
<table><tr><td bgcolor=#FFFF00>背景色的设置是按照十六进制颜色值：#FFFF00</td></tr></table>
<table><tr><td bgcolor=#D1EEEE>背景色的设置是按照十六进制颜色值：#D1EEEE</td></tr></table>
<table><tr><td bgcolor=#C0FF3E>背景色的设置是按照十六进制颜色值：#C0FF3E</td></tr></table>
<table><tr><td bgcolor=#54FF9F>背景色的设置是按照十六进制颜色值：#54FF9F</td></tr></table>
```
效果如下：
<table><tr><td bgcolor=#FFFF00>背景色的设置是按照十六进制颜色值：#FFFF00</td></tr></table>
<table><tr><td bgcolor=#D1EEEE>背景色的设置是按照十六进制颜色值：#D1EEEE</td></tr></table>
<table><tr><td bgcolor=#C0FF3E>背景色的设置是按照十六进制颜色值：#C0FF3E</td></tr></table>
<table><tr><td bgcolor=#54FF9F>背景色的设置是按照十六进制颜色值：#54FF9F</td></tr></table>

### 1.16.2 文字字体
---
```
<font face="黑体">我是黑体字</font>
<font face="宋体">我是宋体字</font>
<font face="微软雅黑">我是微软雅黑字</font>
```
效果如下：
<font face="黑体">我是黑体字</font>
<font face="宋体">我是宋体字</font>
<font face="微软雅黑">我是微软雅黑字</font>

### 1.16.3 文字大小
---
```
size为1：<font size="1">size为1</font>
size为2：<font size="2">size为2</font>
size为3：<font size="3">size为3</font>
size为4：<font size="4">size为4</font>
size为10：<font size="10">size为10</font>
```
效果如下：
size为1：<font size="1">size为1</font>
size为2：<font size="2">size为2</font>
size为3：<font size="3">size为3</font>
size为4：<font size="4">size为4</font>
size为10：<font size="10">size为10</font>

### 1.16.4 文字颜色
---
```
红色文字：<font color="red">红色文字</font>
浅红色文字：<font color="#dd0000">浅红色文字</font> 
蓝色文字：<font color="blue">蓝色文字</font>
浅蓝色文字：<font color="#0000dd">浅蓝色文字</font>
绿色文字：<font color="green">绿色文字</font>
金黄色文字：<font color="#FFFF00">金黄色文字</font>
浅黄色文字：<font color="#dddd00">浅黄色文字</font> 
深黄色文字：<font color="#666600">深黄色文字</font>
```
效果如下：
红色文字：<font color="red">红色文字</font>
浅红色文字：<font color="#dd0000">浅红色文字</font> 
蓝色文字：<font color="blue">蓝色文字</font>
浅蓝色文字：<font color="#0000dd">浅蓝色文字</font>
绿色文字：<font color="green">绿色文字</font>
金黄色文字：<font color="#FFFF00">金黄色文字</font>
浅黄色文字：<font color="#dddd00">浅黄色文字</font> 
深黄色文字：<font color="#666600">深黄色文字</font>

需要其它更多的颜色，可以到下面这个网址查更多颜色的 RGB，或者直接用颜色的英文代替 RGB
**[RGB颜色查询对照表](http://www.114la.com/other/rgb.htm)**

### 1.16.4 同时改变字体，字号和颜色
---
```
<font face="字体" size="字号" color="颜色">这里是需要突出显示的内容</font>
<font face="黑体">我是黑体字</font>
<font face="微软雅黑">我是微软雅黑</font>
<font face="STCAIYUN">我是华文彩云</font>
<font color=red>我是红色</font>
<font color=#008000>我是绿色</font>
<font color=Blue>我是蓝色</font>
<font size=5>我是尺寸</font>
<font face="黑体" color=green size=5>我是黑体，绿色，尺寸为5</font>
```
效果如下：
<font face="字体" size="字号" color="颜色">这里是需要突出显示的内容</font>
<font face="黑体">我是黑体字</font>
<font face="微软雅黑">我是微软雅黑</font>
<font face="STCAIYUN">我是华文彩云</font>
<font color=red>我是红色</font>
<font color=#008000>我是绿色</font>
<font color=Blue>我是蓝色</font>
<font size=5>我是尺寸</font>
<font face="黑体" color=green size=5>我是黑体，绿色，尺寸为5</font>

## 1.17 复选框列表(github可用,hexo不支持)
---
在列表符号后面加上 [x] 或者 [ ] 代表选中或者未选中情况，注意：[]中间要用空格打开，否则不生效

```
- [ ] content 
- [x] content 
```

- [x] C
- [x] C++
- [x] Java
- [ ] Qt
- [x] Android
- [x] C#
- [ ] .NET

## 1.18 引用块
### 1.18.1 普通的引用
---
在blockquote后面不写任何参数，就只是单纯的引用，效果与使用>一样

```
{% blockquote [author[, source]] [link] [source_link_title] %}
content
{% endblockquote %}
```
显示效果如下：
{% blockquote [author[, source]] [link] [source_link_title] %}
content
{% endblockquote %}

### 1.18.2 对书上语言的引用
---
```
{% blockquote 作者, 出处 %}
xxxxxxxxxxxxxxxxxxxxxxxxxxxx
{% endblockquote %}
```
显示效果如下：
{% blockquote 莎士比亚, 麦克白 %}
黑夜无论怎样悠长，白昼总会到来。
{% endblockquote %}

### 1.18.3 对网络上的引用
---
```
{% blockquote @作者 网络地址 %}
xxxxxxxxxxxxxxxxxxxxxxxxxx
{% endblockquote %}
```
展示效果如下：
{% blockquote @余秀华 http://blog.sina.com.cn/u/1634106437 %}
有时候，“爱国”，是一个空洞的词语。更多的人是在言语里，在诗歌里”爱国“，他们没有一点点实际行动，甚至充满抱怨。
{% endblockquote %}

---
---
<br />
# 2 文章编辑
## 2.1 文章折叠
---
在要显示的文字末尾添加如下代码实现文章在主页的折叠显示。

```
<!-- more -->
```

或者也可以将`themes/next/_config.yml`文件中的`auto_excerpt`字段值改为`true`

## 2.2 新建草稿（draft）
---
`draft` 布局用于创建草稿，生成的文档存在于 `source\_drafts\` 目录中，默认配置下将不会把该目录下的文档渲染到网站中。

新建一个草稿

> hexo n draft draft_name

通过以下命令将草稿发布为正式文章：

> hexo publish draft_name


## 2.3 标签与分类
---
标签和分类都是用于对文章进行归档的一种方式，标签是一种列表结构，而分类是一种树结构。我们以人作为例子，从标签的角度考虑，我可以拥有程序员、高颜值、幽默等标签，这些标签之间没有层级关系；从分类的角度考虑，我是亚洲人、中国人、河南人，这些分类之间是有明确的包含关系的。

可以在 `Front-Matter` 中添加 `catergories` 和 `tags` 字段为文章添加标签和分类，如我为本文添加了 `Hexo` 和 `Markdown` 两个标签，并将其归类到了 `技术 / 博客` 类别，对应的 `Front-Matter` 结构如下：

```
title: Hexo搭建个人博客系列：写作技巧篇
tags: Hexo Markdown
categories:
- 技术
- 博客
```

*注：Front-Matter 是文件最上方以 --- 分隔的区域，用于指定本文件的各种参数值*

---
---
<br />
# 3 自定义NexT样式
这里仅限于使用主题为NexT的情况，自定义其他主题请自行Google。
## 3.1 修改分隔线样式
---
默认的分隔线样式为
{% asset_img default_divider.png %}
看起来不太美观，打开`themes/next/source/css/_common/scaffolding/base.styl`文件，找到 hr 区块，删除`background-image`相关即可。

## 3.2 自定义其他样式
打开`themes/next/source/css/_custom/custom.styl`文件，添加配置如下：

```
// Custom styles.

/*修改选择字体块背景颜色*/
::selection {
    background: #9DA6AC;
    color: #222;
}

/*设置文章字体排版合理*/
.post-body{
	text-align: justify;
}

/*去掉图片边框*/
.posts-expand .post-body img{
  	border: 0px;
}

/*超链接设置颜色*/
.post-body p a {
color: #0593d3;
border-bottom: none;
&:hover {
color: #0477ab;
text-decoration: underline;
}
}

/*高亮文字颜色*/
code {
    color: #f61111;
    background: #fbf7f8;
    margin: 2px;
}
// 大代码块的自定义样式
.highlight, pre {
    margin: 5px 0;
    padding: 5px;
    border-radius: 3px;
}
.highlight, code, pre {
    border: 1px solid #d6d6d6;
}
```

## 3.3 隐藏修改时间信息和时间下划虚线
### 3.3.1 隐藏修改时间信息
---
默认情况下，一篇文章会具有"发表时间"和"更新时间"两个信息，在 Next 主题的主题配置文件中有一个"更新时间"的开关：

```
# Post meta display settings
post_meta:
  item_text: true
  created_at: true
  updated_at:  # 这里可以开关"更新时间"
    enable: true
    another_day: true
  categories: tru
```

但这个开关是全局性的，要么所有文章都显示，要么所有文章都隐藏，而我只需要某些文章显示其他的隐藏，还是一样从代码入手。修改 `next/layout/_macro/post.swig`：

```
            {% if theme.post_meta.updated_at.enabled && datetime_diff %}
              {% set display_updated = !theme.post_meta.updated_at.another_day || theme.post_meta.updated_at.another_day && date_diff %}

              {% if display_updated or !theme.post_meta.created_at %}
                {% if theme.post_meta.created_at and theme.post_meta.updated_at.enabled %}
                <span class="post-meta-divider">|</span>
                {% endif %}

                <span class="post-meta-item-icon">
                  <i class="fa fa-calendar-check-o"></i>
                </span>
                {% if theme.post_meta.item_text %}
                  <span class="post-meta-item-text">{{ __('post.edited') }}</span>
                {% endif %}
                <time title="{{ __('post.modified') + __('symbol.colon') + full_date(post.updated) }}" itemprop="dateModified" datetime="{{ moment(post.updated).format() }}">{#
                #}{% if date_diff -%}
                    {{- date(post.updated) -}}
                  {%- else -%}
                    {{- time(post.updated) -}}
                  {%- endif -%}
                </time>
              {% endif %}
            {% endif %}
```

把这段代码的第一行改一下：

```
{### 根据文章是否有 modify 字段判断是否显示修改时间 ###}
{% if theme.post_meta.updated_at.enabled && datetime_diff && post.modify %}

  ......

{% endif %}
```

然后默认情况下，所有文章都不会显示"更新时间"了，如果某些文章需要显示，只需要在文章的头部信息栏增加一个属性 `modify: true` 即可：

```
---
title: Hexo博客隐藏修改时间信息和时间下划虚线
modify: true
date: 2019-12-02 09:12:49
---
```

### 3.3.2 隐藏时间下划虚线
---
默认情况下，时间信息（包括创建时间和修改时间）的底部还有一个下划虚线，去掉这个下滑虚线修改： `next/source/css/_common/components/post/post-meta.styl`：

```
.posts-expand .post-meta

  ......

  time {
    // 删除下面一行
    // border-bottom: 1px dashed $grey-dark;
    cursor: help;
  }
}
```
按照注释，删掉 `border-bottom` 一行即可。

<br />
# 参考链接
---

- [Hexo中Markdown语法(GFM)使用](https://blog.enjoytoshare.club/article/hexo-do-optimization-markdown.html)