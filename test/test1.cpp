#include <iostream>	 // 包含头文件。
using namespace std; // 指定缺省的命名空间。

class CBoy // 男朋友类。
{
public:
	string m_xm; // 男朋友的姓名。
	CBoy()		 // 没有参数的普通构造函数，默认构造函数。
	{
		m_xm.clear();
		cout << "调用了CBoy()构造函数。\n";
	}
	CBoy(string xm) // 有一个参数的普通构造函数。
	{
		m_xm = xm;
		cout << "调用了CBoy(string xm)构造函数。\n";
	}
	CBoy(const CBoy &bb) // 默认拷贝构造函数。
	{
		m_xm = bb.m_xm;
		cout << "调用了CBoy(const CBoy &bb)拷贝构造函数。\n";
	}
};

class CGirl // 超女类CGirl。
{
public:
	string m_name;	 // 姓名属性。
	const int m_age; // 年龄属性。
	CBoy &m_boy;	 // 男朋友的信息。
	// CGirl()                                       // 没有参数的普通构造函数，默认构造函数。
	//{
	//     cout << "调用了CGirl()构造函数。\n";
	// }
	// CGirl(string name, int age,CBoy &boy)     // 三个参数的普通构造函数。
	//{
	//     m_name = name; m_age = age; m_boy.m_xm = boy.m_xm;
	//     cout << "调用了CGirl(name,age,boy)构造函数。\n";
	// }
	CGirl(string name, int age, CBoy &boy) : m_name(name), m_age(age), m_boy(boy) // 三个参数的普通构造函数。
	{
		cout << "调用了CGirl(name,age,boy)构造函数。\n";
	}
	// 超女自我介绍的方法，显示姓名、年龄、男朋友。
	void show() { cout << "姓名：" << m_name << "，年龄：" << m_age << "，男朋友：" << m_boy.m_xm << endl; }
};

int main()
{
	CBoy boy("子都");

	CGirl g1("冰冰", 18, boy);

	g1.show();
}