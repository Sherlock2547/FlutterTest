

# 1.Dart

## 1.环境搭建

#### 1.windows安装dart

```
https://gekorm.com/dart-windows/
```

#### 2.验证版本

```
dart --version
```

![image-20201027095920213](C:\Users\here\AppData\Roaming\Typora\typora-user-images\image-20201027095920213.png)

#### 3.VsCode配置dart

```
安装dart插件和code runner插件
```

#### 4.第一个dart

![image-20201027101004486](C:\Users\here\AppData\Roaming\Typora\typora-user-images\image-20201027101004486.png)

#### 5.dart的优势

```
Dart 可基于 AOT（Ahead Of Time）编译，即编译成平台的本地代码，运行性能高。

Dart 也可基于 JIT（Just In Time）编译，编译快速，可热加载，使开发周期加倍提升（Flutter 亚秒级有状态热重载）

Dart 可以更轻松地创建以 60fps 运行的流畅动画和转场。Dart 在没有锁的情况下进行对象分配和垃圾回收

Dart 语法结合 Java 与 JavaScript 语法特点，几乎没有令人不适的怪异语法，使 Java 程序员倍感亲切，快速上手

通常来说一门语言要么使用 AOT 编译，编译慢，开发效率低，或者使用 JIT 编译，在运行时编译，虽然可以热重载，但是执行效率低，而 Dart 在这两种之间做出了完美平衡，当开发时使用 JIT 编译，调试快，所见即所得，开发效率高，当发布时，使用 AOT 编译，编译成目标平台的本地代码，执行效率高。
```

## 2.语法

#### 0.命名规则

```
变量名称必须由数字，字母，下划线，和$组成。
开头不能是数字
不能是保留字和关键字
区分大小写

使用static 关键字来实现类级别的变量和函数
静态方法不能访问非静态成员，非静态方法可以访问静态成员以及非静态成员
子类会继承父类里面可见的属性和方法 但是不会继承构造函数
子类能覆写父类的方法 getter和setter
dart中我们也可以在构造函数体运行之前初始化实例变量
抽象类无法直接被实例化
```



#### 1.代码注释

Dart 中的代码注释基本与 Java 语言相同

```dart
// 单行注释

/*
 * 多行注释
 */

/**
 * 文档注释
 */

/// 使用三个斜杠开头
/// 这是Dart特有的文档注释

```

#### 2.内置数据类型

![在这里插入图片描述](https://img-blog.csdnimg.cn/20190323004151710.png?x-oss-process=image/watermark,type_ZmFuZ3poZW5naGVpdGk,shadow_10,text_aHR0cHM6Ly9hcmN0aWNmb3guYmxvZy5jc2RuLm5ldA==,size_16,color_FFFFFF,t_70)

> 在 Dart 中，所有能够使用变量引用的都是对象，每个对象都是一个类的实例。数字、函数和 `null` 也都是对象。所有的对象都继承于 Object 类。

```
要注意，没有初始化的变量默认值为 null。数值类型变量的默认值也是 null。

数值类型 num 有两个具体子类，分别为 int 和 double，其中 int 为整数值，范围是 -2^53 至 2^53 之间；double 则是 64 位的双精度浮点数。
```

#### 3.变量与常量

##### 定义变量

> Dart 中定义变量有两种方式，一种是静态类型语言常用的方式，显式指定变量类型，另一种则是动态语言的常用方式，不指定类型，由 vm 自动推断。

```dart
// 1.通过显式指定类型来定义变量
String name = "张三";
num age = 18;

// 2.使用关键字var，不指定类型
var address = "深南大道";
var id = 100;

/* 使用var定义变量，即使未显式指定类型，一旦赋值后类型就被固定
 * 因此使用var定义的变量不能改变数据类型
 */
var number = 19;
// 以下代码错误，无法运行，number变量已确定为int类型
number = "2019";
1234567891011121314
```

如想动态改变变量的数据类型，应当使用 `dynamic` 或 `Object` 来定义变量。

```dart
// dynamic声明变量
dynamic var1 = "hello";
var1 = 19;
print(var1);    // 19

// Object声明变量
Object var2 = 20;
var2 = "Alice";
print(var2);    // Alice
123456789
```

建议在编写代码时，尽可能显式指定变量类型，这样可以提升代码可读性与调试的便利性。

##### 定义常量

Dart 中定义常量也有两种方式，一种使用 `final` 关键字，同 Java 中的用法， 一个 final 变量只能赋值一次；另一种是 Dart 的方式，使用 `const` 关键字定义。

```dart
// 1.使用final关键字定义常量
final height = 10;

// 2.使用const关键字定义常量
const pi = 3.14;

const 一开始就得赋值
final 可以开始不赋值，只能赋一次值    
```

需要注意，`final` 定义的常量是运行时常量，而 `const` 常量则是编译时常量，也就是说 `final` 定义常量时，其值可以是一个变量，而 `const` 定义的常量，其值必须是一个字面常量值。

```dart
final time = new DateTime.now(); // 正确
const time = new DateTime.now(); // 错误


const list = const[1,2,3];       // 正确
const list = [1,2,3];            // 错误
```

#### 4.内置类型的常用操作

##### 数值类型

```dart
// String 转 int
var one = int.parse('1');

// String 转 double
var onePointOne = double.parse('1.1');

// int 转 String
String oneAsStr = 1.toString();

// double 转 String
String piAsStr = 3.14159.toStringAsFixed(2); // 保留两位 '3.14'

// Dart也支持整数位操作，<<、 >>、&、|
print((3 << 1) == 6);  // 0011 << 1 == 0110
print((3 >> 1) == 1);  // 0011 >> 1 == 0001
print((3 | 4)  == 7);  // 0011 | 0100 == 0111
```

##### 字符串

> 值得一提的是，Dart 中提供的字符串`插值表达式`使字符串格式化变得异常方便。

```dart
// 1.Dart可以使用单引号或双引号来创建字符串
var s1 = "hello";
var s2 = 'world';

// 2.类似Python，Dart可以使用三引号来创建包含多行的字符串
var multiLine1 = """你可以像这样，创建一个
包含了多行的字符串内容
""";

var multiLine2 = '''你也可以使用三个单引号，创建一个
包含了多行的字符串内容
''';

// 3.类似Python，还可以在字符串字面值的前面加上`r`来创建原始字符串，则该字符串中特殊字符可以不用转义
var path = r'D:\workspace\code';

// 4.Dart支持使用"+"操作符拼接字符串
var greet = "hello" + " world";

// 5.Dart提供了插值表达式"${}"，也可以用于拼接字符串
var name = "王五";
var aStr = "hello,${name}";
print(aStr);    // hello,王五

// 当仅取变量值时，可以省略花括号
var aStr2 = "hello,$name"; // hello,王五

// 当拼接的是一个表达式时，则不能省略花括号
var str1 = "link";
var str2 = "click ${str1.toUpperCase()}";
print(str2);   // click LINK

// 6. 与Java不同，Dart使用"=="来比较字符串的内容
print("hello" == "world");
```

##### 布尔类型

> Dart 中的布尔类型用法同 Java，仅有 `false`、`true` 两个值，不能使用 0、非 0 或者 `null`、非 `null` 来表达 `false` 和 `true`。与 Java 不同的是，布尔类型的默认值为 `null`

```dart
bool flags;
print(flags);    // null
```

##### 列表

Dart 中列表操作与 JavaScript 中的数组相似。

```dart
// 创建列表
var list = [1, 2, 3];
// 下标从0开始。使用length可以访问list的长度
print(list[0]);
print(list.length);

// 可以使用add添加元素
list.add(5);

// 可在list字面量前添加const关键字，定义一个不可改变的 列表（编译时常量）
var constantList = const [1, 2, 3];
constantList[1] = 1;     // 报错
```

![image-20201029090623399](C:\Users\here\AppData\Roaming\Typora\typora-user-images\image-20201029090623399.png)

##### 映射Map

又称为关联数组，相当于 Java 中的 `HashMap`

```dart
// 1.通过字面量创建Map
var gifts = {
  'first' : 'partridge',鹧鸪
  'second': 'turtledoves',斑鸠
  'fifth' : 'golden rings'
};

// 2.使用Map类的构造函数创建对象
var pic = new Map();
// 往Map中添加键值对
pic['first'] = 'partridge';
pic['second'] = 'turtledoves';
pic['fifth'] = 'golden rings';

// 3.获取Map的长度
print(pic.length);

// 4.查找Map
pirnt(pic["first"]);
print(pic["four"]);    // 键不存在则返回 null
```

![image-20201029093521551](C:\Users\here\AppData\Roaming\Typora\typora-user-images\image-20201029093521551.png)

![image-20201029093730997](C:\Users\here\AppData\Roaming\Typora\typora-user-images\image-20201029093730997.png)



##### Set

![image-20201029090920008](C:\Users\here\AppData\Roaming\Typora\typora-user-images\image-20201029090920008.png)

![image-20201029091154657](C:\Users\here\AppData\Roaming\Typora\typora-user-images\image-20201029091154657.png)

#### 5.函数

> 在 Dart 中，函数（或方法） 也是对象，它的类型是 `Function`。 这意味着，函数可以赋值给变量，也可以当做其他函数的参数。

##### 1.定义函数

Dart 中定义函数，基本上与 Java 类似

```dart
String greet(String name){
    return "hello,$name";
}
```

在 Dart 中，类型是可选，可以省略显式的类型，但仍然==建议显式指定类型==。

```dart
greet(name){
    return "hello,$name";
}
```

要注意，函数也是对象，所有函数都有返回值。当没有指定返回值的时候，函数会返回 `null`。当然，如果你强行使用 `void` 来修饰函数，则函数真的没有返回值，这种情况就另当别论了。

![image-20201029100837732](C:\Users\here\AppData\Roaming\Typora\typora-user-images\image-20201029100837732.png)

##### 2.函数的参数

Dart 中支持两种可选参数

- 命名可选参数
- 位置可选参数

在 Java 中通常使用方法重载来实现==同名方法的不同参数调用==，Dart 中则可以通过可选参数来实现相同效果。

###### 命名可选参数

先来看一下`命名参数`，它使用花括号来定义参数列表

```dart
// 定义一个函数，参数列表用花括号包裹
enableFlags({bool bold, bool hidden}) {
    // do something
}

// 调用方式，传参时使用"参数名:值"的形式
enableFlags(hidden:true,bold:false);
```

如果在定义函数时，给参数列表中的参数设置默认值，则该参数就是可选的，函数调用时可以忽略该参数，使用默认的值。

```dart
// 定义add函数
add({int x, int y=1, int z=0}){
    print(x + y + z);
}

// 调用
add(x:18);              // 19
add(x:18, y:2, z:10);   // 30
```

这里需要注意一下，SDK 1.21 之前的版本中，命名参数不能使用 `=` 号来设置默认值，而 SDK 1.21 之后，只能使用 `=` 号来设置默认值。因此，请检查并升级 SDK 版本。

###### 位置可选参数

`位置可选参数`使用中括号来定义参数列表，中括号中的参数是可选的

```dart
// 定义add函数
add(int x, [int y, int z]){
    int result = x;
    if (y !=  null){
        result = result + y;
    }

    if (z !=  null){
        result = result + z;
    }
    print(result);
}

// 调用
add(18);           // 18
add(18,12);        // 30
add(18, 12, 15);   // 45
```

给`位置可选参数`设置默认值

```dart
// 定义add函数
add(int x, [int y=0, int z=0]){
    print(x + y + z);
}
```

```
最后需要注意一下`命名可选参数`与`位置可选参数`的区别，
前者中的参数与顺序无关，无需按顺序传参，且传参数时需使用冒号；
后者与顺序相关，传参必须依照顺序。
```

##### 3.匿名函数

> 大部分函数都有名字，但我们也可以创建没有名字的函数，称为匿名函数，也被称为 lambda 表达式或者闭包。

```dart
// 定义匿名函数，并将其赋值给一个变量func，注意，函数体最后的花括号处必须有分号结束。
var func = (x,y){
    return x + y;
};

print(func(10,11));    // 21
```

注意，匿名函数与普通函数基本相同，也有参数列表，函数体，只是省去了函数名而已。

##### 4.箭头函数

> Dart 中的箭头函数与 JavaScript 中的基本相同。当函数体中只包含一个语句时，我们就可以使用 `=>` 箭头语法进行缩写。注意，箭头函数仅仅只是一个简洁表达的语法糖。

普通函数

```dart
add(num x, num y){
    return x + y;
}

print(add(18,12));    // 30
```

箭头函数

```dart
// 与上面的普通函数完全等价
add(num x, num y) => x + y;

print(add(18,12));    // 30
```

箭头函数省略了花括号的表达，箭头后面跟一个表达式，函数的返回值也就是这个表达式的值。另外，箭头函数也可以与匿名函数结合，形成==匿名箭头函数==。

```dart
var func = (num x, num y) => x + y;
```

#### 6.运算符

Dart 语言中的运算符与 Java 中的绝大多数相同。

##### 算术运算符

`+`、`-`、`*`、`/`、`%` 同 Java 语言

Dart 中又多出了一个整除运算符 `~/`，与普通除号的区别是将相除后的结果取整返回。

##### 类型判定运算符

以下是 Dart 增加的类型相关的运算符。

| 操作符 |              解释               |
| :----: | :-----------------------------: |
|  `as`  |          用于类型转换           |
|  `is`  | 如果对象是指定的类型就返回 True |
| `is!`  | 如果对象不是指定的类型返回 True |

当 `obj` 实现了 `T` 的接口时， `obj is T` 才是 true。类似于 Java 中的 `instanceof`。

Dart 中使用 `as` 操作符把对象转换为特定的类型，如无法转换则会抛出异常，因此在转换前最好使用 `is` 运算符进行检测。

```dart
// 将p转换为Person类型再操作
(p as Person).name = 'Bruce';
```

##### 条件表达式

Dart 中也支持三目表达式
`condition ? expr1 : expr2`

除此外，Dart 还增加了非空条件判断符 `??`
`expr1 ?? expr2`
上述运算表示，如果 expr1 的值不等于 `null`，则返回其值； 否则执行表达式 expr2 并返回其结果。

```dart
var str1 =  "Hello";
var str2 =  "world";
var result = str1 ?? str2.toUpperCase(); // Hello
```

> ??= 表示 a??=10  如果a为空  把10赋给a

##### 级联运算符

> 我们通常使用`.` 操作符调用对象的方法，这在 Dart 中也是支持的，但是 Dart 另外增加了一种级联运算符`..`，用两个点表示。

`级联运算符`可以在同一个对象上连续调用多个方法以及访问成员变量。 使用它可以避免创建临时变量， 写出更流畅的代码。

假如类 Person 有三个方法，`setName`、`setAge`、`save`，则可如下调用

```dart
new Person()..setName("Bob")..setAge(20)..save();
```

使用`级联运算符`调用方法，无需该方法返回对象本身即可连续的流式的调用该对象的其他方法。

##### 条件成员访问符

> 在 Java 中很容易碰到恼人的空指针错误，因此在方法调用前需要进行对象的非空判断，这样的判断语句使代码变得冗长，可读性差，不整洁。Dart 中则发明了一个新的运算符用于处理此类情况。

条件成员访问符 `?.`，它和`.` 类似，但是运算符左边的对象不能为 `null`，否则返回 `null`，若对象不为 `null`，则返回对象本身。

```dart
// list1默认值为null
List list1;
print(list1?.length);  // null

List list2 = [];
print(list2?.length);  // 0
```

#### 7.分支与循环

##### 条件分支

Dart 中的条件分支基本与 Java 相同

`if` 条件分支

```dart
if(i < 0){
  print('i < 0');
}else if(i == 0){
  print('i = 0');
} else {
  print('i > 0');
}
```

`switch` 条件分支

```dart
// 在switch的case中可以使用整数、字符串、枚举类型和编译时常量
String command = 'OPEN';
switch (command) {
  case 'CLOSED':
    break;
  case 'OPEN':
    break;
  default:
    print('Default');
}
```

##### 循环语句

###### 基本循环

Dart 中的基本循环语句与 Java 相同

```dart
// for循环
for(int i = 0; i < 9; i++) {
  print(i);
}

// while循环
while(true){
  //do something
}

// do-while循环
do{
  //do something
} while(true);
```

###### 特有循环

```dart
var myList = ['Java','JavaScript','Dart'];

// for...in...循环，类似Java中的增强for
for (var it in myList ){
    print(it);
}

// forEach循环。其参数为一个Function对象，这里传入一个匿名函数
myList.forEach((var it){
    print(it);
});

// 可以使用匿名箭头函数简写
myList.forEach((it) => print(it));
```

使用循环遍历 Map

```dart
var myMap = {
'zhangsan':'201901',
'lisi':'201902',
'wangwu':'201902'
};

// forEach遍历Map
myMap.forEach((k, v) =>  print("$k : $v"));

// 根据键获取值来遍历。通过keys返回Map中所有键的集合
for(var k in myMap.keys){
    print("$k : ${myMap[k]}");
}
```

where类似ES6的filter,过滤大于5的数

![image-20201029094505800](C:\Users\here\AppData\Roaming\Typora\typora-user-images\image-20201029094505800.png)

any返回boolean，有大于5的数就返回true，类似some

every 则需要每一个元素都大于5

#### 8.类和对象

##### 类的定义

```dart
// Dart中定义一个类
class Person {
  String name;
  int age;

  Person(String name, int age) {
    this.name = name;
    this.age = age;
  }
  void getInfo(){
	print('${this.name}----${this.age}');
  }
}
```

Dart 中的类与 Java 中的相似，不同的是，Dart 中没有 `private`、`public` 这些成员访问修饰符。如果是类私有的成员，不希望外面访问，只需要在成员变量之前加上一个下划线`_`变为私有即可。

以上代码，在 Dart 中还有一种简化写法，可以自动在构造方法中对成员变量初始化。

```dart
// Dart中定义一个类
class  Person {
    String name;
    int age;

    // 在构造方法中初始化成员变量时，可使用如下写法简化
    Person(this.name, this.age);

    // 如需处理其他变量时，也可单独对其操作
    // Person(this.name, this.age, String address){
    //     print(address);
    // }
    // 注意，构造方法不能重载，以上注释掉
}
```

另外还需要注意一点，Dart 中没有构造方法的重载，不能写两个同名的构造方法。

#### 9. Getters 和 Setters 方法

在 Java 中，一般不会直接在类的外部去访问类成员，通常使用 setter 和 getter 方法来操作类的成员变量。而在 Dart 语言中，所有类中都包含隐式的 getter 方法，对于非 `final` 修饰的成员，类中还包含隐式的 setter 方法。这就意味着，在 Dart 中，你可以直接在类外部通过`.` 操作符访问类成员。这一特点使得 Dart 语法更加简洁，不会写出满屏的 setXXX、getXXX 方法。

当然，很多时候我们调用 setter 和 getter 方法并不仅仅是为了赋值和访问，而是为了一些额外的处理，这时候我们只需要使用 `set` 与 `get` 关键字实现 setter 和 getter 方法即可。

```dart
class  Person {
    String userName;
    Person(this.userName);

    // 方法名前加get关键字
    String get name{
        return  "user:"  +  this.userName;
    }

    // 方法名前加set关键字
    set name(String name){
        // do something
        this.userName = name;
    }
}

void  main() {
    var p = new Person("zhangsan");
    print(p.name);   // user:zhangsan
    p.name = "Jack";
    print(p.name);   // user:Jack
}
```

要注意，在创建对象时，`new` 关键字并不是必须的，可以省略不写。在写 Flutter 界面时，不建议写 `new` 关键字实例化对象，因为 Flutter 框架中没有类似的 xml 语言来描述 UI 界面，界面也是使用 Dart 语言来写，在使用 Dart 写 UI 时，要保持代码的简洁和结构化，省略 `new` 会更友好。

#### 10.构造方法

> 如果没有定义构造方法，则会有一个默认的无参构造方法，并且会调用超类的无参构造方法。

##### 命名构造方法

上面已经说过，Dart 类中两个同名构造方法不能重载，但是 Dart 语言为类新增了一种称为`命名构造方法`的东西。

```dart
class  Person {
    String userName;
    int age;

    Person(this.userName, this.age);

    // 命名构造方法
    Person.fromData(Map data) {
        this.userName = data['name'];
        this.age = data['age'];
    }
}

void  main() {
    // 使用命名构造方法创建对象
    var p = new Person.fromData({
        "name":"Bob",
        "age":19
    });
    print(p.userName);
}
```

注意，使用命名构造方法可以为一个类实现多个构造方法，也可以更清晰的表明意图。

##### 常量构造方法

> 如果想提供一个状态永远不变的对像，在 Dart 中，我们可以创建一个编译时常量对象，节省开销。

```dart
class  ConstPoint {
    final num x;
    final num y;

    // 使用const修构造方法
    const ConstPoint(this.x, this.y);

    // 编译时常量对象，需使用const来创建对象
    static final ConstPoint origin = const  ConstPoint(0, 0);
}

void  main() {
    print(ConstPoint.origin.x);
    print(ConstPoint.origin.y);
}
```

##### 工厂构造方法

当我们需要创建一个新的对象或者从缓存中取一个对象时，工厂构造方法就派上了用场。

```dart
class  Logger {
    final String name;

    // 创建一个静态Map做为缓存
    static final Map<String, Logger> _cache =  <String, Logger>{};

    // 定义一个命名构造方法，用下划线"_"修饰，将构造方法私有化
    Logger._internal(this.name);

    // 使用关键字factory修饰类同名构造方法
    factory Logger(String name) {
        if (_cache.containsKey(name)) {
            return _cache[name];
        } else {
            // 调用命名构造方法创建新对象
            final logger = new  Logger._internal(name);
            _cache[name] = logger; // 存入缓存
            return logger;
        }
    }
}

void  main() {
    var uiLog = new Logger('UI');
    var eventLog = new Logger('event');
}
```

##### 构造方法重定向

有时候一个构造方法会调动类中的其他构造方法来实例化，这时候可以使用构造方法重定向，

```dart
class Point {
  num x;
  num y;

  // 同名构造方法
  Point(this.x, this.y);

  // 命名构造方法重定向到同名构造方法，中间使用一个冒号
  Point.alongXAxis(num x) : this(x, 0);
}
```

#### 11.类的初始化列表

熟悉 C++ 的朋友应该对初始化列表很了解了，Java 中是没有这个特性的。

```dart
class  Point {
    final  num x;
    final  num y;
    final  num distance;

    Point(x, y)
        : x = x,
          y = y,
          distance =  sqrt(x * x + y * y){
             print("这是构造方法");
          }
}

void  main() {
    var p =  new  Point(2, 3);
    print(p.distance);
}
```

![在这里插入图片描述](https://img-blog.csdnimg.cn/20190323003650911.jpg?x-oss-process=image/watermark,type_ZmFuZ3poZW5naGVpdGk,shadow_10,text_aHR0cHM6Ly9hcmN0aWNmb3guYmxvZy5jc2RuLm5ldA==,size_16,color_FFFFFF,t_70)

- 初始化列表位于构造方法的小括号与大括号之间，在初始化列表之前需添加一个冒号。
- 初始化列表是由逗号分隔的一些赋值语句组成。
- 它适合用来初始化 `final` 修饰的变量
- 初始化列表的调用是在构造方法之前，也就是在类完成实例化之前，因此初始化列表中是不能访问 `this` 的

#### 12.运算符重载

这个特性，又很类似于 C++ 中的运算符重载，在 Java 中是没用这种概念的。

```dart
class Point {
  int x;
  int y;

  Point(this.x, this.y);

  // 使用operator关键字，为该类重载"+"运算符
  Point operator + (Point p) {
    return new Point(this.x + p.x, this.y + p.y);
  }

  // 为该类重载"-"运算符
  Point operator - (Point p) {
    return new Point(this.x - p.x, this.y - p.y);
  }
}

void main(){
   var p1 = new Point(1,5);
   var p2 = new Point(7,10);

   // 重载运算符后，类可以使用“+”、“-” 运算符操作
   var p3 = p1 + p2;
   var p4 = p2 - p1;

   print("${p3.x}, ${p3.y}");
   print("${p4.x}, ${p4.y}");
}
```

打印结果：

```
8, 15
6, 5
```

Dart 中允许重载的运算符如下：

|      |      |      |      |      |      |       |
| :--: | :--: | :--: | :--: | :--: | :--: | :---: |
| `+`  | `–`  | `*`  | `~/` | `/`  | `%`  |  `^`  |
| `<`  | `>`  | `<=` | `>=` | `==` | `[]` | `[]=` |
| `&`  | `~`  | `<<` | `>>` |  \|  |      |       |

#### 13.类的继承

Dart 中的继承，与 Java 中相似，可以使用关键字 `extends` 继承父类，使用关键字 `super` 引用父类

```dart
class Father {
    myFunction(){
        // do something
    }
}

class Son extends Father {

    @override
    myFunction(){
        super.myFunction();
        // do something
    }
}
```

我们知道，Java 中的类仅支持单继承，而 Dart 中的类也只支持单继承。但是 Dart 可以使用一种被称为==混入==的方式来达到多继承的效果，这需要使用 `with` 关键字。

```dart
// 首先定义三个父类
class Father1 {
    a(){
      print("this is a func");
    }

    common(){
        print("common Father1");
    }
}

class Father2 {
    b(){
      print("this is b func");
    }

    common(){
        print("common Father2");
    }
}

class Father3 {
    c(){
      print("this is c func");
    }

    common(){
        print("common Father3");
    }
}

//定义子类
class Son extends Father1 with Father2,Father3{

}

void main() {
  var obj = new Son();
  obj.common();
  obj.a();
  obj.b();
  obj.c();
}
```

打印结果：

```
common Father3
this is a func
this is b func
this is c func
```

要注意，以上继承写法中，也可以直接使用 `with`，等价于如下写法

```dart
class Son with Father1,Father2,Father3{

}
```

#### 14.接口抽象

##### 抽象类

> Dart 语言没有提供 `interface` 关键字来定义接口，但是 Dart 语言中保留了抽象类，同 Java，使用 `abstract` 关键字来修饰抽象类。而 Dart 中的抽象类，实际上就相当于 Java 中的接口。

```dart
abstract class Base {
    // 省略函数体即可定义抽象方法，不需加关键字
    func1();
    func2();
}
```

注意，抽象类是不能被实例化的，子类继承抽象类时，必须实现全部抽象方法。

![image-20201029171501525](C:\Users\here\AppData\Roaming\Typora\typora-user-images\image-20201029171501525.png)

![image-20201029211643790](C:\Users\here\AppData\Roaming\Typora\typora-user-images\image-20201029211643790.png)

##### 隐式接口

> 实际上在 Dart 中，每个类都隐式的定义了一个包含所有实例成员的接口， 并且该类实现了这个接口。==定义标准==

因此，如果我们想实现某个接口，但有又不想继承，则可以使用这种隐式接口机制。我们需要用到关键字 `implements`

```dart
class People {
  void greet(){
    print("Hello");
  }
}

class Student implements People{
  @override
  void greet(){
    print("Hi,I'm Alice.");
  }
}

greet(People p){
  p.greet();
}

void main() {
  greet(new Student());
}
// Hi,I'm Alice.
```

#### 15.泛型

Dart 中也支持泛型，用法与 Java 中类似。

```dart
// 泛型
var names = new List<String>();
names.add("zhangsan")

var maps = new Map<int, String>();
maps[1]="value";

// 字面量写法
var infos = <String>['Seth', 'Kathy', 'Lars'];

var pages = <String, String>{
  'index.html': 'Homepage',
  'robots.txt': 'Hints for web robots'
};
```

#### 16.异常处理 

如果关心具体异常，针对不同异常进行不同处理，可以使用 `try...on` 处理异常，`finally` 是可选的，用于最后的处理。

```dart
  try {
      // 使除数为0
      print(11~/0);
  } on IntegerDivisionByZeroException {
      print("除数为0");
  }on Exception{
      print("Exception");
  }finally {
      print("finally");
  }
```

不关心具体异常，只想捕获，避免异常继续传递，则可以使用 `try...catch` 处理

```dart
  try {
      print(11~/0);
  } catch(e){
      // 打印报错信息
      print(e);
  }finally {
      print("finally");
  }
```

如果想获取更多异常信息，可以使用两个参数的 `catch`，第二个参数是异常的调用栈信息

```dart
  try {
      print(11~/0);
  } catch(e,s){
      print(s);
  }
```

如果你既想针对不同异常进行不同处理，还想打印调用栈信息，那就将两种结合起来使用

```dart
  try {
      print(11~/0);
  } on IntegerDivisionByZeroException catch(e,s){
      print(s);
  } on Exception catch(e,s){
      print(s);
  }
```

#### 17.库与导入

Dart 使用 `import` 语句用来导入一个库，后面跟一个字符串形式的 Uri 来指定表示要引用的库。

```dart
// 指定dart:前缀，表示导入标准库，如dart:io
import 'dart:math';

// 也可以用相对路径或绝对路径来引用dart文件
import 'lib/student/student.dart';

// 指定package:前缀，表示导入包管理系统中的库
import 'package:utils/utils.dart';
```

导入库时，可以使用 `as` 关键字来给库起别名，避免命名空间冲突。

```dart
import 'package:lib1/lib1.dart';
import 'package:lib2/lib2.dart' as lib2;

// 使用lib1中的Element
Element element1 = new Element();
// 使用lib2中的Element
lib2.Element element2 = new lib2.Element(); 
```

使用 `show` 和 `hide` 关键字控制库中成员的可见性

```dart
// 仅导入foo，屏蔽库中其他成员
import 'package:lib1/lib1.dart' show foo;

// 屏蔽foo，库中其他成员都可见
import 'package:lib2/lib2.dart' hide foo;
```

为了减少 APP 的启动时间，加载很少使用的功能，我们还可以延迟导入库。使用 `deferred as` 关键字延迟导入

```dart
import 'package:deferred/hello.dart' deferred as hello;

// 当需要使用时，再通过库标识符调用 loadLibrary函数加载
hello.loadLibrary();
```

#### 18.异步编程

Dart 与 JavaScript 一样，是一个单线程模型。但这并不意味着 Dart 中不能进行异步编程，只是这种异步编程区别于传统的多线程异步方式。

Dart 中的所有代码都只在一个线程上运行，但 Dart 代码可以运行在多个 **isolate** 上。**isolate** 可以看做一个微小的线程，**isolate** 由虚拟机调度，**isolate** 之间没有共享内存，因此它们之间没有竞争，不需要锁，不用担心死锁，因此开销小，性能高。由于没有共享内存，所以它们之间唯一的通信只能通过 Port 进行，而且 Dart 中的消息传递也总是异步的。

Dart 中两种方式可以使用 `Future` 对象来进行异步编程

- 使用 `async` 和 `await` 关键字
- 使用 Future API

使用 `async` 和 `await` 编写代码非常简单，而且编写的代码看起来有点像同步代码，实际上是异步的。

```dart
// 导入io库，调用sleep函数
import 'dart:io';

// 模拟耗时操作，调用sleep函数睡眠2秒
doTask() async{
  await sleep(const Duration(seconds:2));
  return "Ok";
}

// 定义一个函数用于包装
test() async {
  var r = await doTask();
  print(r);
}

void main(){
  print("main start");
  test();
  print("main end");
}
```

运行结果：

```
main start
main end
Ok
```

在函数签名中加入 `async` 关键字，表示该函数异步执行，`await` 表示等待异步结果执行完成返回 `Future` 对象。但有一点需要注意，`await` 只能在 `async` 函数中出现，因此往往需要再定义一个 `async` 函数，用于包装。上述代码中 `test` 函数就是用于包装。

#### 19.多态

```
允许将子类类型和指针赋值给父类类型的指针，同一个函数调用会有不同的执行效果。
子类的实例赋值给父类的引用。
多态就是父类定义一个方法不去实现，让继承他的子类去实现，每个子类有不同的表现。
```

#### 20.mixins

![image-20201029213130295](C:\Users\here\AppData\Roaming\Typora\typora-user-images\image-20201029213130295.png)

![image-20201029213315132](C:\Users\here\AppData\Roaming\Typora\typora-user-images\image-20201029213315132.png)

#### 21.泛型

```
通俗理解：泛型就是解决类  接口  方法的复用性、以及对不特定数据类型的支持（类型校验）
```



# 2.Flutter

## 1.环境搭建

```
https://flutter.dev/docs/development/tools/sdk/releases
```

![image-20201030082756971](C:\Users\here\AppData\Roaming\Typora\typora-user-images\image-20201030082756971.png)

![image-20201030082937529](C:\Users\here\AppData\Roaming\Typora\typora-user-images\image-20201030082937529.png)

```
nox_adb.exe disconnect 127.0.0.1:62001
nox_adb.exe connect 127.0.0.1:62001
```

```
error: protocol fault (couldn't read status length): Connection reset by peer
```

在夜神模块器目录下运行 adb version

![img](https://img-blog.csdnimg.cn/20200812085747755.png)

在系统目录下运行 adb version

![img](https://img-blog.csdnimg.cn/20200812085812420.png)

两个版本不一致的原因导致

复制第二个图中的 adb.exe 名称改成 nox_adb.exe 考到夜神模块器目录下即可

## 2.目录结构

![image-20201030094152377](C:\Users\here\AppData\Roaming\Typora\typora-user-images\image-20201030094152377.png)

### 1.入口文件

![image-20201030095042856](C:\Users\here\AppData\Roaming\Typora\typora-user-images\image-20201030095042856.png)

### 2. StatelessWidget

![image-20201030103118851](C:\Users\here\AppData\Roaming\Typora\typora-user-images\image-20201030103118851.png)

## 3.图片组件

### 1.Image.asset 本地图片

```dart

```

错误：

![image-20201030152058218](C:\Users\here\AppData\Roaming\Typora\typora-user-images\image-20201030152058218.png)

```
Expected a key while parsing a block mapping.

解决：assets要与uses-material-design对齐
```

![image-20201030153202217](C:\Users\here\AppData\Roaming\Typora\typora-user-images\image-20201030153202217.png)

### 2.Image.network  远程图片

```dart
child: Image.network(
        // 'https://ae01.alicdn.com/kf/U8d1e2d69744d49e3bc1042e13d9d9633S.png',
        'https://ae01.alicdn.com/kf/Ue319b0ed05c544f6bd205bd5d71474c7J.jpg',
        // alignment: Alignment.bottomLeft,
        // color: Colors.yellow,
        // colorBlendMode: BlendMode.luminosity,
        fit: BoxFit.cover,
        // repeat: ImageRepeat.repeat,
      ),
```

### 3.圆角图片

```dart
borderRadius: BorderRadius.circular(200),
        image: DecorationImage(
          image: NetworkImage(
              'https://ae01.alicdn.com/kf/U8d1e2d69744d49e3bc1042e13d9d9633S.png'),
          fit: BoxFit.cover
        ),
```

```
child: ClipOval(
        child: Image.network(
          'https://ae01.alicdn.com/kf/Ue319b0ed05c544f6bd205bd5d71474c7J.jpg',
          fit: BoxFit.cover,
        ),
      ),
```

## 4.列表ListView

### 1.for循环

```dart
class HomeContent extends StatelessWidget {
  //自定义方法
  List<Widget> _getData() {
    List<Widget> list = new List();
    for (var i = 0; i < 40; i++) {
      list.add(ListTile(
        title: Text('我是第$i个列表'),
      ));
    }
    return list;
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: this._getData(),
    );
  }
}
```

### 2.builder

```dart
class HomeContent extends StatelessWidget {
  List list = new List();
  HomeContent() {
    for (var i = 0; i < 40; i++) {
      this.list.add('我是第$i个列表');
    }
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: this.list.length,
      itemBuilder: (context, index) {
        return ListTile(
          title: Text(this.list[index]),
        );
      },
    );
  }
}
```

```dart
引用外部数据
import 'res/listData.dart';

class HomeContent extends StatelessWidget {
  
  Widget _getListData(context, index) {
    return ListTile(
      leading: Image.network(listData[index]['imageUrl']),
      title: Text(listData[index]['title']),
      subtitle: Text(listData[index]['author']),
    );
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: listData.length, itemBuilder: this._getListData);
  }
}
```

## 5.网格布局GridView

### 1.GridView.count

```dart
class HomeContent extends StatelessWidget {
  List<Widget> _getListData() {
    List<Widget> list = new List();
    for (var i = 0; i < 30; i++) {
      list.add(Container(
        alignment: Alignment.center,
        child: Text(
          '这是第$i条数据',
          style: TextStyle(color: Colors.white, fontSize: 20),
        ),
        color: Colors.blue,
      ));
    }
    return list;
  }

  @override
  Widget build(BuildContext context) {
    return GridView.count(
        crossAxisCount: 3,//一行的wedget数量
        crossAxisSpacing: 20,//水平子Widget之间间距
        mainAxisSpacing: 20,//垂直子Widget之间间距
        padding: EdgeInsets.all(15),
        childAspectRatio: 0.7, //调整宽高比
        children: this._getListData());
  }
}

```

### 2.GridView.build

```dart
class HomeContent extends StatelessWidget {
  Widget _getListData(context, index) {
    return Container(
      child: Column(
        children: <Widget>[
          Image.network(
            listData[index]['imageUrl'],
            fit: BoxFit.cover,
          ),
          SizedBox(
            height: 12,
          ),
          Text(
            listData[index]['title'],
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 20),
          )
        ],
      ),
      decoration: BoxDecoration(
          border:
              Border.all(color: Color.fromRGBO(233, 233, 233, 0.9), width: 1)),
    );
  }

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisSpacing: 10, mainAxisSpacing: 10, crossAxisCount: 2),
      itemCount: listData.length,
      itemBuilder: this._getListData,
    );
  }
}
```

## 6.padding组件

```dart
children: <Widget>[
        Padding(
          // padding: EdgeInsets.fromLTRB(10, 10, 0, 0),
          padding: EdgeInsets.all(10),
          child: Image.network('https://www.itying.com/images/flutter/1.png',
              fit: BoxFit.cover),
        ),
```

## 7.Row

```dart
class HomeContent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 400.0,
      height: 800.0,
      color: Colors.pink,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          IconCotainer(
            Icons.home,
            color: Colors.red,
          ),
          IconCotainer(
            Icons.search,
            color: Colors.orange,
          ),
          IconCotainer(
            Icons.select_all,
            color: Colors.blue,
          ),
        ],
      ),
    );
  }
}

class IconCotainer extends StatelessWidget {
  double size = 32.0;
  Color color = Colors.red;
  IconData icon;

  IconCotainer(this.icon, {this.size, this.color});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100.0,
      width: 100.0,
      color: this.color,
      child: Center(
        child: Icon(
          this.icon,
          size: this.size,
          color: Colors.white,
        ),
      ),
    );
  }
}
```

## 8.Column

```dart
 child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
```

## 9.Expanded

```
class HomeContent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        Expanded(
          flex: 1,
          child: IconCotainer(
            Icons.home,
            color: Colors.red,
          ),
        ),
        Expanded(
          flex: 2,
          child: IconCotainer(
            Icons.search,
            color: Colors.blue,
          ),
        ),
        Expanded(
          flex: 1,
          child: IconCotainer(
            Icons.pedal_bike,
            color: Colors.orange,
          ),
        ),
      ],
    );
  }
}
```

## 10.Stack布局

### 1.Align

```dart
class HomeContent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        height: 300,
        width: 300,
        color: Colors.red,
        child: Stack(
          // alignment: Alignment.center,
          children: <Widget>[
            Align(
              alignment: Alignment.topLeft,
              child: Icon(
                Icons.hail,
                size: 40,
                color: Colors.white,
              ),
            ),
            Align(
              alignment: Alignment.center,
              child: Icon(
                Icons.search,
                size: 60,
                color: Colors.orange,
              ),
            ),
            Align(
              alignment: Alignment(1, 0.5),
              child: Icon(
                Icons.send,
                size: 30,
                color: Colors.green,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
```

### 2.Positioned 绝对布局

```
class HomeContent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        height: 300,
        width: 300,
        color: Colors.red,
        child: Stack(
          // alignment: Alignment.center,
          children: <Widget>[
            Positioned(
              left: 10,
               top: 10,
              child: Icon(
                Icons.hail,
                size: 40,
                color: Colors.white,
              ),
            ),
            Positioned(
              bottom: 0,
              child: Icon(
                Icons.search,
                size: 60,
                color: Colors.orange,
              ),
            ),
            Positioned(
              right: 10,
              child: Icon(
                Icons.send,
                size: 30,
                color: Colors.green,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
```

## 11.AspectRatio宽高比

```dart
class HomeContent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 2.0 / 1.0,
      child: Container(
        color: Colors.blue,
      ),
    );
  }
}
```

## 12.Card组件

```
class HomeContent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: <Widget>[
        Card(
          margin: EdgeInsets.all(10),
          child: Column(
            children: <Widget>[
              ListTile(
                title: Text(
                  '张三',
                  style: TextStyle(fontSize: 28),
                ),
                subtitle: Text('前端开发工程师'),
              ),
              ListTile(
                  title: Text(
                '电话：12345678922',
              )),
              ListTile(
                  title: Text(
                '地址：江西省南昌市南昌航空大学',
              )),
            ],
          ),
        ),
        ],
    );
  }
}
```

```
class HomeContent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: <Widget>[
        Card(
          margin: EdgeInsets.all(10),
          child: Column(
            children: <Widget>[
              AspectRatio(
                aspectRatio: 20 / 9,
                child: Image.network(
                  'https://www.itying.com/images/flutter/4.png',
                  fit: BoxFit.cover,
                ),
              ),
              ListTile(
                leading: CircleAvatar(
                  backgroundImage: NetworkImage(
                    'https://ae01.alicdn.com/kf/U1d9e27cbda65498bbc365ff81328bb92d.jpg',
                  ),
                ),
                title: Text(
                  '李沁',
                  style: TextStyle(fontSize: 20),
                ),
                subtitle: Text('前端开发工程师'),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
```

```dart
class HomeContent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView(
        children: listData.map((e) {
      return Card(
        margin: EdgeInsets.all(10),
        child: Column(
          children: <Widget>[
            AspectRatio(
              aspectRatio: 16 / 9,
              child: Image.network(
                e['imageUrl'],
                fit: BoxFit.cover,
              ),
            ),
            ListTile(
              leading: CircleAvatar(
                backgroundImage: NetworkImage(
                  e['imageUrl'],
                ),
              ),
              title: Text(
                e['title'],
                style: TextStyle(fontSize: 20),
              ),
              subtitle: Text(
                e['author'],
                maxLines: 2,
                // overflow: TextOverflow.ellipsis,
              ),
            ),
          ],
        ),
      );
    }).toList());
  }
}
```

## 13.Wrap组件

### 1.button

```dart
class HomeContent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 800,
      width: 400,
      color: Colors.pink,
      child: Wrap(
        spacing: 10,
        runSpacing: 15,
        // direction: Axis.vertical,//纵向显示
        runAlignment: WrapAlignment.center,
        // alignment: WrapAlignment.spaceEvenly,
        children: <Widget>[
          MyButton('第1集'),
          MyButton('第2集'),
          MyButton('第3集'),
          MyButton('第4集'),
          MyButton('第5集'),
          MyButton('第6集'),
          MyButton('第7集'),
          MyButton('第8集'),
          MyButton('第9集'),
          MyButton('第10集'),
          MyButton('第11集'),
          MyButton('第12集'),
          MyButton('第13集'),
        ],
      ),
    );
  }
}

class MyButton extends StatelessWidget {
  final String text;
  const MyButton(this.text, {Key key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return RaisedButton(
      child: Text(this.text),
      // textColor: Theme.of(context).accentColor,
      textColor: Colors.blue,
      onPressed: () {},
    );
  }
}
```

## 14.StatefulWidget 有状态组件

改变页面中的数据

```dart
class HomeContent extends StatefulWidget {
  HomeContent({Key key}) : super(key: key);

  @override
  _HomeContentState createState() => _HomeContentState();
}

class _HomeContentState extends State<HomeContent> {
  int countNum = 0;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        SizedBox(
          height: 200,
        ),
        Chip(label: Text('${this.countNum}')),
        SizedBox(
          height: 20,
        ),
        RaisedButton(
            child: Text('按钮'),
            onPressed: () {
              setState(() {
                this.countNum++;
              });
            })
      ],
    );
  }
}
```

```dart
class HomeContent extends StatefulWidget {
  HomeContent({Key key}) : super(key: key);

  @override
  _HomeContentState createState() => _HomeContentState();
}

class _HomeContentState extends State<HomeContent> {
  // int countNum = 0;
  List list = new List();
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: <Widget>[
        Column(
          children: <Widget>[
            Column(
              children: this.list.map((e) {
                return ListTile(
                  title: Text(e),
                );
              }).toList(),
            ),
          ],
        ),
        SizedBox(
          height: 20,
        ),
        RaisedButton(
            child: Text('按钮'),
            onPressed: () {
              setState(() {
                this.list.add('新增数据1');
                this.list.add('新增数据2');
              });
            })
      ],
    );
  }
}
```

## 15.底部导航栏 bottomNavigationBar

![image-20201102093337823](C:\Users\here\AppData\Roaming\Typora\typora-user-images\image-20201102093337823.png)

```dart
 bottomNavigationBar: BottomNavigationBar(items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), title: Text('首页')),
          BottomNavigationBarItem(
              icon: Icon(Icons.category), title: Text('分离')),
          BottomNavigationBarItem(
              icon: Icon(Icons.settings_ethernet), title: Text('设置')),
        ]),
```

## 16.路由

### 1.普通路由

```dart
RaisedButton(
    child:Text('跳转到搜索界面'),
    onPress:(){
      Navigator.of(context).push(MaterialPageRoute(builder: (context) => searchPage(),));
    }
  )
```

```dart
 Navigator.of(context).pop();//返回上一个页面
```

### 2.命名路由

```dart
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Tabs(),
      routes: {
        '/form': (context) => FormPage(),
        '/search': (context) => SearchPage()
      },
      theme: ThemeData(primarySwatch: Colors.green),
    );
  }
}
```

```dart

Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            RaisedButton(
              child: Text('跳转到搜索页面'),
              onPressed: () {
                Navigator.pushNamed(context, '/search');
              },
              color: Theme.of(context).accentColor,
              textTheme: ButtonTextTheme.primary,
            )
          ],
        )
```

### 3.传参

main->home->search

```dart
class MyApp extends StatelessWidget {
  final routes = {
    '/form': (context) => FormPage(),
    '/search': (context, {arguments}) => SearchPage(arguments: arguments)
  };

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Tabs(),
      onGenerateRoute: (RouteSettings settings) {
        //统一处理
        final String name = settings.name;
        final Function pageContentBuilder = this.routes[name];
        if (pageContentBuilder != null) {
          if (settings.arguments != null) {
            final Route route = MaterialPageRoute(
                builder: (context) =>
                    pageContentBuilder(context, arguments: settings.arguments));
            return route;
          } else {
            final Route route = MaterialPageRoute(
                builder: (context) => pageContentBuilder(context));
            return route;
          }
        }
      },
      theme: ThemeData(primarySwatch: Colors.green),
    );
  }
}
```

```dart
RaisedButton(
              child: Text('跳转到搜索页面'),
              onPressed: () {
                Navigator.pushNamed(context, '/search', arguments: {'id': 123});
              },
              color: Theme.of(context).accentColor,
              textTheme: ButtonTextTheme.primary,
            )
```

```dart
class SearchPage extends StatelessWidget {
  // const SearchPage({Key key}) : super(key: key);
  final arguments;
  SearchPage({this.arguments});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('搜索页面'),
      ),
      body: Text('${arguments != null ? arguments['id'] : '0'}'),
    );
  }
}
```

### 4.pushNamedAndRemoveUntil

如果删除所有路由，只保存 D：

```dart
Navigator.of(context).pushNamedAndRemoveUntil('/D', (Route route)=>false);
```

![image-20201123112511738](C:\Users\here\AppData\Roaming\Typora\typora-user-images\image-20201123112511738.png)

### 5.popuntil

```
有如下场景，在入职新公司的时候，需要填写各种信息，这些信息分为不同部分，比如基本信息、工作信息、家庭信息等，这些不同模块在不同页面，填写信息时可以返回上一页，也可以取消，取消返回到首页，此场景可以使用 popUntil，一直 pop 到指定的页面。

有 A、B、C、D 四个页面，D 页面通过 popUntil 一直返回到 A 页面，D 页面代码：
```

```dart
RaisedButton(
  child: Text('D 页面'),
  onPressed: () {
    Navigator.of(context).popUntil(ModalRoute.withName('/A'));
  },
)
```

![image-20201123112716842](C:\Users\here\AppData\Roaming\Typora\typora-user-images\image-20201123112716842.png)

### 6.监听路由堆栈

```dart
class MyRouteObserver<R extends Route<dynamic>> extends RouteObserver<R> {
  @override
  void didPush(Route route, Route previousRoute) {
    super.didPush(route, previousRoute);
    print('didPush route: $route,previousRoute:$previousRoute');
  }

  @override
  void didPop(Route route, Route previousRoute) {
    super.didPop(route, previousRoute);
    print('didPop route: $route,previousRoute:$previousRoute');
  }

  @override
  void didReplace({Route newRoute, Route oldRoute}) {
    super.didReplace(newRoute: newRoute, oldRoute: oldRoute);
    print('didReplace newRoute: $newRoute,oldRoute:$oldRoute');
  }

  @override
  void didRemove(Route route, Route previousRoute) {
    super.didRemove(route, previousRoute);
    print('didRemove route: $route,previousRoute:$previousRoute');
  }

  @override
  void didStartUserGesture(Route route, Route previousRoute) {
    super.didStartUserGesture(route, previousRoute);
    print('didStartUserGesture route: $route,previousRoute:$previousRoute');
  }

  @override
  void didStopUserGesture() {
    super.didStopUserGesture();
    print('didStopUserGesture');
  }
}
```

```dart
使用
void main() {
  runApp(MyApp());
}

MyRouteObserver<PageRoute> myRouteObserver = MyRouteObserver<PageRoute>();

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      navigatorObservers: [myRouteObserver],
      initialRoute: '/A',
      home: APage(),
    );
  }
}
```

```

```



## 17.AppBar

### 1.DefaultTabController

![image-20201102225945065](C:\Users\here\AppData\Roaming\Typora\typora-user-images\image-20201102225945065.png)

```dart
class _CategoryPageState extends State<CategoryPage> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 4,
        child: Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.blue,
            title: Row(
              children: <Widget>[
                Expanded(
                  child: TabBar(
                    indicatorColor: Colors.pink,
                    labelColor: Colors.pink,
                    labelStyle: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                    ),
                    indicatorSize: TabBarIndicatorSize.label,
                    unselectedLabelColor: Colors.white,
                    tabs: <Widget>[
                      Tab(
                        text: '热门',
                      ),
                      Tab(
                        text: '推荐',
                      ),
                      Tab(
                        text: '哈哈',
                      ),
                      Tab(
                        text: '同城',
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
          body: TabBarView(
            children: <Widget>[
                4个组件
```

#### 2.自定义TabController

```dart
class _TabBarControllerPageState extends State<TabBarControllerPage>
    with SingleTickerProviderStateMixin {
  TabController _tabController;
  @override
  void initState() {
    //生命周期函数
    super.initState();
    _tabController = new TabController(length: 2, vsync: this);
    _tabController.addListener(() {
      print(_tabController.index);
      print(_tabController.previousIndex);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('TabBarControllerPage'),
        bottom: TabBar(
          //注意加上这一句
          controller: this._tabController,
          tabs: <Widget>[
            Tab(
              text: '热门',
            ),
            Tab(
              text: '推荐',
            ),
          ],
        ),
      ),
      body: TabBarView(
        //注意加上这一句
        controller: this._tabController,
        children: [
            两个组件
```

## 18.Drawer抽屉组件

```dart
drawer: Drawer(
        child: Column(
          children: <Widget>[
            Row(
              children: [
                Expanded(
                  child: DrawerHeader(
                    child: Text(''),
                    decoration: BoxDecoration(
                        color: Colors.blue,
                        image: DecorationImage(
                            image: NetworkImage(
                                'https://www.itying.com/images/flutter/2.png'),
                            fit: BoxFit.cover)),
                  ),
                )
              ],
            ),
            ListTile(
              leading: CircleAvatar(
                child: Icon(Icons.home),
              ),
              title: Text('我的空间'),
            ),
            Divider(),
            ListTile(
              leading: CircleAvatar(
                child: Icon(Icons.people),
              ),
              title: Text('个人中心'),
            ),
            Divider(),
            ListTile(
              leading: CircleAvatar(
                child: Icon(Icons.settings),
              ),
              title: Text('设置中心'),
            ),
            Divider(),
          ],
        ),
      ),
      endDrawer: Drawer(
        child: Text('右侧侧边栏'),
      ),
```

![image-20201103081834951](C:\Users\here\AppData\Roaming\Typora\typora-user-images\image-20201103081834951.png)

```dart
child: UserAccountsDrawerHeader(
                    accountEmail: Text('williamz73@foxmail.com'),
                    accountName: Text('周文林'),
                    currentAccountPicture: CircleAvatar(
                      backgroundImage: NetworkImage(
                          'https://www.itying.com/images/flutter/5.png'),
                    ),
                    decoration: BoxDecoration(
                        color: Colors.blue,
                        image: DecorationImage(
                            image: NetworkImage(
                                'https://www.itying.com/images/flutter/2.png'),
                            fit: BoxFit.cover)),
                    otherAccountsPictures: [
                      //最多显示三张图片
                      Image.network(
                          'https://ae01.alicdn.com/kf/U1d9e27cbda65498bbc365ff81328bb92d.jpg'),
                      Image.network(
                          'https://ae01.alicdn.com/kf/Uc75de1d59d1448a3abed7adfe4df9297t.png'),
                      Image.network(
                          'https://ae01.alicdn.com/kf/U90d8122435a64a7c8acc9a33a765ea27m.jpg'),
                      Image.network(
                          'https://www.itying.com/images/flutter/6.png'),
                    ],
                  ),
```

```dart
ListTile(
              leading: CircleAvatar(
                child: Icon(Icons.people),
              ),
              title: Text('个人中心'),
              onTap: () {
                Navigator.of(context).pop(); //返回时隐藏侧边栏
                Navigator.pushNamed(context, '/user');
              },
            ),
```

## 19.按钮组件

![image-20201103084852841](C:\Users\here\AppData\Roaming\Typora\typora-user-images\image-20201103084852841.png)

![image-20201103085816991](C:\Users\here\AppData\Roaming\Typora\typora-user-images\image-20201103085816991.png)

![image-20201103093533348](C:\Users\here\AppData\Roaming\Typora\typora-user-images\image-20201103093533348.png)

### 2.自定义按钮

```dart
//自定义按钮组件
class MyButton extends StatelessWidget {
  final text;
  final pressd;
  final double width;
  final double heigth;
  const MyButton(
      {this.text = '',
      this.pressd = null,
      this.width = 100.0,
      this.heigth = 40.0});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: this.heigth,
      width: this.width,
      child: RaisedButton(
        onPressed: this.pressd,
        child: Text(this.text),
        color: Colors.blue,
        textColor: Colors.white,
        elevation: 20,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      ),
    );
  }
}
调用：
 MyButton(
                    text: '自定义按钮',
                    heigth: 40.0,
                    width: 100.0,
                    pressd: () {
                      print('自定义按钮');
                    },
                  )
```

### 3.浮动按钮

![image-20201103104213038](C:\Users\here\AppData\Roaming\Typora\typora-user-images\image-20201103104213038.png)

```dart
floatingActionButton: Container(
        height: 70,
        width: 70,
        padding: EdgeInsets.all(7),
        margin: EdgeInsets.only(top: 10),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(40), color: Colors.white),
        child: FloatingActionButton(
          onPressed: () {
            print('floatingActionButton tabs');
            setState(() {
              this._currentIndex = 2;
            });
          },
          child: Icon(
            Icons.add,
            color: Colors.white,
            size: 40,
          ),
          backgroundColor: this._currentIndex == 2 ? Colors.blue : Colors.green,
          // elevation: 20,
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
```



## 20.表单组件

### 1.TextField

![image-20201103112319066](C:\Users\here\AppData\Roaming\Typora\typora-user-images\image-20201103112319066.png)

![image-20201103145255489](C:\Users\here\AppData\Roaming\Typora\typora-user-images\image-20201103145255489.png)

```dart
class _TextFieldDemoPageState extends State<TextFieldDemoPage> {
  //初始化时给表单赋值可以用 TextEditingController
  var _userName = new TextEditingController();
  var _password;
  @override
  void initState() {
    super.initState();
    _userName.text = '初始值周文林';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('表单演示页面'),
      ),
      body: Padding(
        padding: EdgeInsets.all(20),
        // child: TextDemo(),
        child: Column(
          children: <Widget>[
            TextField(
              controller: _userName,
              decoration: InputDecoration(
                  icon: Icon(Icons.people),
                  labelText: '用户名',
                  hintText: '请输入用户名',
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15))),
              onChanged: (value) {
                setState(() {
                  this._userName.text = value;
                });
              },
            ),
            SizedBox(
              height: 10,
            ),
            TextField(
              // controller: _password,
              obscureText: true,
              onChanged: (value) {
                setState(() {
                  this._password = value;
                });
              },
              decoration: InputDecoration(
                  icon: Icon(Icons.paste_sharp),
                  labelText: '密码',
                  hintText: '请输入密码',
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15))),
            ),
            SizedBox(
              height: 20,
            ),
            Container(
              height: 50,
              width: 170,
              child: RaisedButton(
                onPressed: () {
                  print('用户名：' + this._userName.text);
                  print('密码：' + this._password);
                },
                child: Text('登录'),
                color: Colors.blue,
                textColor: Colors.white,
                elevation: 20,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20)),
              ),
            )
          ],
        ),
      ),
    );
  }
}
```



### 2.CheckBox

![image-20201103153305287](C:\Users\here\AppData\Roaming\Typora\typora-user-images\image-20201103153305287.png)

```dart
class _CheckBoxDemoState extends State<CheckBoxDemo> {
  var flag = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('多选框'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Row(
            children: <Widget>[
              Checkbox(
                  value: this.flag,
                  onChanged: (value) {
                    setState(() {
                      this.flag = value;
                    });
                  })
            ],
          ),
          Row(
            children: <Widget>[Text(this.flag ? '选中' : '未选中')],
          )
        ],
      ),
    );
  }
}
```

3.CheckBoxListTile

![image-20201103154153543](C:\Users\here\AppData\Roaming\Typora\typora-user-images\image-20201103154153543.png)

### 4.错误

```
The following NoSuchMethodError was thrown while handling a gesture:The getter 'text' was called on null.

未在初始化函数中定义 _userName.text

@override
  void initState() {
    super.initState();
    _userName.text = '初始值周文林';
  }
```

```
Failed assertion: line 1895 pos 14: 'children !=
I/flutter (28909): null': is not true.

忘记写return 语句

return tempList;
```

## 21.日期组件

### 1.官方

![image-20201104102421124](C:\Users\here\AppData\Roaming\Typora\typora-user-images\image-20201104102421124.png)

```dart
var now = DateTime.now();
  @override
  void initState() {
    super.initState();
    print(now);
    print(now.microsecondsSinceEpoch);
    print(now.millisecondsSinceEpoch);
    // print(DateTime.fromMillisecondsSinceEpoch(millisecondsSinceEpoch));
  }
```

### 2.第三方库data_format

```
https://pub.dev/packages/date_format/install
```

```
dependencies:
  date_format: ^1.0.9
```

```dart
print(formatDate(DateTime.now(),
        [yyyy, '年', mm, '月', dd, '日', HH, '时', nn, '分', ss, '秒']));
```

### 3.调用flutter自带的日期组件和时间组件

```dart
class _DatePickerDemoState extends State<DatePickerDemo> {
  var _nowDate = DateTime.now();
  var _nowTime = TimeOfDay(hour: 12, minute: 20);
  _showDatePicker() async {
    //方法1
    // showDatePicker(
    //         context: context,
    //         initialDate: _nowDate,
    //         firstDate: DateTime(1980),
    //         lastDate: DateTime(2100))
    //     .then((value) => print(value));

    //方法2
    var result = await showDatePicker(
        context: context,
        initialDate: _nowDate,
        firstDate: DateTime(1980),
        lastDate: DateTime(2100));
    print(result);
    setState(() {
      this._nowDate = result;
    });
  }

  _showTimePicker() {
    showTimePicker(context: context, initialTime: _nowTime).then((value) {
      setState(() {
        this._nowTime = value;
      });
    });
  }

  @override
  void initState() {
    super.initState();
    var now = DateTime.now();
    print(now);
    print(now.microsecondsSinceEpoch);
    print(now.millisecondsSinceEpoch);
    // print(DateTime.fromMillisecondsSinceEpoch(millisecondsSinceEpoch));
    print(formatDate(DateTime.now(),
        [yyyy, '年', mm, '月', dd, '日', HH, '时', nn, '分', ss, '秒']));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('DatePickerDemo'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(mainAxisAlignment: MainAxisAlignment.center, children: <Widget>[
            InkWell(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                      '${formatDate(_nowDate, [yyyy, '年', mm, '月', dd, '日'])}'),
                  Icon(Icons.arrow_drop_down)
                ],
              ),
              onTap: _showDatePicker,
            ),
            InkWell(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('${_nowTime.format(context)}'),
                  Icon(Icons.arrow_drop_down)
                ],
              ),
              onTap: _showTimePicker,
            ),
          ])
        ],
      ),
    );
  }
}
```

### 4.组件汉化

![image-20201104143800541](C:\Users\here\AppData\Roaming\Typora\typora-user-images\image-20201104143800541.png)

```
flutter_localizations:

  sdk: flutter
  
import 'package:flutter_localizations/flutter_localizations.dart';

```

![image-20201104143853114](C:\Users\here\AppData\Roaming\Typora\typora-user-images\image-20201104143853114.png)

```
localizationsDelegates: [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate
      ],
      supportedLocales: [
        const Locale('zh','CH'),
        const Locale('en','US'),
      ],
```

![image-20201104144457248](C:\Users\here\AppData\Roaming\Typora\typora-user-images\image-20201104144457248.png)

### 5.Flutter Cupertino Date Picker

```
https://pub.dev/packages/flutter_cupertino_date_picker
```

```
/*
 * @Author: William-Zhou
 * @Date: 2020-11-04 10:26:20
 * @LastEditTime: 2020-11-04 21:53:46
 * @LastEditors: William-Zhou
 * @Description: 
 */
import 'package:flutter/material.dart';
import 'package:date_format/date_format.dart';
import 'package:flutter_cupertino_date_picker/flutter_cupertino_date_picker.dart';

class DatePickerPubDemo extends StatefulWidget {
  @override
  _DatePickerPubDemoState createState() => _DatePickerPubDemoState();
}

class _DatePickerPubDemoState extends State<DatePickerPubDemo> {
  DateTime _dateTime = DateTime.now();
  _showDatePicker() async {
    DatePicker.showDatePicker(
      context,
      onMonthChangeStartWithFirstDate: true,
      pickerTheme: DateTimePickerTheme(
        showTitle: true,
        confirm: Text('确定', style: TextStyle(color: Colors.red)),
        cancel: Text('取消', style: TextStyle(color: Colors.cyan)),
      ),
      minDateTime: DateTime.parse('1980-01-01'),
      maxDateTime: DateTime.parse('2121-01-01'),
      initialDateTime: _dateTime,
      // dateFormat: 'yyyy-MMMM-dd',
      //显示时分
      dateFormat: 'M月d日 EEE,H时:m分',
      pickerMode: DateTimePickerMode.datetime,

      locale: DateTimePickerLocale.zh_cn,
      onClose: () => print("----- onClose -----"),
      onCancel: () => print('onCancel'),
      onConfirm: (dateTime, List<int> index) {
        setState(() {
          _dateTime = dateTime;
        });
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('DatePickerDemo'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(mainAxisAlignment: MainAxisAlignment.center, children: <Widget>[
            InkWell(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('${formatDate(_dateTime, [
                    yyyy,
                    '年',
                    mm,
                    '月',
                    dd,
                    '日',
                    HH,
                    '时',
                    nn,
                    '分',
                    ss,
                    '秒'
                  ])}'),
                  Icon(Icons.arrow_drop_down)
                ],
              ),
              onTap: _showDatePicker,
            ),
          ])
        ],
      ),
    );
  }
}

```



### 6.错误

```
Error: Type 'DiagnosticableMixin' not found.

flutter1.20.0+以上DiagnosticableMixin 被移除了。需要到库的对应文件将 DiagnosticableMixin 替换为 Diagnosticable
```

![image-20201104211903190](C:\Users\here\AppData\Roaming\Typora\typora-user-images\image-20201104211903190.png)

![image-20201104211948081](C:\Users\here\AppData\Roaming\Typora\typora-user-images\image-20201104211948081.png)



![image-20201104212503375](C:\Users\here\Desktop\image-20201104212503375.png)

## 22.轮播图组件

```
https://pub.dev/packages/flutter_swiper/install
```

```dart
/*
 * @Author: William-Zhou
 * @Date: 2020-11-04 21:59:07
 * @LastEditTime: 2020-11-04 22:25:36
 * @LastEditors: William-Zhou
 * @Description: 
 */
import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';

class SwiperPage extends StatefulWidget {
  @override
  _SwiperPageState createState() => _SwiperPageState();
}

class _SwiperPageState extends State<SwiperPage> {
  List<Map> imgList = [
    {'url': 'https://www.itying.com/images/flutter/4.png'},
    {'url': 'https://www.itying.com/images/flutter/5.png'},
    {'url': 'https://www.itying.com/images/flutter/6.png'},
    {'url': 'https://www.itying.com/images/flutter/7.png'},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text('轮播图页面'),
        ),
        body: Column(
          children: <Widget>[
            Container(
                //适配参数
                // width: double.infinity,
                child: AspectRatio(
              aspectRatio: 16 / 9,
              child: Swiper(
                itemBuilder: (BuildContext context, int index) {
                  return new Image.network(
                    imgList[index]['url'],
                    fit: BoxFit.fill,
                  );
                },
                itemCount: imgList.length,
                //自动轮播
                autoplay: true,
                loop: true,
                pagination: new SwiperPagination(),
                control: new SwiperControl(),
              ),
            )),
            Row(
              children: [Text('1111')],
            )
          ],
        ));
  }
}
```

## 23.Dialog提示框组件



```dart
/*
 * @Author: William-Zhou
 * @Date: 2020-11-05 08:32:00
 * @LastEditTime: 2020-11-05 09:31:22
 * @LastEditors: William-Zhou
 * @Description: 
 */

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class DialogPage extends StatefulWidget {
  @override
  _DialogPageState createState() => _DialogPageState();
}

class _DialogPageState extends State<DialogPage> {
  _alertDialog() async {
    var result = await showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text('提示信息'),
            content: Text('确定要删除吗'),
            actions: <Widget>[
              RaisedButton(
                onPressed: () {
                  print('取消');
                  Navigator.pop(context, 'Cancle');
                },
                child: Text('取消'),
                color: Colors.purple,
                textColor: Colors.white,
                elevation: 20,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20)),
              ),
              RaisedButton(
                onPressed: () {
                  print('确定');
                  Navigator.pop(context, 'OK');
                },
                child: Text('确定'),
                color: Colors.cyan,
                textColor: Colors.white,
                elevation: 20,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20)),
              ),
            ],
          );
        });
    print(result);
  }

  _simpleDialog() async {
    var result = await showDialog(
      context: context,
      builder: (context) {
        return SimpleDialog(
          title: Text('选择正确答案：'),
          children: [
            SimpleDialogOption(
              child: Text('选项A'),
              onPressed: () {
                print('选择了A！');
                Navigator.pop(context, 'A');
              },
            ),
            Divider(),
            SimpleDialogOption(
              child: Text('选项B'),
              onPressed: () {
                print('选择了B！');
                Navigator.pop(context, 'B');
              },
            ),
            Divider(),
            SimpleDialogOption(
              child: Text('选项C'),
              onPressed: () {
                print('选择了C！');
                Navigator.pop(context, 'C');
              },
            ),
            Divider(),
            SimpleDialogOption(
              child: Text('选项D'),
              onPressed: () {
                print('选择了D！');
                Navigator.pop(context, 'D');
              },
            ),
            Divider(),
            SimpleDialogOption(
              child: Text('选项E'),
              onPressed: () {
                print('选择了E！');
                Navigator.pop(context, 'E');
              },
            ),
          ],
        );
      },
    );
    print(result);
  }

  _modelBottomSheet() async {
    var actionSheet = await showModalBottomSheet(
        context: context,
        builder: (context) {
          return Container(
            height: 300,
            child: Column(
              children: [
                ListTile(
                  title: Text('分享 A'),
                  onTap: () {
                    print('分享了A！');
                    Navigator.pop(context, '分享 A');
                  },
                ),
                Divider(),
                ListTile(
                  title: Text('分享 B'),
                  onTap: () {
                    print('分享了B！');
                    Navigator.pop(context, '分享 B');
                  },
                ),
                Divider(),
                ListTile(
                  title: Text('分享 C'),
                  onTap: () {
                    print('分享了C！');
                    Navigator.pop(context, '分享 C');
                  },
                ),
                Divider(),
              ],
            ),
          );
        });
    print(actionSheet);
  }

  _toast() async {
    Fluttertoast.showToast(
        msg: "toast提示信息",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        // timeInSecForIosWeb: 3,//only for ios
        backgroundColor: Colors.blue,
        textColor: Colors.white,
        fontSize: 16.0);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Dialog页面'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            RaisedButton(
              onPressed: _alertDialog,
              child: Text('alter弹出框-AlterDialog'),
              color: Colors.cyan,
              textColor: Colors.white,
              elevation: 20,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20)),
            ),
            SizedBox(
              height: 30,
            ),
            RaisedButton(
              onPressed: _simpleDialog,
              child: Text('select弹出框-SimpleDialog'),
              color: Colors.blue,
              textColor: Colors.white,
              elevation: 20,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20)),
            ),
            SizedBox(
              height: 30,
            ),
            RaisedButton(
              onPressed: _modelBottomSheet,
              child: Text('ActionSheet弹出框'),
              color: Colors.purple,
              textColor: Colors.white,
              elevation: 20,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20)),
            ),
            SizedBox(
              height: 30,
            ),
            RaisedButton(
              onPressed: _toast,
              child: Text('toast弹出框-第三方库'),
              color: Colors.pink,
              textColor: Colors.white,
              elevation: 20,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20)),
            ),
          ],
        ),
      ),
    );
  }
}

```



### 4.showToast

```
https://pub.dev/packages/fluttertoast
```

### 5.自定义Dialog组件



### 6.定时器

![image-20201105111348825](C:\Users\here\AppData\Roaming\Typora\typora-user-images\image-20201105111348825.png)

## 24.Json字符串和Map类型的转换

![image-20201105135429867](C:\Users\here\AppData\Roaming\Typora\typora-user-images\image-20201105135429867.png)

```dart
Map userInfo = {
      'userName': '周文林',
      'age': 21,
    };
    print(json.encode(userInfo)); // Map=>Json

    String userInfo2 = "{'userName': '周文林','age': 21,}";
    Map u = json.decode(userInfo2);
    print(u['userName']);  // Json=>Map
```

## 25.网络数据请求

```dart
/*
 * @Author: William-Zhou
 * @Date: 2020-11-05 14:29:59
 * @LastEditTime: 2020-11-05 21:39:29
 * @LastEditors: William-Zhou
 * @Description: 
 */
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class HttpDemo extends StatefulWidget {
  @override
  _HttpDemoState createState() => _HttpDemoState();
}

class _HttpDemoState extends State<HttpDemo> {
  List _list = [];
  @override
  void initState() {
    super.initState();
    this._getData();
  }

  _getData() async {
    var apiUrl = 'http://a.itying.com/api/productlist';
    var result = await http.get(apiUrl);

    if (result.statusCode == 200) {
      print(result.body);
      setState(() {
        this._list = json.decode(result.body)['result'];
      });
    } else {
      print('失败${result.statusCode}');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('请求数据Demo'),
        centerTitle: true,
      ),
      body: this._list.length > 0
          ? ListView(
              children: this._list.map((e) {
                return ListTile(
                  title: Text(e['title']),
                );
              }).toList(),
            )
          : Text('加载中...'),
    );
  }
}

```

### 2.ListView渲染方式2   builder

```dart
body: this._list.length > 0
          ? ListView.builder(
              itemCount: this._list.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text('${this._list[index]['title']}'),
                );
              })
          : Text('加载中...'),
```

## 26.Dio库实现网络请求以及动态渲染数据

```
https://pub.dev/packages/dio/install
```

```dart
/*
 * @Author: William-Zhou
 * @Date: 2020-11-05 22:17:47
 * @LastEditTime: 2020-11-05 23:20:00
 * @LastEditors: William-Zhou
 * @Description: 
 */
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:dio/dio.dart';

class DioDemoPage extends StatefulWidget {
  @override
  _DioDemoPageState createState() => _DioDemoPageState();
}

class _DioDemoPageState extends State<DioDemoPage> {
  List _list = [];

  @override
  void initState() {
    super.initState();
    this._getData();
  }

  _getData() async {
    var apiUrl =
        'http://www.phonegap100.com/appapi.php?a=getPortalList&catid=20&page=1';
    Response result = await Dio().get(apiUrl);
    // print(json.decode(result.data)['result']);
    setState(() {
      this._list = json.decode(result.data)['result'];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Dio请求数据Demo'),
        centerTitle: true,
      ),
      body: this._list.length > 0
          ? ListView.builder(
              itemCount: this._list.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text('${this._list[index]['title']}'),
                );
              })
          : Text('加载中...'),
    );
  }
}

```

## 27. Text文本组件

**Text 组件一定要包裹在 Scaffold 组件下**

设置文本大小和颜色：

```
Text('老孟',style: TextStyle(color: Colors.red,fontSize: 20),),
```

设置字体粗细：

```
Text('老孟',style: TextStyle(fontWeight: FontWeight.bold))
```

字体粗细共有 9 个级别，为 `w100`至 `w900`，**FontWeight.bold** 是 `w700`。

设置斜体：

```
Text('老孟',style: TextStyle(fontStyle: FontStyle.italic,))
```

### 设置自定义的字体：

1. 首先下载字体库（比如中华字体库）
2. 将字体文件拷贝的项目中，一般目录是：assets/fonts/，assets 和 fonts 都需要手动创建，此目录不是必须的，而是约定俗成，资源一般都放在 assets 目录下。
3. 配置 `pubspec.yaml`：

```
fonts:  - family: maobi     fonts:      - asset: assets/fonts/maobi.ttf
```

maobi：是自己对当前字体的命名，有意义即可。

asset：字体文件的目录。

使用：

```
Text('老孟', style: TextStyle(fontFamily: 'maobi',)),
```

设置对齐方式：

```dart
Container(  
    height: 100,  
    width: 200,  
    color: Colors.blue.withOpacity(.4),  
    child: Text('老孟', textAlign: TextAlign.center),
),
```

设置文本自动换行：

```
Container(  height: 100,  width: 200,  color: Colors.blue.withOpacity(.4),  
child: Text('老孟，专注分享Flutter技术和应用实战',softWrap: true,),)
```

文本超出范围时的处理：

```
Container(  height: 100,  width: 200,  color: Colors.blue.withOpacity(.4), 
child: Text('老孟，专注分享Flutter技术和应用实战',
overflow: TextOverflow.ellipsis,),)
```

溢出的处理方式：

- clip：直接裁剪。
- fade：越来越透明。
- ellipsis：省略号结尾。
- visible：依然显示，此时将会溢出父组件。

设置全局字体样式：

在 `MaterialApp`的 `theme`中设置如下

```dart
MaterialApp(  
title: 'Flutter Demo',  
theme: ThemeData(  
	...    
	textTheme: TextTheme(        
		bodyText2: TextStyle(color: Colors.red,fontSize: 24),)  
),  
home: Scaffold(    body: TextDemo(),  ),)
```

Text 组件默认为红色，

```
Text('老孟'),
Text('老孟',style: TextStyle(color: Colors.blue,fontSize: 20),),
```

### RichText

```dart
RichText(
  text: TextSpan(
      style: DefaultTextStyle.of(context).style,
      children: <InlineSpan>[
        TextSpan(text: '老孟', style: TextStyle(color: Colors.red)),
        TextSpan(text: '，'),
        TextSpan(text: '专注分享Flutter技术和应用实战'),
      ]),
)
```

### TextField

TextField 是文本输入组件，即输入框，常用组件之一。

`decoration`是 TextField 组件的装饰（外观）参数，类型是 InputDecoration。

`icon` 显示在输入框的前面，用法如下：

```dart
TextField(
  decoration: InputDecoration(
    icon: Icon(Icons.person),
  ),
)
```

当输入框是空而且没有焦点时，labelText 显示在输入框上边，当获取焦点或者不为空时 labelText 往上移动一点，`labelStyle`参数表示文本样式，具体参考 `TextStyle`， 用法如下：

```
TextField(
  decoration: InputDecoration(
    labelText: '姓名：',
    labelStyle: TextStyle(color:Colors.red)
  ),
)
```

`hasFloatingPlaceholder`参数控制当输入框获取焦点或者不为空时是否还显示 `labelText`，默认为 true，显示。

`helperText` 显示在输入框的左下部，用于提示用户，`helperStyle`参数表示文本样式，具体参考 `TextStyle`用法如下：

```
TextField(
  decoration: InputDecoration(
    helperText: '用户名长度为6-10个字母',
    helperStyle: TextStyle(color: Colors.blue),
    helperMaxLines: 1
  ),
)
```

`hintText` 是当输入框为空时的提示，不为空时不在显示，用法如下：

```

TextField(
  decoration: InputDecoration(
    hintText: '请输入用户名',
    hintStyle: TextStyle(color: Colors.grey),
    hintMaxLines: 1
  ),
)
```

`errorText`显示在输入框的左下部，默认字体为红色，用法如下：

```

TextField(
  decoration: InputDecoration(
    errorText: '用户名输入错误',
    errorStyle: TextStyle(fontSize: 12),
    errorMaxLines: 1,
    errorBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.red)),
  ),
)
```

`prefix` 系列的组件是输入框前面的部分，用法如下：

```

TextField(
  decoration: InputDecoration(
    prefixIcon: Icon(Icons.person)
  ),
)
```

注意 prefix 和 icon 的区别，icon 是在输入框边框的外部，而 prefix 在里面。

suffix 和 prefix 相反，suffix 在输入框的尾部，用法如下：

```

TextField(
  decoration: InputDecoration(
      suffixIcon: Icon(Icons.person)
  ),
)
```

### counter 

`counter`组件统计输入框文字的个数，counter 仅仅是展示效果，不具备自动统计字数的功能， 自动统计字数代码如下：

```
var _textFieldValue = '';
TextField(
  onChanged: (value){
    setState(() {
      _textFieldValue = value;
    });
  },
  decoration: InputDecoration(
    counterText: '${_textFieldValue.length}/32'
  ),
)
```

### filled

`filled`为 true 时，输入框将会被 `fillColor`填充，仿 QQ 登录输入框代码如下：

```

Container(
  height: 60,
  width: 250,
  child: TextField(
    decoration: InputDecoration(
      fillColor: Color(0x30cccccc),
      filled: true,
      enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Color(0x00FF0000)),
          borderRadius: BorderRadius.all(Radius.circular(100))),
      hintText: 'QQ号/手机号/邮箱',
      focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Color(0x00000000)),
          borderRadius: BorderRadius.all(Radius.circular(100))),
    ),
  ),
)
```

![image-20201111142843753](C:\Users\here\AppData\Roaming\Typora\typora-user-images\image-20201111142843753.png)

### controller

`controller` 是输入框文本编辑的控制器，可以获取 TextField 的内容、设置 TextField 的内容，下面将输入的英文变为大写：

```

TextEditingController _controller;

@override
void initState() {
  super.initState();
  _controller = TextEditingController()
    ..addListener(() {
      //获取输入框的内容，变为大写
      _controller.text = _controller.text.toUpperCase();

    });
}

@override
Widget build(BuildContext context) {
  return TextField(
    controller: _controller,
  );
}

@override
dispose() {
  super.dispose();
  _controller.dispose();
}
```

有时输入框后面带有 “清除” 功能，需要 controller 来实现。如果需要 2 个 TextField 的内容进行同步，只需要给 2 个 TextField 设置同一个 controller 即可实现。

### keyboardType

`keyboardType`参数控制软键盘的类型，说明如下：

- text：通用键盘。
- multiline：当 TextField 为多行时（maxLines 设置大于 1），右下角的为 “换行” 按键。
- number：数字键盘。
- phone：手机键盘，比数字键盘多 "*" 和 "#"。
- datetime：在 ios 上和 text 一样，在 android 上出现数字键盘、":" 和 "-"。
- emailAddress：邮箱键盘，有 "@" 和 "." 按键。
- url：url 键盘，有 "/" 和 "." 按键。
- visiblePassword：既有字幕又有数字的键盘。

#### textInputAction

`textInputAction`参数控制软键盘右下角的按键，说明如下：

- none：android 上显示返回键，ios 不支持。
- unspecified：让操作系统自己决定哪个合适，一般情况下，android 显示 “完成” 或者 “返回”。
- done：android 显示代表 “完成” 的按钮，ios 显示 “Done”（中文：完成）。
- go：android 显示表达用户去向目的地的图标，比如向右的箭头，ios 显示 “Go”（中文：前往）。
- search：android 显示表达搜索的按钮，ios 显示 "Search"（中文：搜索）。
- send：android 显示表达发送意思的按钮，比如 “纸飞机” 按钮，ios 显示 "Send"（中文：发送）。
- next：android 显示表达 “前进” 的按钮，比如 “向右的箭头”,ios 显示 "Next"（中文：下一项）。
- previous：android 显示表达 “后退” 的按钮，比如 “向左的箭头”,ios 不支持。
- continueAction：android 不支持，ios 仅在 ios9.0 + 显示 "Continue"（中文：继续）。
- join：Android 和 ios 显示 "Join"（中文：加入）。
- route：android 不支持，ios 显示 "Route"（中文：路线）。
- emergencyCall：android 不支持，ios 显示 "Emergency Call"（中文：紧急电话）。
- newline：android 显示表达 “换行” 的按钮，ios 显示” 换行 “。

Android 上显示的按钮大部分是不确定的，比如 `next`有的显示向右的箭头，有的显示前进，这是因为各大厂商对 Android ROM 定制引发的。

#### textCapitalization

`textCapitalization`参数是配置键盘是大写还是小写，仅支持键盘模式为 `text`，其他模式下忽略此配置，说明如下：

- words：每一个单词的首字母大写。
- sentences：每一句话的首字母大写。
- characters：每个字母都大写
-  none：都小写

这里仅仅是控制软键盘是大写模式还是小写模式，你也可以切换大小写，系统并不会改变输入框内的内容。

#### textAlignVertical

`textAlignVertical`表示垂直方向的对齐方式，`textDirection`表示文本方向，用法如下：

```

TextField(
  textAlignVertical: TextAlignVertical.center,
  textDirection: TextDirection.rtl,
)
```

#### toolbarOptions

`toolbarOptions`表示长按时弹出的菜单，有 `copy`、`cut`、`paste`、`selectAll`，用法如下：

```

TextField(
  toolbarOptions: ToolbarOptions(
    copy: true,
    cut: true,
    paste: true,
    selectAll: true
  ),
)
```

### cursor

`cursor`表示光标，用法如下：

```

TextField(
  showCursor: true,
  cursorWidth: 3,
  cursorRadius: Radius.circular(10),
  cursorColor: Colors.red,
)
```

将输入框设置为密码框，只需 `obscureText`属性设置 true 即可，用法如下：

```
TextField(
  obscureText: true,
)
```

### inputFormatters

通过 `inputFormatters`可以限制用户输入的内容，比如只想让用户输入字符，设置如下：

```
TextField(
  inputFormatters: [
    WhitelistingTextInputFormatter(RegExp("[a-zA-Z]")),
  ],
)
```



### 回调

`onChanged`是当内容发生变化时回调，

`onSubmitted`是点击回车或者点击软键盘上的完成回调，

`onTap`点击输入框时回调，

```
TextField(
  onChanged: (value){
    print('onChanged:$value');
  },
  onEditingComplete: (){
    print('onEditingComplete');
  },
  
  onTap: (){
    print('onTap');
  },
)
```

### 字数统计

输入框右下角经常需要字数统计，除了使用上面介绍的方法外，还可以使用 `buildCounter`，建议使用此方法，用法如下：

```
TextField(
  maxLength: 100,
  buildCounter: (
    BuildContext context, {
    int currentLength,
    int maxLength,
    bool isFocused,
  }) {
    return Text(
      '$currentLength/$maxLength',
    );
  },
)
```

### 动态获取焦点 

```
FocusScope.of(context).requestFocus(_focusNode);
```

`_focusNode`为 TextField 的 focusNode：

```

_focusNode = FocusNode();

TextField(
  focusNode: _focusNode,
  ...
)
```

动态失去焦点

```
_focusNode.unfocus();
```

### 过渡颜色

```
// Builder组件是为了计算当前 Text 组件大小，生成 LinearGradient。
Builder(
  builder: (BuildContext context) {
    RenderBox box = context.findRenderObject();
    final Shader linearGradient = LinearGradient(
      colors: <Color>[Colors.purple, Colors.blue],
    ).createShader(
        Rect.fromLTWH(0.0, 0.0, box?.size?.width, box?.size?.height));

    return Text(
      '老孟，专注分享Flutter技术和应用实战',
      style: new TextStyle(
          fontSize: 18.0,
          fontWeight: FontWeight.bold,
          foreground: Paint()..shader = linearGradient),
    );
  },
)
```

![image-20201111144606748](C:\Users\here\AppData\Roaming\Typora\typora-user-images\image-20201111144606748.png)

### 前后置标签

```

RichText(
  text: TextSpan(
      style: DefaultTextStyle.of(context).style,
      children: <InlineSpan>[
        WidgetSpan(
            child: Container(
              margin: EdgeInsets.only(right: 10),
              padding: EdgeInsets.symmetric(horizontal: 10),
              decoration: BoxDecoration(
                  shape: BoxShape.rectangle,
                  borderRadius: BorderRadius.all(Radius.circular(20)),
                  color: Colors.blue),
              child: Text(
                '判断题',
                style: TextStyle(color: Colors.white),
              ),
            )),
        TextSpan(text: '泡沫灭火器可用于带电灭火'),

      ]),
)
```

![image-20201111160314232](C:\Users\here\AppData\Roaming\Typora\typora-user-images\image-20201111160314232.png)

### “服务协议”

通常在登录页面的底部会出现**登录即代表同意并阅读 《服务协议》**，其中**《服务协议》**为蓝色且可点击：

```
Text.rich(
  TextSpan(
      text: '登录即代表同意并阅读',
      style: TextStyle(fontSize: 11, color: Color(0xFF999999)),
      children: [
        TextSpan(
          text: '《服务协议》',
          style: TextStyle(color: Colors.blue, fontWeight: FontWeight.bold),
          recognizer: TapGestureRecognizer()
            ..onTap = () {
              print('onTap');
            },
        ),
      ]),
)
```

![image-20201111161012858](C:\Users\here\AppData\Roaming\Typora\typora-user-images\image-20201111161012858.png)

### 密码输入框

```
TextField(
  decoration: InputDecoration(
    fillColor: Color(0x30cccccc),
    filled: true,
    enabledBorder: OutlineInputBorder(
        borderSide: BorderSide(color: Color(0x00FF0000)),
        borderRadius: BorderRadius.all(Radius.circular(100))),
    hintText: '输入密码',
    focusedBorder: OutlineInputBorder(
        borderSide: BorderSide(color: Color(0x00000000)),
        borderRadius: BorderRadius.all(Radius.circular(100))),

  ),
  textAlign: TextAlign.center,
  obscureText: true,
  onChanged: (value) {

  },
)
```

![image-20201111161128791](C:\Users\here\AppData\Roaming\Typora\typora-user-images\image-20201111161128791.png)

### 评论回复

```
Text.rich(
  TextSpan(
      text: '回复',
      style: TextStyle(fontSize: 11, color: Color(0xFF999999)),
      children: [
        TextSpan(
          text: '@老孟：',
          style: TextStyle(color: Colors.blue, fontWeight: FontWeight.bold),
          recognizer: TapGestureRecognizer()
            ..onTap = () {
              print('onTap');
            },
        ),
        TextSpan(
          text: '你好，想知道Flutter发展前景如何？',
        ),
      ]),
)
```

![image-20201111161320543](C:\Users\here\AppData\Roaming\Typora\typora-user-images\image-20201111161320543.png)

# 3.错误

## 1.

```
The named parameter 'colors' isn't defined.
Try correcting the name to an existing named parameter's name, or defining a named parameter with the name 
```

## 2.

```
return new TextEditingValue(
      text: value,
      selection: new TextSelection.collapsed(offset: selectionIndex),
    );
    offset报错
    解决办法，升级flutter版本
    flutter upgrade
```



```
PS E:\FlutterProjects\flutter_jdshop_mvvm> flutter upgrade
Upgrading Flutter from D:\A\Flutter\flutter_windows_1.22.2-stable\flutter...
Checking Dart SDK version...
Downloading Dart SDK from Flutter engine a1440ca392ca23e874a105c5f3248b495bd0e247...
Unzipping Dart SDK...
Building flutter tool...
Running pub upgrade...

Upgrading engine...
Downloading Android Maven dependencies...                          42.1s
Flutter assets will be downloaded from https://storage.flutter-io.cn. Make sure you trust this source!
Downloading android-arm-profile/windows-x64 tools...                0.2s
Downloading android-arm-release/windows-x64 tools...                0.2s
Downloading android-arm64-profile/windows-x64 tools...              0.2s
Downloading android-arm64-release/windows-x64 tools...              0.2s
Downloading android-x64-profile/windows-x64 tools...                0.2s
Downloading android-x64-release/windows-x64 tools...                0.2s
Downloading android-x86 tools...                                    3.3s
Downloading android-x64 tools...                                    3.1s
Downloading android-arm tools...                                    1.2s
Downloading android-arm-profile tools...                            0.8s
Downloading android-arm-release tools...                            0.6s
Downloading android-arm64 tools...                                  1.8s
Downloading android-arm64-profile tools...                          0.8s
Downloading android-arm64-release tools...                          0.7s
Downloading android-x64-profile tools...                            0.9s
Downloading android-x64-release tools...                            0.7s
Downloading android-x86-jit-release tools...                        1.2s
Downloading package sky_engine...                                   0.2s
Downloading flutter_patched_sdk tools...                            1.5s
Downloading flutter_patched_sdk_product tools...                    1.3s
Downloading windows-x64 tools...                                    3.9s
Downloading windows-x64/font-subset tools...                        0.4s

Flutter 1.22.3 • channel stable • https://github.com/flutter/flutter.git
Framework • revision 8874f21e79 (9 days ago) • 2020-10-29 14:14:35 -0700
Engine • revision a1440ca392
Tools • Dart 2.10.3

Running flutter doctor...
Doctor summary (to see all details, run flutter doctor -v):
[√] Flutter (Channel stable, 1.22.3, on Microsoft Windows [Version 10.0.18363.1139], locale zh-CN)
[√] Android toolchain - develop for Android devices (Android SDK version 29.0.2)
[√] Android Studio (version 3.5)
[!] IntelliJ IDEA Ultimate Edition (version 2019.3)
    X Flutter plugin not installed; this adds Flutter specific functionality.
    X Dart plugin not installed; this adds Dart specific functionality.
[√] Connected device (1 available)

! Doctor found issues in 1 category.

  ╔════════════════════════════════════════════════════════════════════════════╗
  ║                 Welcome to Flutter! - https://flutter.dev                  ║
  ║                                                                            ║
  ║ The Flutter tool uses Google Analytics to anonymously report feature usage ║
  ║ statistics and basic crash reports. This data is used to help improve      ║
  ║ Flutter tools over time.                                                   ║
  ║                                                                            ║
  ║ Flutter tool analytics are not sent on the very first run. To disable      ║
  ║ reporting, type 'flutter config --no-analytics'. To display the current    ║
  ║ setting, type 'flutter config'. If you opt out of analytics, an opt-out    ║
  ║ event will be sent, and then no further information will be sent by the    ║
  ║ Flutter tool.                                                              ║
  ║                                                                            ║
  ║ By downloading the Flutter SDK, you agree to the Google Terms of Service.  ║
  ║ Note: The Google Privacy Policy describes how data is handled in this      ║
  ║ service.                                                                   ║
  ║                                                                            ║
  ║ Moreover, Flutter includes the Dart SDK, which may send usage metrics and  ║
  ║ crash reports to Google.                                                   ║
  ║                                                                            ║
  ║ Read about data we send with crash reports:                                ║
  ║ https://flutter.dev/docs/reference/crash-reporting                         ║
  ║                                                                            ║
  ║ See Google's privacy policy:                                               ║
  ║ https://policies.google.com/privacy                                        ║
  ╚════════════════════════════════════════════════════════════════════════════╝

PS E:\FlutterProjects\flutter_jdshop_mvvm>
```

## 3.Error: ADB exited with exit code 1

```
Performing Streamed Install

adb: failed to install E:\FlutterProjects\flutter_app1\build\app\outputs\flutter-apk\app.apk: Failure [INSTALL_FAILED_USER_RESTRICTED: Install canceled by   
user]
Error launching application on Redmi Note 7.
```

## 4.Scaffold.of()

```
Scaffold.of() called with a context that does not contain a Scaffold.
No Scaffold ancestor could be found starting from the context that was passed to Scaffold.of(). This usually happens when the context provided is from the same StatefulWidget as that whose build function actually creates the Scaffold widget being sought.
在不包含 Scaffold 的上下文中调用 Scaffold.of（）。
从传递给 Scaffold.of（）的上下文开始，找不到 Scaffold 的祖先。 通常，当提供的上下文来自与其构建函数实际创建要查找的 Scaffold 小部件的状态相同的 StatefulWidget 时，就会发生这种情况。
```

## 5.Herotag

```
There are multiple heroes that share the same tag within a subtree.
在程序回调的的时候发生了以下断言：
在子树中有多个 Hero 对象共用了一个 tag，每个 Hero 对象的 tag 必须是惟一的。
并且指出了是 FloatingActionButton 中的 tag 有冲突。
给 FloatingActionButton 的 heroTag 赋一个新的值。
```

![image-20201120154613382](C:\Users\here\AppData\Roaming\Typora\typora-user-images\image-20201120154613382.png)



# 4.总结

## 1.Flutter StatefulWidget 和 StatelessWidget 的区别和使用

```
Flutter 中组件分为 无状态组件（StatelessWidget） 和 有状态组件（StatefulWidget）两种。
它们唯一的区别就是运行时重新加载组件的方式不同，
StatelessWidget 组件重新加载时重新创建当前组件的实例，
而StatefulWidget 组件重新加载时不会重新创建实例，而是重新执行 build 函数。
```

```
StatelessWidget 是一个没有状态的 widget—— 没有要管理的内部状态。它通过构建一系列其他小部件来更加具体地描述用户界面，从而描述用户界面的一部分。当我们的页面不依赖 Widget 对象本身中的配置信息以及 BuildContext 时，就可以用到无状态组件。例如当我们只需要显示一段文字时。实际上 Icon、Divider、Dialog、Text 等都是 StatelessWidget 的子类。

class Less extends StatelessWidget {
  final String text;

  const Less({Key key, this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Text(text);
  }
}

Less 包含了一个从外部接受一个不可变的数据源 text 并将它显示。
无状态的组件的声明周期只有一个：build，它只会在三种情况下被调用:

将 widget 插入树中的时候，也就是第一次构建
当 widget 的父级更改了其配置时，例如，Less 的父类改变了 text 的值
当它依赖的 InheritedWidget 发生变化时

```

```
StatefulWidget 是可变状态的 widget。使用 setState 方法管理 StatefulWidget 的状态的改变。调用 setState 通知 Flutter 框架某个状态发生了变化，Flutter 会重新运行 build 方法，应用程序变可以显示最新的状态。
状态是在构建 widget 的时候，widget 可以同步读取的信息，而这些状态会发生变化。要确保在状态改变的时候即使通知 widget 进行动态更改，就需要用到 StatefulWidget。例如一个计数器，我们点击按钮就要让数字加一。在 Flutter 中，Checkbox、FadeImage 等都是有状态组件。 StatefulWidget 的基本使用如下：

class Full extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _Full();
  }
}

class _Full extends State<Full> {
  int count = 0;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new GestureDetector(
      onTap: onClick,
      child: new Text("$count"),
    );
  }

  void onClick() {
    setState(() {
      count += 1;
    });
  }
}

```

## 2.Flutter 视图 Widget 生命周期

### 1.StatelessWidget 的生命周期

无状态 Widget 的生命周期很简单，它只有一个生命周期：build

##### build

build 函数用来构建视图，每次页面刷新是被调用，典型的用法如下：

```dart
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Welcome to Flutter',
      home: new Scaffold(
        appBar: new AppBar(
          title: new Text('Welcome to Flutter'),
        ),
        body: new Center(
          child: new Text('Hello World'),
        ),
      ),
    );
  }
}
复制代码
```

### 2.StatefulWidget 的生命周期

StatefulWidget 生命周期整理如下图：



![img](https://user-gold-cdn.xitu.io/2019/8/10/16c7a23aad24fccf?imageView2/0/w/1280/h/960/format/webp/ignore-error/1)

大致可分为三个阶段：



- 初始化：插入渲染树
- 运行中：在渲染树中存在
- 销毁：从渲染树中移除

##### 初始化阶段

###### createState

createState 必须且仅执行一次，它用来创建 state，当创建 StatefulWidget 时，该放方法被执行

###### initState

在创建 StatefulWidget 后，initState 是第一个被调用的方法，同 createState 一样只被调用一次，此时 widget 的被添加至渲染树，mount 的值会变为 true，但并没有渲染。可以在该方法内做一些初始化操作。在 override 时要低啊用 super.initState ()

```
@override
void initState() {
  super.initState();
  ...
}
复制代码
```

###### didChangeDependencies

当 widget 第一次被创建时，didChangeDependencies 紧跟着 initState 函数之后调用，在 widget 刷新时，该方法不会被调用。它会在 “依赖” 发生变化时被 Flutter Framework 调用，这个依赖是指 widget 是否使用父 widget 中 InheritedWidget 的数据。也即是只有在 widget 依赖的 InheritedWidget 发生变化之后，didChangeDependencies 才会调用。 这种机制可以使子组件在所依赖的 InheritedWidget 变化时来更新自身！比如当主题、locale (语言) 等发生变化时，依赖其的子 widget 的 didChangeDependencies 方法将会被调用。

```
//通过继承InheritedWidget，将当前计数器点击次数保存在ShareDataWidget的data属性中：
class ShareDataWidget extends InheritedWidget {
  ShareDataWidget({
    @required this.data,
    Widget child
  }) :super(child: child);

  final int data; //需要在子树中共享的数据，保存点击次数

  //定义一个便捷方法，方便子树中的widget获取共享数据  
  static ShareDataWidget of(BuildContext context) {
    return context.inheritFromWidgetOfExactType(ShareDataWidget);
  }

  //该回调决定当data发生变化时，是否通知子树中依赖data的Widget  
  @override
  bool updateShouldNotify(ShareDataWidget old) {
    //如果返回true，则子树中依赖(build函数中有调用)本widget
    //的子widget的`state.didChangeDependencies`会被调用
    return old.data != data;
  }
}

class _TestWidget extends StatefulWidget {
  @override
  __TestWidgetState createState() => new __TestWidgetState();
}
//然后我们实现一个子组件_TestWidget，在其build方法中引用ShareDataWidget中的数据。
class __TestWidgetState extends State<_TestWidget> {
  @override
  Widget build(BuildContext context) {
    //使用InheritedWidget中的共享数据
    return Text(ShareDataWidget
        .of(context)
        .data
        .toString());
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    //父或祖先widget中的InheritedWidget改变(updateShouldNotify返回true)时会被调用。
    //如果build中没有依赖InheritedWidget，则此回调不会被调用。
    print("Dependencies change");
  }
}

复制代码
```

注意：**如果_TestWidget 的 build 方法中没有使用 ShareDataWidget 的数据，那么它的 didChangeDependencies () 将不会被调用，因为它并没有依赖 ShareDataWidget**。在依赖改变之后 build 方法也会被调用，所以在大多数场景下都无需使用 didChangeDependencies。然而如果你需要在依赖改变后执行一些昂贵的操作，比如网络请求，这时最好的方式就是在此方法中执行，这样可以避免每次 build () 都执行这些昂贵操作。

##### build

build 函数会在 widget 第一次创建时紧跟着 didChangeDependencies 方法之后和 UI 重新渲染是时调用。build 只做 widget 的创建操作，如果在 build 里做其他操作，会影响 UI 的渲染效果

##### 运行中

###### didUpdateWidget

当组件的状态改变的时候就会调用 didUpdateWidget, 比如调用了 setState.

##### 销毁

###### deactivate

当要将 State 对象从渲染树中移除的时候，就会调用 deactivate 生命周期，这标志着 StatefulWidget 将要销毁。页面切换时，也会调用它，因为此时 State 在视图树中的位置发生了变化但是 State 不会被销毁，而是重新插入到渲染树中。 **重写的时候必须要调用 super.deactivate ()**

###### dispose

从渲染树中移除 view 的时候调用，State 会永久的从渲染树中移除，和 initState 正好相反 mount 值变味 false。这时候就可以在 dispose 里做一些取消监听操作。

##### 总结：

| 函数                  | 调用次数 | 调用时间                   |
| --------------------- | -------- | -------------------------- |
| createState           | 1        | 第一次创建                 |
| initState             | 1        | 第一次创建                 |
| didChangeDependencies | n        | 第一次创建和依赖变化时     |
| build                 | n        | 第一次创建和 UI 重新渲染时 |
| didUpdateWidget       | n        | 第一次创建和 UI 重新渲染时 |
| deactivate            | n        | state 对象将要移除时       |
| dispose               | 1        | state 对象移除             |

## 3.flutter 限制输入数字

TextInputType.number 只能弹出数字键盘，还是可以输入特殊字符等，

需要加上 WhitelistingTextInputFormatter.digitsOnly

```
 TextField(
      inputFormatters: [
        LengthLimitingTextInputFormatter(11),
        WhitelistingTextInputFormatter.digitsOnly
      ],
      keyboardType: TextInputType.number,
```

## 4.按钮请求防重复提交

```
InkWell(
        onTap: (){
          // 防重复提交
          if(lastPopTime == null || DateTime.now().difference(lastPopTime) > Duration(seconds: 2)){
            lastPopTime = DateTime.now();
            _payOrder(context);
          }else{
            lastPopTime = DateTime.now();
            MyUtils.showMessage("请勿重复点击！");
          }

        },
)
```

## 5.权重组件

- Spacer 是通过 Expanded 实现的，Expanded 继承自 Flexible。
- 填满剩余空间直接使用 Expanded 更方便。
- Spacer 用于撑开 Row、Column、Flex 的子组件的空隙。

