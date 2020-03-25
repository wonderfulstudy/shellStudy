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

