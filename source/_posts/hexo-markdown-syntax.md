---
title: Hexo博客的Markdown语法
date: 2019-12-01 23:00:12
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
使用<code>\`</code>来强调字符 //想打出 ` (反引号)需要转义比如`突出背景色`来显示强调效果
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

注：在内容中输入以上特殊符号的时候一定要注意转义，否则将导致内容显示不全，甚至排版混乱。

**重要**：MarkDown表格中使用竖线，如何做？

```
一个竖线: &#124;
两个竖线: &#124;&#124;
```
展示效果如下：
一个竖线: &#124;
两个竖线: &#124;&#124;

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
<font size="4">
{% cq %}
  人生乃是一面镜子，
  从镜子里认识自己，
  我要称之为头等大事，
  也只是我们追求的目的！
{% endcq %}
</font>
```

以上标记显示效果如下：

{% cq %}
  人生乃是一面镜子，
  从镜子里认识自己，
  我要称之为头等大事，
  也只是我们追求的目的！
{% endcq %}
</font>

## 1.15 主题自带样式 note 标签
---
```
<div class="note default"><p>default</p></div>
```
以上标记显示效果如下：
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
在列表符号后面加上 [x] 或者 [ ] 代表选中或者未选中情况

```
- [] content 
-空格[空格]空格content 
解释: []括号里面的空格可以换成[x],代表选中对话框
```

- [x] C
- [x] C++
- [x] Java
- [x] Qt
- [x] Android
- [ ] C#
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
{% blockquote @余秀华 blog.sina.com.cn/yuxiuhua1976 %}
有时候，“爱国”，是一个空洞的词语。更多的人是在言语里，在诗歌里”爱国“，他们没有一点点实际行动，甚至充满抱怨。
{% endblockquote %}

---
---
<br />
# 2 文章编辑
## 2.1 文章配置
---
在hexo文件夹下右键点击Git Bash here后键入$hexo new page "name"，source/_post 文件夹中就会生成name.md文件，打开后即可编辑，编辑格式如下：

```
---
title: 文章名
date: 2019-04-09 12:27:52     //发表日期
updated: 2019-04-09 13:27:52  //更新日期
categories: Markdown          //文章分类
tags: [tag1,tag2]             //文章标签，多标签时使用英文逗号隔开
photos:                       //如果使用Fancybox（文章头部展示图片），如此设置  
                              //注意冒号后面有空格
---
```

## 2.2 文章折叠
---
在要显示的文字末尾添加如下代码实现文章在主页的折叠显示。

```
<!-- more -->
```

或者也可以将
> themes/next/_config.yml

中的`auto_excerpt`字段值改为`true`

---
---
<br />
# 3 自定义NexT样式
## 3.1 修改分隔线样式
---
默认的分隔线样式为
{% asset_img default_divider.png %}
看起来不太美观，打开
> themes/next/source/css/_common/scaffolding/base.styl

文件，代码的 hr 区块，删除background-image相关即可

## 3.2 自定义其他样式
打开
> themes/next/source/css/_custom/custom.styl

配置如下：

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


参考文章：[Hexo中Markdown语法(GFM)使用](https://blog.enjoytoshare.club/article/hexo-do-optimization-markdown.html)