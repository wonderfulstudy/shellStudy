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
