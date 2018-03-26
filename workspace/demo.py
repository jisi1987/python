# -*-coding:utf-8-*-
#Filename:demo.py

#------->1.用一对"""括起来要注释的代码：
"""
print("hello world")
"""

#------->2.用一对'''括起来要注释的代码：
'''
print("hello word","jumps over","the lazy dog")
'''

#------->3.选中要注释的代码，按下ctrl+/注释：
# number = int(input("Enter a number:"))
# if number < 100:
#     print("<100")
# else:
#     print(">100")

#打印整数，或者计算结果：
print(100+200)
print('100+200=',100+200)
print '100+200 =',100+200

#------->Python 基础
"""
python大小写敏感

python能够处理的数据类型：
1.整数（包括负整数）
可以用十六进制表示整数，如：0xff00
2.浮点数
10用e表示：1.23e5=123000,1.2e-5=0.000012
3.字符串
以单引号'或者双引号"括起来，如"a",'bbb'
4.布尔值：True,False
运算使用：and，or，not
5.空值：None，不等于0,0有意义，None是一个特殊空值
6.变量
变量名：必须是大小写英文、数字、和_的组合，且不能用数字开头
7.常量：通常用全部大写的变量名表示
"""
#转义字符\
#字符串中很多字符需要转义，需要加很多\，可以使用r''表示''内部的字符串默认不转义
print('\\\t\\')
print(r'\\\t\\')
#字符串内部很多换行，用\n写在一行里不好阅读，可以使用'''...'''的格式表示多行内容
print('''line
line2
line3''')

print(r'''hello,\n
world''')

#-------->变量
a=123 #a是整数
print(a)
a='abc' #a变为字符串
print(a)
#这种变量本身类型不固定的语言成为动态语言，相对应的是静态语言
#静态语言：定义变量时必须指定变量类型，赋值不匹配会报错，java是静态语言

#--------->两种除法
#1.除法计算：/
print 10/3 #结果：3.33333(IDE运算结果与pycharm运算结果不一致)
#2.地板除：//
print 10//3 #结果：3
#整数的地板除永远是整数

print 10%3

n=123
f=456.252
s1="hello,world"
s2="hello,\'adam\'"
s3=r'hello,"bart"'
s4=r'''hello,
lisa!'''


#----------->输入
#在pycharm中，输入数字以外的字符，无法运行下去
#name=input("输入名字:\n")
#print'hello', name


#----------->字符编码
'''
1.ASCII编码：一个字节，127个字符（大小写英文字母、数字、一些符号）
2.GB2312编码：两个字节，中文编码
3.Unicode：通常2个字节，把所有语言统一到一套编码中
4.UTF-8编码：可变长编码
UTF-8把一个Unicode字符根据不同的数字大小编码成1-6个字节
英文字母：1个字节
汉子：3个字节
生僻字：4-6个字节

计算机系统通用的字符编码工作方式：
在计算机内存中，统一使用Unicode编码，当需要保存到硬盘
    或者需要传输的时候，转成UTF-8编码
用记事本编辑的时候，从文件读取UTF-8字符被转为Unicode字符
    到内存里，编辑完成后，保存的时候再把Unicode转换为
    UTF-8保存到文件
ord():获取字符的整数表示
chr():把编码转换为对应的字符
'''
print ord('A')
#print ord('中')
print chr(66)
print chr(25991)
print '\u4e2d\u6587'
