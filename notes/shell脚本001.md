# shell脚本教程
## 几种常见的shell
- sh
- csh
- tcsh
- ash
- bash

## 查看shell
shell是一个程序，一般放在/bin或者/user/bin目录下，当前Linux系统可用的shell都记录在/etc/shells文件中。/etc/shells是一个纯文本文件，你可以在图形界面下打开它，也可以使用cat命令查看它。  
通过cat命令查看当前linux系统的可用shell：
```
$cat /etc/shells
/bin/sh
/bin/bash
/bin/rbash
/bin/dash
```
在现代的 Linux 上，sh 已经被 bash 代替，/bin/sh往往是指向/bin/bash的符号链接。
## shell提示符（`$`和`#`的区别）
对于普通用户，Bash shell默认的提示符是`$`；对于超级用户（root用户），Bash shell默认的提示符是`#`。  
shell通过PS1和PS2两个环境变量来控制提示符格式：
- PS1控制最外层命令行的提示符格式
- PS2控制第二层命令行的提示符格式

shell使用`\`为前导的特殊字符来表示命令提示符中包含的要素，下表展示了可以在PS1和PS2中使用的特殊字符。
<table>
<tbody>
<tr>
<th>
字符</th>
<th>
描述</th>
</tr>
<tr>
<td>
\a</td>
<td>
铃声字符</td>
</tr>
<tr>
<td>
\d</td>
<td>
格式为“日 月 年”的日期</td>
</tr>
<tr>
<td>
\e</td>
<td>
ASCII转义字符</td>
</tr>
<tr>
<td>
\h</td>
<td>
本地主机名</td>
</tr>
<tr>
<td>
\H</td>
<td>
完全合格的限定域主机名</td>
</tr>
<tr>
<td>
\j</td>
<td>
shell当前管理的作业数</td>
</tr>
<tr>
<td>
\1</td>
<td>
shell终端设备名的基本名称</td>
</tr>
<tr>
<td>
\n</td>
<td>
ASCII换行字符</td>
</tr>
<tr>
<td>
\r</td>
<td>
ASCII回车</td>
</tr>
<tr>
<td>
\s</td>
<td>
shell的名称</td>
</tr>
<tr>
<td>
\t</td>
<td>
格式为“小时:分钟:秒”的24小时制的当前时间</td>
</tr>
<tr>
<td>
\T</td>
<td>
格式为“小时:分钟:秒”的12小时制的当前时间</td>
</tr>
<tr>
<td>
\@</td>
<td>
格式为am/pm的12小时制的当前时间</td>
</tr>
<tr>
<td>
\u</td>
<td>
当前用户的用户名</td>
</tr>
<tr>
<td>
\v</td>
<td>
bash shell的版本</td>
</tr>
<tr>
<td>
\V</td>
<td>
bash shell的发布级别</td>
</tr>
<tr>
<td>
\w</td>
<td>
当前工作目录</td>
</tr>
<tr>
<td>
\W</td>
<td>
当前工作目录的基本名称</td>
</tr>
<tr>
<td>
\!</td>
<td>
该命令的bash shell历史数</td>
</tr>
<tr>
<td>
\#</td>
<td>
该命令的命令数量</td>
</tr>
<tr>
<td>
\$</td>
<td>
如果是普通用户，则为美元符号<code>$</code>；如果超级用户（root 用户），则为井号<code>#</code>。</td>
</tr>
<tr>
<td>
\nnn</td>
<td>
对应于八进制值 nnn 的字符</td>
</tr>
<tr>
<td>
\\</td>
<td>
斜杠</td>
</tr>
<tr>
<td>
\[</td>
<td>
控制码序列的开头</td>
</tr>
<tr>
<td>
\]</td>
<td>
控制码序列的结尾</td>
</tr>
</tbody>
</table>

我们可以通过修改PS1变量来修改i提示符格式，eg：
```
[mozhiyan@localhost ~]$ PS1="[\t][\u]\$ "
[17:27:34][mozhiyan]$ 
```

## 指定shell执行的解释器
使用`#!/bin/bash`来指定shell执行的解释器。  
“#！”是一个约定符号
## shell变量
Bash shell在默认情况下不会区分变量类型。shell支持的三种定义变量的方式：
```
variable=value
variable='value'
variable="value"
```
shell变量的命名规范：
- 变量由数字、字母、下划线组成；
- 必须以字母或者下划线开头；
- 不能使用shell中的关键字；

### 使用变量
使用一个定义过的变量，只要在变量名前加上`$`即可。  
变量名外面的花括号{}是可选的，使用花括号是为了帮助解释器识别变量的边界。
### 修改变量的值
已定义的变量，可以被重新赋值。
### 双引号和单引号的区别
以单引号包围变量的值时，单引号里面是什么就输出什么。  
以双引号包围变量的值时，输出时会想解析里面的命令和变量。
### 将命令的结果赋值给变量
shell支持将命令的执行结果赋值给变量：
```
variable=`command`
variable=$(command)
```
### 只读变量
使用readonly命令可以将变量定义为只读变量。  
eg：`readonly myUrl`
### 删除变量
使用unset命令可以删除变量，语法：  
`unset variable_name`unset命令不能删除只读变量。
## 变量类型
1.局部变量

在脚本或命令中定义，仅当前shell实例中有效。
2.环境变量

所有的程序，包括shell启动程序，都能访问环境变量，有些程序需要环境变量来保证其正常运行。必要时shell脚本也可以定义环境变量。
3.shell变量

shell变量是由shell程序设置的特殊变量。shell变量中有一部分时环境变量，有一部分是局部变量。
## 特殊变量
特殊变量表：
<table>
<tbody>
<tr>
<th>
变量</th>
<th>
含义</th>
</tr>
<tr>
<td>
$0</td>
<td>
当前脚本的文件名</td>
</tr>
<tr>
<td>
$n</td>
<td>
传递给脚本或函数的参数。n 是一个数字，表示第几个参数。例如，第一个参数是$1，第二个参数是$2。</td>
</tr>
<tr>
<td>
$#</td>
<td>
传递给脚本或函数的参数个数。</td>
</tr>
<tr>
<td>
$*</td>
<td>
传递给脚本或函数的所有参数。</td>
</tr>
<tr>
<td>
$@</td>
<td>
传递给脚本或函数的所有参数。被双引号(" ")包含时，与 $* 稍有不同，下面将会讲到。</td>
</tr>
<tr>
<td>
$?</td>
<td>
上个命令的退出状态，或函数的返回值。</td>
</tr>
<tr>
<td>
$$</td>
<td>
当前Shell进程ID。对于 Shell 脚本，就是这些脚本所在的进程ID。</td>
</tr>
</tbody>
</table>

## 命令行参数
运行脚本时传递给脚本的参数称为命令行参数，例如`$1`表示第一个参数。
## `$*`和`$@`的区别
`$*`和`$@`都表示传递给函数或脚本的所有的参数，不被双引号包含时，都以`"$1""$2""$3""$n"`的形式输出所有参数。  
当他们被双引号包含时，`$*`会将所有的参数作为一个整体，以`"$1$2...$n"`的形式输出所有参数；`$@`会将各个参数分开，以`"$1""$2"..."$n"`的形式输出所有参数
## 退出状态
`$?`可以获取上一个命令的推出状态，推出状态就是一个数字，一般情况下，大部分命令成功会返回0，失败会返回1。
## shell变量替换，命令替换，转义字符
如果表达式中包含特殊字符，shell将会进行替换。  
转义字符表：
<table>
<tbody>
<tr>
<th>
转义字符</th>
<th>
含义</th>
</tr>
<tr>
<td>
\\</td>
<td>
反斜杠</td>
</tr>
<tr>
<td>
\a</td>
<td>
警报，响铃</td>
</tr>
<tr>
<td>
\b</td>
<td>
退格（删除键）</td>
</tr>
<tr>
<td>
\f</td>
<td>
换页(FF)，将当前位置移到下页开头</td>
</tr>
<tr>
<td>
\n</td>
<td>
换行</td>
</tr>
<tr>
<td>
\r</td>
<td>
回车</td>
</tr>
<tr>
<td>
\t</td>
<td>
水平制表符（tab键）&nbsp;</td>
</tr>
<tr>
<td>
\v</td>
<td>
垂直制表符</td>
</tr>
</tbody>
</table>
### 命令替换
命令替换是指shell可以先执行命令，将输出结果暂时保存，在适当的地方输出。  
命令替换的语法：
&apos;command&apos;

### 变量替换
变量替换表：
<table>
<tbody>
<tr>
<th>
形式</th>
<th>
说明</th>
</tr>
<tr>
<td>
${var}</td>
<td>
变量本来的值</td>
</tr>
<tr>
<td>
${var:-word}</td>
<td>
如果变量 var 为空或已被删除(unset)，那么返回&nbsp;word，但不改变&nbsp;var 的值。</td>
</tr>
<tr>
<td>
${var:=word}</td>
<td>
如果变量 var 为空或已被删除(unset)，那么返回 word，并将 var 的值设置为 word。</td>
</tr>
<tr>
<td>
${var:?message}</td>
<td>
如果变量 var 为空或已被删除(unset)，那么将消息 message 送到标准错误输出，可以用来检测变量 var 是否可以被正常赋值。<br>
若此替换出现在Shell脚本中，那么脚本将停止运行。</td>
</tr>
<tr>
<td>
${var:+word}</td>
<td>
如果变量 var 被定义，那么返回 word，但不改变 var 的值。</td>
</tr>
</tbody>
</table>

## shell运算符
### 算术运算符
原生bash不支持算术运算符，但可以使用其他命令来实现。
<table>
<tbody>
<tr>
<th>
运算符</th>
<th>
说明</th>
<th>
举例</th>
</tr>
<tr>
<td>
+</td>
<td>
加法</td>
<td>
`expr $a + $b` 结果为&nbsp;30。</td>
</tr>
<tr>
<td>
-</td>
<td>
减法</td>
<td>
`expr $a - $b` 结果为 10。</td>
</tr>
<tr>
<td>
*</td>
<td>
乘法</td>
<td>
`expr $a \* $b` 结果为 &nbsp;200。</td>
</tr>
<tr>
<td>
/</td>
<td>
除法</td>
<td>
`expr $b / $a` 结果为&nbsp;2。</td>
</tr>
<tr>
<td>
%</td>
<td>
取余</td>
<td>
`expr $b % $a` 结果为&nbsp;0。</td>
</tr>
<tr>
<td>
=</td>
<td>
赋值</td>
<td>
a=$b 将把变量 b 的值赋给 a。</td>
</tr>
<tr>
<td>
==</td>
<td>
相等。用于比较两个数字，相同则返回 true。</td>
<td>
[ $a == $b ] 返回&nbsp;false。</td>
</tr>
<tr>
<td>
!=</td>
<td>
不相等。用于比较两个数字，不相同则返回 true。</td>
<td>
[ $a != $b ] 返回 true。</td>
</tr>
</tbody>
</table>

### 关系运算符
<table>
<tbody>
<tr>
<th>
运算符</th>
<th>
说明</th>
<th>
举例</th>
</tr>
<tr>
<td>
-eq</td>
<td>
检测两个数是否相等，相等返回 true。</td>
<td>
[ $a -eq $b ] 返回&nbsp;true。</td>
</tr>
<tr>
<td>
-ne</td>
<td>
检测两个数是否相等，不相等返回 true。</td>
<td>
[ $a -ne $b ] 返回 true。</td>
</tr>
<tr>
<td>
-gt</td>
<td>
检测左边的数是否大于右边的，如果是，则返回 true。</td>
<td>
[ $a -gt $b ] 返回 false。</td>
</tr>
<tr>
<td>
-lt</td>
<td>
检测左边的数是否小于右边的，如果是，则返回 true。</td>
<td>
[ $a -lt $b ] 返回 true。</td>
</tr>
<tr>
<td>
-ge</td>
<td>
检测左边的数是否大等于右边的，如果是，则返回 true。</td>
<td>
[ $a -ge $b ] 返回 false。</td>
</tr>
<tr>
<td>
-le</td>
<td>
检测左边的数是否小于等于右边的，如果是，则返回 true。</td>
<td>
[ $a -le $b ] 返回 true。</td>
</tr>
</tbody>
</table>

### 布尔运算符
<table>
<tbody>
<tr>
<th>
运算符</th>
<th>
说明</th>
<th>
举例</th>
</tr>
<tr>
<td>
!</td>
<td>
非运算，表达式为 true 则返回 false，否则返回 true。</td>
<td>
[ ! false ] 返回 true。</td>
</tr>
<tr>
<td>
-o</td>
<td>
或运算，有一个表达式为 true 则返回 true。</td>
<td>
[ $a -lt 20 -o $b -gt 100 ] 返回&nbsp;true。</td>
</tr>
<tr>
<td>
-a</td>
<td>
与运算，两个表达式都为 true 才返回 true。</td>
<td>
[ $a -lt 20 -a $b -gt 100 ] 返回&nbsp;false。</td>
</tr>
</tbody>
</table>

### 字符串运算符
<table>
<caption>
字符串运算符列表</caption>
<tbody>
<tr>
<th>
运算符</th>
<th>
说明</th>
<th>
举例</th>
</tr>
<tr>
<td>
=</td>
<td>
检测两个字符串是否相等，相等返回 true。</td>
<td>
[ $a = $b ] 返回 false。</td>
</tr>
<tr>
<td>
!=</td>
<td>
检测两个字符串是否相等，不相等返回 true。</td>
<td>
[ $a != $b ] 返回&nbsp;true。</td>
</tr>
<tr>
<td>
-z</td>
<td>
检测字符串长度是否为0，为0返回 true。</td>
<td>
[ -z $a ] 返回 false。</td>
</tr>
<tr>
<td>
-n</td>
<td>
检测字符串长度是否为0，不为0返回 true。</td>
<td>
[ -z $a ] 返回 true。</td>
</tr>
<tr>
<td>
str</td>
<td>
检测字符串是否为空，不为空返回 true。</td>
<td>
[ $a ] 返回&nbsp;true。</td>
</tr>
</tbody>
</table>

### 文件测试运算符
<table>
<caption>
文件测试运算符列表</caption>
<tbody>
<tr>
<th>
操作符</th>
<th>
说明</th>
<th>
举例</th>
</tr>
<tr>
<td>
-b file</td>
<td>
检测文件是否是块设备文件，如果是，则返回 true。</td>
<td>
[ -b $file ] 返回 false。</td>
</tr>
<tr>
<td>
-c file</td>
<td>
检测文件是否是字符设备文件，如果是，则返回 true。</td>
<td>
[ -b $file ] 返回&nbsp;false。</td>
</tr>
<tr>
<td>
-d file</td>
<td>
检测文件是否是目录，如果是，则返回 true。</td>
<td>
[ -d $file ] 返回 false。</td>
</tr>
<tr>
<td>
-f file</td>
<td>
检测文件是否是普通文件（既不是目录，也不是设备文件），如果是，则返回 true。</td>
<td>
[ -f $file ] 返回&nbsp;true。</td>
</tr>
<tr>
<td>
-g file</td>
<td>
检测文件是否设置了 SGID 位，如果是，则返回 true。</td>
<td>
[ -g $file ] 返回&nbsp;false。</td>
</tr>
<tr>
<td>
-k file</td>
<td>
检测文件是否设置了粘着位(Sticky Bit)，如果是，则返回 true。</td>
<td>
[ -k $file ] 返回&nbsp;false。</td>
</tr>
<tr>
<td>
-p file</td>
<td>
检测文件是否是具名管道，如果是，则返回 true。</td>
<td>
[ -p $file ] 返回&nbsp;false。</td>
</tr>
<tr>
<td>
-u file</td>
<td>
检测文件是否设置了 SUID 位，如果是，则返回 true。</td>
<td>
[ -u $file ] 返回&nbsp;false。</td>
</tr>
<tr>
<td>
-r file</td>
<td>
检测文件是否可读，如果是，则返回 true。</td>
<td>
[ -r $file ] 返回&nbsp;true。</td>
</tr>
<tr>
<td>
-w file</td>
<td>
检测文件是否可写，如果是，则返回 true。</td>
<td>
[ -w $file ] 返回&nbsp;true。</td>
</tr>
<tr>
<td>
-x file</td>
<td>
检测文件是否可执行，如果是，则返回 true。</td>
<td>
[ -x $file ] 返回&nbsp;true。</td>
</tr>
<tr>
<td>
-s file</td>
<td>
检测文件是否为空（文件大小是否大于0），不为空返回 true。</td>
<td>
[ -s $file ] 返回&nbsp;true。</td>
</tr>
<tr>
<td>
-e file</td>
<td>
检测文件（包括目录）是否存在，如果是，则返回 true。</td>
<td>
[ -e $file ] 返回&nbsp;true。</td>
</tr>
</tbody>
</table>

## shell注释
sh里没有多行注释，只能每一行加一个#号。

## shell字符串
### 单引号
单引号字符串的限制：
- 单引号里的任何字符都会原样输出，单引号字符串中的变量是无效的；
- 单引号字串中不能出现单引号（对单引号使用转义符后也不行）。


### 双引号
双引号的优点：
- 双引号里可以有变量
- 双引号里可以出现转义字符


### 拼接字符串
```
your_name="qinjx"
greeting="hello, "$your_name" !"
greeting_1="hello, ${your_name} !"

echo $greeting $greeting_1
```
### 获取字符串长度
```
string="abcd"
echo ${#string} #输出 4
```
### 提取子字符串
```
string="alibaba is a great company"
echo ${string:1:4} #输出liba
```
### 查找子字符串
```
string="alibaba is a great company"
echo `expr index "$string" is`
```

## shell数组
### 定义数组
语法：arry_name=(valie1...valuen)  
或者arry_name=(
value1
value2
.
.
.
valuen)
或者  
arry_name[0]=value1
arry_name[1]=value2
### 读取数组
语法```${arry_name[index]}```
使用`@`或者`*`可以获取数组中的所有元素，例如：
```
${arry_name[*]}
${arry_name[@]}
```
### 获取数组长度
获取数组长度的方法与获取字符串长度的方法相同，例如：
```
# 取得数组元素的个数
length=${#array_name[@]}
# 或者
length=${#array_name[*]}
# 取得数组单个元素的长度
lengthn=${#array_name[n]}
```
## echo命令
- 显示转义字符
- 显示变量
- 显示换行

`\n`为换行符，`\c`为不换行符。
- 显示不换行
- 显示结果重定向至文件

`echo "It is a test" > myfile`
- 原样输出字符串
- 显示命令执行结果
`echo date`
## printf命令
printf命令的语法：
`printf format-string [arguments ...]`
format-string为格式控制字符串，arguments为参数列表。
## if else语句
1.if else语句的语法：

```
if [ expression ]
then
   Statement(s) to be executed if expression is true
fi
```
2.if else fi语句的语法

```
if [ expression ]
then
   Statement(s) to be executed if expression is true
else
   Statement(s) to be executed if expression is not true
fi
```
3.if elif fi语句

```
if [ expression 1 ]
then
   Statement(s) to be executed if expression 1 is true
elif [ expression 2 ]
then
   Statement(s) to be executed if expression 2 is true
elif [ expression 3 ]
then
   Statement(s) to be executed if expression 3 is true
else
   Statement(s) to be executed if no expression is true
fi
```
## shell test命令
<div id="art-body">Shell中的 test 命令用于检查某个条件是否成立，它可以进行数值、字符和文件三个方面的测试。
<h2>
数值测试</h2>
<table>
<tbody>
<tr>
<th>
参数</th>
<th>
说明</th>
</tr>
<tr>
<td>
-eq</td>
<td>
等于则为真</td>
</tr>
<tr>
<td>
-ne</td>
<td>
不等于则为真</td>
</tr>
<tr>
<td>
-gt</td>
<td>
大于则为真</td>
</tr>
<tr>
<td>
-ge</td>
<td>
大于等于则为真</td>
</tr>
<tr>
<td>
-lt</td>
<td>
小于则为真</td>
</tr>
<tr>
<td>
-le</td>
<td>
小于等于则为真</td>
</tr>
</tbody>
</table>
<br>
例如：
<div class="snippet-container" style="undefined;"><div class="sh_bright snippet-wrap"><div class="snippet-menu sh_sourceCode" style="display: none;"><pre><a class="snippet-copy sh_url" href="#" style="display: none;">复制</a><a class="snippet-text sh_url" href="#">纯文本</a><a class="snippet-window sh_url" href="#">复制</a></pre></div><pre class="shell sh_sh snippet-formatted sh_sourceCode"><ol class="snippet-num"><li><span class="sh_variable">num1</span><span class="sh_symbol">=</span><span class="sh_number">100</span></li><li><span class="sh_variable">num2</span><span class="sh_symbol">=</span><span class="sh_number">100</span></li><li><span class="sh_keyword">if</span> <span class="sh_keyword">test</span> <span class="sh_variable">$[</span>num1<span class="sh_symbol">]</span> <span class="sh_normal">-eq</span> <span class="sh_variable">$[</span>num2<span class="sh_symbol">]</span></li><li><span class="sh_keyword">then</span></li><li>    echo <span class="sh_string">'The two numbers are equal!'</span></li><li><span class="sh_keyword">else</span></li><li>    echo <span class="sh_string">'The two numbers are not equal!'</span></li><li><span class="sh_keyword">fi</span></li></ol></pre><pre class="snippet-textonly sh_sourceCode" style="display:none;">num1=100
num2=100
if test $[num1] -eq $[num2]
then
    echo 'The two numbers are equal!'
else
    echo 'The two numbers are not equal!'
fi</pre></div></div>
输出：<br>
The two numbers are equal!<br>
<h2>
字符串测试</h2>
<table>
<tbody>
<tr>
<th>
参数</th>
<th>
说明</th>
</tr>
<tr>
<td>
=</td>
<td>
等于则为真</td>
</tr>
<tr>
<td>
!=</td>
<td>
不相等则为真</td>
</tr>
<tr>
<td>
-z 字符串</td>
<td>
字符串长度伪则为真</td>
</tr>
<tr>
<td>
-n 字符串</td>
<td>
字符串长度不伪则为真</td>
</tr>
</tbody>
</table>
<br>
例如：
<div class="snippet-container" style="undefined;"><div class="sh_bright snippet-wrap"><div class="snippet-menu sh_sourceCode" style="display: none;"><pre><a class="snippet-copy sh_url" href="#" style="display: none;">复制</a><a class="snippet-text sh_url" href="#">纯文本</a><a class="snippet-window sh_url" href="#">复制</a></pre></div><pre class="shell sh_sh snippet-formatted sh_sourceCode"><ol class="snippet-num"><li><span class="sh_variable">num1</span><span class="sh_symbol">=</span><span class="sh_number">100</span></li><li><span class="sh_variable">num2</span><span class="sh_symbol">=</span><span class="sh_number">100</span></li><li><span class="sh_keyword">if</span> <span class="sh_keyword">test</span> <span class="sh_variable">num1</span><span class="sh_symbol">=</span>num2</li><li><span class="sh_keyword">then</span></li><li>    echo <span class="sh_string">'The two strings are equal!'</span></li><li><span class="sh_keyword">else</span></li><li>    echo <span class="sh_string">'The two strings are not equal!'</span></li><li><span class="sh_keyword">fi</span></li></ol></pre><pre class="snippet-textonly sh_sourceCode" style="display:none;">num1=100
num2=100
if test num1=num2
then
    echo 'The two strings are equal!'
else
    echo 'The two strings are not equal!'
fi</pre></div></div>
输出：<br>
The two strings are equal!
<h2>
文件测试</h2>
<table>
<tbody>
<tr>
<th>
参数</th>
<th>
说明</th>
</tr>
<tr>
<td>
-e 文件名</td>
<td>
如果文件存在则为真</td>
</tr>
<tr>
<td>
-r 文件名</td>
<td>
如果文件存在且可读则为真</td>
</tr>
<tr>
<td>
-w 文件名</td>
<td>
如果文件存在且可写则为真</td>
</tr>
<tr>
<td>
-x 文件名</td>
<td>
如果文件存在且可执行则为真</td>
</tr>
<tr>
<td>
-s 文件名</td>
<td>
如果文件存在且至少有一个字符则为真</td>
</tr>
<tr>
<td>
-d 文件名</td>
<td>
如果文件存在且为目录则为真</td>
</tr>
<tr>
<td>
-f 文件名</td>
<td>
如果文件存在且为普通文件则为真</td>
</tr>
<tr>
<td>
-c 文件名</td>
<td>
如果文件存在且为字符型特殊文件则为真</td>
</tr>
<tr>
<td>
-b 文件名</td>
<td>
如果文件存在且为块特殊文件则为真</td>
</tr>
</tbody>
</table>
例如：
<div class="snippet-container" style="undefined;"><div class="sh_bright snippet-wrap"><div class="snippet-menu sh_sourceCode" style="display:none;"><pre><a class="snippet-copy sh_url" href="#" style="display: none;">复制</a><a class="snippet-text sh_url" href="#">纯文本</a><a class="snippet-window sh_url" href="#">复制</a></pre></div><pre class="shell sh_sh snippet-formatted sh_sourceCode"><ol class="snippet-num"><li>cd <span class="sh_normal">/bin</span></li><li><span class="sh_keyword">if</span> <span class="sh_keyword">test</span> <span class="sh_normal">-e</span> <span class="sh_symbol">.</span><span class="sh_normal">/bash</span></li><li><span class="sh_keyword">then</span></li><li>    echo <span class="sh_string">'The file already exists!'</span></li><li><span class="sh_keyword">else</span></li><li>    echo <span class="sh_string">'The file does not exists!'</span></li><li><span class="sh_keyword">fi</span></li></ol></pre><pre class="snippet-textonly sh_sourceCode" style="display:none;">cd /bin
if test -e ./bash
then
    echo 'The file already exists!'
else
    echo 'The file does not exists!'
fi</pre></div></div>
输出：<br>
The file already exists!<br>
<br>
另外，Shell还提供了与( ! )、或( -o )、非( -a )三个逻辑操作符用于将测试条件连接起来，其优先级为：“!”最高，“-a”次之，“-o”最低。例如：
<div class="snippet-container" style="undefined;"><div class="sh_bright snippet-wrap"><div class="snippet-menu sh_sourceCode" style="display:none;"><pre><a class="snippet-copy sh_url" href="#" style="display: none;">复制</a><a class="snippet-text sh_url" href="#">纯文本</a><a class="snippet-window sh_url" href="#">复制</a></pre></div><pre class="shell sh_sh snippet-formatted sh_sourceCode"><ol class="snippet-num"><li>cd <span class="sh_normal">/bin</span></li><li><span class="sh_keyword">if</span> <span class="sh_keyword">test</span> <span class="sh_normal">-e</span> <span class="sh_symbol">.</span><span class="sh_normal">/notFile</span> <span class="sh_normal">-o</span> <span class="sh_symbol">.</span><span class="sh_normal">/bash</span></li><li><span class="sh_keyword">then</span></li><li>    echo <span class="sh_string">'One file exists at least!'</span></li><li><span class="sh_keyword">else</span></li><li>    echo <span class="sh_string">'Both dose not exists!'</span></li><li><span class="sh_keyword">fi</span></li></ol></pre><pre class="snippet-textonly sh_sourceCode" style="display:none;">cd /bin
if test -e ./notFile -o ./bash
then
    echo 'One file exists at least!'
else
    echo 'Both dose not exists!'
fi</pre></div></div>
输出：<br>
One file exists at least!</div>

## shell case esac命令
<div id="art-body">case ... esac 与其他语言中的 switch ... case 语句类似，是一种多分枝选择结构。<br>
<br>
case 语句匹配一个值或一个模式，如果匹配成功，执行相匹配的命令。case语句格式如下：
<pre class="info-box">case 值 in
模式1)
    command1
    command2
    command3
    ;;
模式2）
    command1
    command2
    command3
    ;;
*)
    command1
    command2
    command3
    ;;
esac</pre>
case工作方式如上所示。取值后面必须为关键字 in，每一模式必须以右括号结束。取值可以为变量或常数。匹配发现取值符合某一模式后，其间所有命令开始执行直至 ;;。;; 与其他语言中的 break 类似，意思是跳到整个 case 语句的最后。<br>
<br>
取值将检测匹配的每一个模式。一旦模式匹配，则执行完匹配模式相应命令后不再继续其他模式。如果无一匹配模式，使用星号 * 捕获该值，再执行后面的命令。<br>
<br>
下面的脚本提示输入1到4，与每一种模式进行匹配：
<div class="snippet-container" style="undefined;"><div class="sh_bright snippet-wrap"><div class="snippet-menu sh_sourceCode" style="display:none;"><pre><a class="snippet-copy sh_url" href="#" style="display: none;">复制</a><a class="snippet-text sh_url" href="#">纯文本</a><a class="snippet-window sh_url" href="#">复制</a></pre></div><pre class="shell sh_sh snippet-formatted sh_sourceCode"><ol class="snippet-num"><li>echo <span class="sh_string">'Input a number between 1 to 4'</span></li><li>echo <span class="sh_string">'Your number is:</span><span class="sh_specialchar">\c</span><span class="sh_string">'</span></li><li><span class="sh_keyword">read</span> aNum</li><li><span class="sh_keyword">case</span> <span class="sh_variable">$aNum</span> <span class="sh_keyword">in</span></li><li>    <span class="sh_number">1</span><span class="sh_symbol">)</span>  echo <span class="sh_string">'You select 1'</span></li><li>    <span class="sh_symbol">;;</span></li><li>    <span class="sh_number">2</span><span class="sh_symbol">)</span>  echo <span class="sh_string">'You select 2'</span></li><li>    <span class="sh_symbol">;;</span></li><li>    <span class="sh_number">3</span><span class="sh_symbol">)</span>  echo <span class="sh_string">'You select 3'</span></li><li>    <span class="sh_symbol">;;</span></li><li>    <span class="sh_number">4</span><span class="sh_symbol">)</span>  echo <span class="sh_string">'You select 4'</span></li><li>    <span class="sh_symbol">;;</span></li><li>    <span class="sh_symbol">*)</span>  echo <span class="sh_string">'You do not select a number between 1 to 4'</span></li><li>    <span class="sh_symbol">;;</span></li><li><span class="sh_keyword">esac</span></li></ol></pre><pre class="snippet-textonly sh_sourceCode" style="display:none;">echo 'Input a number between 1 to 4'
echo 'Your number is:\c'
read aNum
case $aNum in
    1)  echo 'You select 1'
    ;;
    2)  echo 'You select 2'
    ;;
    3)  echo 'You select 3'
    ;;
    4)  echo 'You select 4'
    ;;
    *)  echo 'You do not select a number between 1 to 4'
    ;;
esac</pre></div></div>
输入不同的内容，会有不同的结果，例如：
<pre class="info-box">Input a number between 1 to 4
Your number is:3
You select 3</pre>
<br>
再举一个例子：
<div class="snippet-container" style="undefined;"><div class="sh_bright snippet-wrap"><div class="snippet-menu sh_sourceCode" style="display:none;"><pre><a class="snippet-copy sh_url" href="#" style="display: none;">复制</a><a class="snippet-text sh_url" href="#">纯文本</a><a class="snippet-window sh_url" href="#">复制</a></pre></div><pre class="shell sh_sh snippet-formatted sh_sourceCode"><ol class="snippet-num"><li><span class="sh_comment">#!/bin/bash</span></li><li><span style="display:none;">&nbsp;</span></li><li><span class="sh_variable">option</span><span class="sh_symbol">=</span><span class="sh_string">"${1}"</span></li><li><span class="sh_keyword">case</span> <span class="sh_variable">${option}</span> <span class="sh_keyword">in</span></li><li>   <span class="sh_normal">-f</span><span class="sh_symbol">)</span> <span class="sh_variable">FILE</span><span class="sh_symbol">=</span><span class="sh_string">"${2}"</span></li><li>      echo <span class="sh_string">"File name is $FILE"</span></li><li>      <span class="sh_symbol">;;</span></li><li>   <span class="sh_normal">-d</span><span class="sh_symbol">)</span> <span class="sh_variable">DIR</span><span class="sh_symbol">=</span><span class="sh_string">"${2}"</span></li><li>      echo <span class="sh_string">"Dir name is $DIR"</span></li><li>      <span class="sh_symbol">;;</span></li><li>   <span class="sh_symbol">*)</span> </li><li>      echo <span class="sh_string">"`basename ${0}`:usage: [-f file] | [-d directory]"</span></li><li>      <span class="sh_keyword">exit</span> <span class="sh_number">1</span> <span class="sh_comment"># Command to come out of the program with status 1</span></li><li>      <span class="sh_symbol">;;</span></li><li><span class="sh_keyword">esac</span></li></ol></pre><pre class="snippet-textonly sh_sourceCode" style="display:none;">#!/bin/bash

option="${1}"
case ${option} in
   -f) FILE="${2}"
      echo "File name is $FILE"
      ;;
   -d) DIR="${2}"
      echo "Dir name is $DIR"
      ;;
   *) 
      echo "`basename ${0}`:usage: [-f file] | [-d directory]"
      exit 1 # Command to come out of the program with status 1
      ;;
esac</pre></div></div>
运行结果：
<pre class="info-box">$./test.sh
test.sh: usage: [ -f filename ] | [ -d directory ]
$ ./test.sh -f index.htm
$ vi test.sh
$ ./test.sh -f index.htm
File name is index.htm
$ ./test.sh -d unix
Dir name is unix
$</pre>
</div>

## shell for循环
<div id="art-body">与其他编程语言类似，Shell支持for循环。<br>
<br>
for循环一般格式为：
<pre class="info-box">for 变量 in 列表
do
    command1
    command2
    ...
    commandN
done</pre>
列表是一组值（数字、字符串等）组成的序列，每个值通过空格分隔。每循环一次，就将列表中的下一个值赋给变量。<br>
<br>
in 列表是可选的，如果不用它，for 循环使用命令行的位置参数。<br>
<br>
例如，顺序输出当前列表中的数字：
<div class="snippet-container" style="undefined;"><div class="sh_bright snippet-wrap"><div class="snippet-menu sh_sourceCode" style="display: none;"><pre><a class="snippet-copy sh_url" href="#" style="display: none;">复制</a><a class="snippet-text sh_url" href="#">纯文本</a><a class="snippet-window sh_url" href="#">复制</a></pre></div><pre class="shell sh_sh snippet-formatted sh_sourceCode"><ol class="snippet-num"><li><span class="sh_keyword">for</span> loop <span class="sh_keyword">in</span> <span class="sh_number">1</span> <span class="sh_number">2</span> <span class="sh_number">3</span> <span class="sh_number">4</span> <span class="sh_number">5</span></li><li><span class="sh_keyword">do</span></li><li>    echo <span class="sh_string">"The value is: $loop"</span></li><li><span class="sh_keyword">done</span></li></ol></pre><pre class="snippet-textonly sh_sourceCode" style="display:none;">for loop in 1 2 3 4 5
do
    echo "The value is: $loop"
done</pre></div></div>
运行结果：
<pre class="info-box">The value is: 1
The value is: 2
The value is: 3
The value is: 4
The value is: 5</pre>
<br>
顺序输出字符串中的字符：
<div class="snippet-container" style="undefined;"><div class="sh_bright snippet-wrap"><div class="snippet-menu sh_sourceCode" style="display:none;"><pre><a class="snippet-copy sh_url" href="#" style="display: none;">复制</a><a class="snippet-text sh_url" href="#">纯文本</a><a class="snippet-window sh_url" href="#">复制</a></pre></div><pre class="shell sh_sh snippet-formatted sh_sourceCode"><ol class="snippet-num"><li><span class="sh_keyword">for</span> str <span class="sh_keyword">in</span> <span class="sh_string">'This is a string'</span></li><li><span class="sh_keyword">do</span></li><li>    echo <span class="sh_variable">$str</span></li><li><span class="sh_keyword">done</span></li></ol></pre><pre class="snippet-textonly sh_sourceCode" style="display:none;">for str in 'This is a string'
do
    echo $str
done</pre></div></div>
运行结果：
<pre class="info-box">This is a string</pre>
<br>
显示主目录下以 .bash 开头的文件：
<div class="snippet-container" style="undefined;"><div class="sh_bright snippet-wrap"><div class="snippet-menu sh_sourceCode" style="display:none;"><pre><a class="snippet-copy sh_url" href="#" style="display: none;">复制</a><a class="snippet-text sh_url" href="#">纯文本</a><a class="snippet-window sh_url" href="#">复制</a></pre></div><pre class="shell sh_sh snippet-formatted sh_sourceCode"><ol class="snippet-num"><li><span class="sh_comment">#!/bin/bash</span></li><li><span style="display:none;">&nbsp;</span></li><li><span class="sh_keyword">for</span> FILE <span class="sh_keyword">in</span> <span class="sh_variable">$HOME</span><span class="sh_symbol">/.</span>bash<span class="sh_symbol">*</span></li><li><span class="sh_keyword">do</span></li><li>   echo <span class="sh_variable">$FILE</span></li><li><span class="sh_keyword">done</span></li></ol></pre><pre class="snippet-textonly sh_sourceCode" style="display:none;">#!/bin/bash
for FILE in $HOME/.bash*
do
   echo $FILE
done</pre></div></div>
运行结果：

<pre class="info-box">/root/.bash_history
/root/.bash_logout
/root/.bash_profile
/root/.bashrc</pre>
</div>

## shell while循环
<div id="art-body">while循环用于不断执行一系列命令，也用于从输入文件中读取数据；命令通常为测试条件。其格式为：
<pre class="info-box">while command
do
&nbsp;&nbsp; Statement(s) to be executed if command is true
done</pre>
命令执行完毕，控制返回循环顶部，从头开始直至测试条件为假。<br>
<br>
以下是一个基本的while循环，测试条件是：如果COUNTER小于5，那么返回 true。COUNTER从0开始，每次循环处理时，COUNTER加1。运行上述脚本，返回数字1到5，然后终止。
<div class="snippet-container" style="undefined;"><div class="sh_bright snippet-wrap"><div class="snippet-menu sh_sourceCode" style="display: none;"><pre><a class="snippet-copy sh_url" href="#" style="display: none;">复制</a><a class="snippet-text sh_url" href="#">纯文本</a><a class="snippet-window sh_url" href="#">复制</a></pre></div><pre class="shell sh_sh snippet-formatted sh_sourceCode"><ol class="snippet-num"><li><span class="sh_variable">COUNTER</span><span class="sh_symbol">=</span><span class="sh_number">0</span></li><li><span class="sh_keyword">while</span> <span class="sh_symbol">[</span> <span class="sh_variable">$COUNTER</span> <span class="sh_normal">-lt</span> <span class="sh_number">5</span> <span class="sh_symbol">]</span></li><li><span class="sh_keyword">do</span></li><li>    <span class="sh_variable">COUNTER</span><span class="sh_symbol">=</span><span class="sh_string">'expr $COUNTER+1'</span></li><li>    echo <span class="sh_variable">$COUNTER</span></li><li><span class="sh_keyword">done</span></li></ol></pre><pre class="snippet-textonly sh_sourceCode" style="display:none;">COUNTER=0
while [ $COUNTER -lt 5 ]
do
    COUNTER='expr $COUNTER+1'
    echo $COUNTER
done</pre></div></div>
运行脚本，输出：
<pre class="info-box">1
2
3
4
5</pre>
<br>
while循环可用于读取键盘信息。下面的例子中，输入信息被设置为变量FILM，按&lt;Ctrl-D&gt;结束循环。
<div class="snippet-container" style="undefined;"><div class="sh_bright snippet-wrap"><div class="snippet-menu sh_sourceCode" style="display: none;"><pre><a class="snippet-copy sh_url" href="#" style="display: none;">复制</a><a class="snippet-text sh_url" href="#">纯文本</a><a class="snippet-window sh_url" href="#">复制</a></pre></div><pre class="shell sh_sh snippet-formatted sh_sourceCode"><ol class="snippet-num"><li>echo <span class="sh_string">'type &lt;CTRL-D&gt; to terminate'</span></li><li>echo <span class="sh_normal">-n</span> <span class="sh_string">'enter your most liked film: '</span></li><li><span class="sh_keyword">while</span> <span class="sh_keyword">read</span> FILM</li><li><span class="sh_keyword">do</span></li><li>    echo <span class="sh_string">"Yeah! great film the $FILM"</span></li><li><span class="sh_keyword">done</span></li></ol></pre><pre class="snippet-textonly sh_sourceCode" style="display:none;">echo 'type &lt;CTRL-D&gt; to terminate'
echo -n 'enter your most liked film: '
while read FILM
do
    echo "Yeah! great film the $FILM"
done</pre></div></div>
运行脚本，输出类似下面：
<pre class="info-box">type &lt;CTRL-D&gt; to terminate
enter your most liked film: Sound of Music
Yeah! great film the Sound of Music</pre>
</div>

## shell until循环
until 循环执行一系列命令直至条件为true时停止。
```
until command
do
   Statement(s) to be executed until command is true
done
```

## break命令
break命令允许跳出所有循环（终止执行后面的所有循环）。

`break n`
## continue命令
continue命令与break命令类似，只有一点差别，，它不会跳出所有循环，仅仅跳出当前循环。
## shell函数返回值、删除函数、在终端调用函数
1.shell函数的定义格式：

```
function_name () {
    list of commands
    [ return value ]
}

function function_name () {
    list of commands
    [ return value ]
}
```
## shell函数参数
在shell中，调用函数时可以向其传递参数。在函数内部，通过`$n`的形式来获取参数的值。

另外还有几个特殊变量用来处理参数：

|特殊变量|说明|
|:-:|:-:|
|`$#`|传递给函数的参数个数。|
|`$*`|-显示所有传递给函数的参数。|
|`$@`|与`$*`相同，但有所区别，请查看shell特殊变量。|
|`$?`|函数的返回值。|

## 输出重定向
语法：`command > file`
## 输入重定向
语法：`commad < file`
## shell文件包含
shell可以包含外部脚本，将外部脚本的内容合并到当前脚本。
语法：
```
. filename

source filename
```


