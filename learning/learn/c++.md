# 语法基础

###### using的三种用法

- 命名空间的使用
  - using namespace std
- 在子类中引用基类的成员(访问权限)
  - private继承，使用using Father::value将成员权限改为public或protected
  - 构造函数默认为私有
- 别名(aliase)指定
  - using type_a=type_b
  - 与typedef区别
    - 别名比较清晰
    - 能做到模板别名
- 覆盖重载部分基类函数
  - 因为派生类可以重载继承自基类的成员函数，所以如果派生类希望所有的重载版本对于它都是可见的，那么它就要覆盖所有版本或者一个也不覆盖。

###### override 重写（覆盖）

显式的在派生类中声明（**函数参数列表后**），哪些成员函数需要被重写，可以避免派生类中忘记重写虚函数的错误。

###### #pragma once用法总结

防止重复引用造成二义性（主要是为了避免重复编译）,通常有两种方式:

- #ifndef

  ```
  #ifndef _CODE_BLOCK
  #define _CODE_BLOCK
  // code
  #endif// _CODE_BLOCK 
  ```

- #pragma once

  ```
  #pragma once
  ```

- 区别

  #ifndef方式受C/C++语言标准的支持，不受编译器的任何限制；
  #ifndef可以针对一个文件中的部分代码，而#pragma once只能针对整个文件（拷贝的多个相同文件不行）。
  相对而言，#ifndef更加灵活，兼容性好，#pragma once操作简单，效率高。

# 面向对象







# STL

###### std:vector

- clear(）
- push_back()
- shrink_to_fit()
  - 它减少容器的容量以适应其大小并销毁超出容量的所有元素。

###### std::regex [正则表达式](http://help.locoy.com/Document/Learn_Regex_For_30_Minutes.htm)

- **\b**---**元字符,**代表着单词的开头或结尾
- **.**---**任意数量的不包含换行的字符**
- \d---**匹配一位数字**
- {5}---连续重复匹配

```
  读取文件内容匹配后放入容器
  for (std::sregex_iterator it(poistr.begin(), poistr.end(), pattern), end_it; it != end_it; ++it){
    vector_position_x.push_back(std::stof(it->str(1)));
    vector_position_y.push_back(std::stof(it->str(2)));
    vector_position_z.push_back(std::stof(it->str(3)));
  }
```

###### [std::ifstream](https://blog.csdn.net/sinat_36219858/article/details/80369255)

-  #include <fstream> 

-  is_open()
   - 判断文件是否打开
-  get()
   - 获取一个字符
   - getline
-  good()
   - 判断文件是否结束，在没有发生任何错误的时候返回true。
   - eof()
     - 用于判断最后一次读取数据时候是否遇到EOF，若是返回true
-  std::ifstream::in
   - 只读方式打开
   - 继承关系：ios_base <- ios <- istream <- ifstream
   - std::ios_base::in
   - 



# 新特性





1.保证派生类不可复制（noncopyable类：要一个C++类不能被拷贝，可以显示的声明类的拷贝构造函数和赋值函数为私有函数）

```
https://blog.csdn.net/zhizhengguan/article/details/109737370
/*
c++11之前：拷贝构造函数和拷贝赋值函数设为private权限
c++11之后：
基本思想是： 把构造函数和析构函数设置为protected权限，这样子类可以调用，但是外面的类不能调用。

最关键的是将noncopyable把拷贝构造函数和拷贝赋值函数做成delete（禁止访问）
*/
class noncopyable
{
 public:  //delete表示禁止类的拷贝赋值操作
  noncopyable(const noncopyable&) = delete;
  void operator=(const noncopyable&) = delete;

 protected:  // 可以构造和析构函数
  noncopyable() = default;
  ~noncopyable() = default;
};

```

###### proto相关：

1.proto用法

```
protobuf 2 中有三种数据类型限定修饰符：required, optional, repeated //required表示字段必选，optional表示字段可选，repeated表示一个数组类型
```

```
常用数据类型
bool,		布尔类型

double,		64位浮点数
float,		32位浮点数

int32,		32位整数
int64,		64位整数
uint64,		64位无符号整数
sint32,		32位整数，处理负数效率更高
sint64,		64位整数，处理负数效率更高

string,		只能处理ASCII字符
bytes,		用于处理多字节的语言字符
enum,		枚举类型
```

例子：

```
syntax = "proto3";
package tutorial;

option optimize_for = LITE_RUNTIME;

message Person {
	int32 id = 1;
	repeated string name = 2;
}
```

编译：

```
protoc -I=$SRC_DIR $SRC_DIR/xxx.proto --cpp_out=$DST_DIR
$SRC_DIR 表示 .proto文件所在的源目录；
$DST_DIR 表示生成目标语言代码的目标目录；
xxx.proto 表示要对哪个.proto文件进行解析；
--cpp_out 表示生成C++代码。
LD_LIBRARY_PATH=${PROTOC_DIR}/lib ${PROTOC_DIR}/bin/protoc -I$PROTO_OUT_DIR --cpp_out=$PROTO_OUT_DIR --python_out=$PROTO_OUT_DIR --proto_path=$PWD $proto
```

编译完成后，将会在目标目录中生成 xxx.pb.h 和 pb.cc， 文件，将其引入到我们的C++工程中即可实现使用protobuf进行序列化：

在C++源文件中包含 xxx.pb.h 头文件，在g++编译时链接xxx.pb.cc源文件即可：

```text
g++ main_test.cpp pb.cc， -o main_test -lprotobuf
```



# constexpr和const区别（c++11）

```
C++ 11标准中，为了解决 const 关键字的双重语义问题，保留了 const 表示“只读”的语义，而将“常量”的语义划分给了新添加的 constexpr 关键字。因此 C++11 标准中，建议将 const 和 constexpr 的功能区分开，即凡是表达“只读”语义的场景都使用 const，表达“常量”语义的场景都使用 constexpr。
constexpr int x=5
“只读”和“不允许被修改”之间并没有必然的联系
```

# vector/vetcor::3d

```
Eigen::Vector3d
std::vector
https://blog.csdn.net/yao_hou/article/details/118075188
C++ 11对容器的push_back, push_front, insert 增加了新的用法，与之对应的是emplace_back，emplace_front, emplace.它们的作用是在操作容器时可以调用对应类型的构造造数。eg:
#include <iostream>
#include <vector>
using namespace std;
struct Date
{
    int _year;
    int _month;
    int _day;
    Date(int year, int month, int day) :_year(year), _month(month), _day(day) {}
};
int main()
{
   vector<Date> vecDate;
    Date d1{ 2021, 6, 19 };
    Date d2{ 2021, 6, 15 };
    vecDate.push_back(d1);
    vecDate.push_back(d2);
    vecDate.push_back(Date(2021, 5, 30));//ok
    //vecDate.push_back(2021, 5, 30);//error
    vecDate.emplace_back(2021, 5, 31);//ok
    for (auto d : vecDate)
    {
        cout << d._year << " " << d._month << " " << d._day << endl;
    }
    return 0;
}
```

Proto用法https://blog.csdn.net/u011754972/article/details/115904854

```

```

# C++

######  std::enable_shared_from_this

```
有点复杂，没懂
```

###### std::bind

```

```

###### std::function

```
std::function是一组函数对象包装类的模板，其实例可以对普通函数、lambda表达式、函数指针、类的成员函数及其它函数对象等进行存储、复制和调用操作，它实质上是实现了一个泛型的回调机制。
template <typename MessageT>
using SubscriberMsgCallback = std::function<void(const std::string&, const MessageT&)>;

template <typename MessageT>
void RegisterCallback(SubscriberMsgCallback<MessageT> callback) {
  RegisterMsgCallback_<MessageT>(
      [callback = std::move(callback)](const std::string& name, const MessageT& msg,const MsgInfo&) { callback(name, msg); });
}
```

###### std::move

```
将一个左值转换为右值引用，实现移动语义和完美转发
- 左值是可以被引用和修改的表达式，右值是临时的、无法被修改的表达式。
- 左值引用用于引用左值，右值引用用于引用右值。
- 左值引用使用&符号进行声明，右值引用使用&&符号进行声明。
- 右值引用通常用于实现移动语义和完美转发。
```



###### typedef和using的区别

```
区别
// error: a typedef cannot be a template

template <class _T>
typedef AA<_T> aclass;
typedef 不能够直接给模板类进行取别名。
template <class _T>
using aclass = AA<_T>;
```

###### reset函数

```
p.reset(q) //q为智能指针要指向的新对象
会令智能指针p中存放指针q，即p指向q的空间，而且会释放原来的空间。（默认是delete）
```

###### 创建对象在堆上，还是在栈上？

https://blog.csdn.net/zxh2075/article/details/103546331

```
一般是动态分配的在堆上，函数内部的在栈上，看具体场景
Object obj;
Object *objptr=new Object;
```

###### c++ 带超时的线程安全队列 ThreadSafeQueue

```
自己实现：
```

###### 同步回调函数和异步回调函数

https://www.cnblogs.com/still-smile/p/12048078.html