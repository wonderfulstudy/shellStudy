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