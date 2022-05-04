# 重要的操作步骤

​		首先要将产生的回波数据保存下来，s_echo矩阵保存为plus.txt,格式，这个命令用于保存复数。所用命令为

```matlab
dlmwrite('M.txt', s_echo);
```

读取复数的txt文件命令为

```matlab
dlmread('M.txt')
```

注意，若此时进行二者的比较，matlab返回的是0，但是他们没有区别。经过验证数据指标都正常。