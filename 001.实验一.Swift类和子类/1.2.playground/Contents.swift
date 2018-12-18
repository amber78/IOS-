import UIKit

//性别的枚举
enum Gender: Int {
    case male    //男性
    case female  //女性
    case unknow  //未知
    //重载>操作符，方便后面排序使用
    static func >(lhs: Gender, rhs: Gender) -> Bool {
        return lhs.rawValue < rhs.rawValue
    }
}
//公寓的枚举
enum Department {
    case one, two, three
}
//学校协议
protocol SchoolProtocol {
    var department: Department { get set }
    func lendBook()
}
//人类
class Person: CustomStringConvertible  {
    var firstName: String  //姓
    var lastName: String  //名
    var age: Int  //年龄
    var gender: Gender  //性别
    var fullName: String {  //全名
        get {
            return firstName + lastName
        }
    }
    //构造方法
    init(firstName: String, lastName: String, age: Int, gender: Gender) {
        self.firstName = firstName
        self.lastName = lastName
        self.age = age
        self.gender = gender
    }
    
    convenience init(firstName: String, age: Int, gender: Gender) {
        self.init(firstName: firstName, lastName: "", age: age, gender: gender)
    }
    
    convenience init(firstName: String) {
        self.init(firstName: firstName, age: 0, gender: Gender.unknow)
    }
    required convenience init() {
        self.init(firstName: "")
    }
    //重载==
    static func ==(lhs: Person, rhs: Person) -> Bool {
        return lhs.fullName == rhs.fullName && lhs.age == rhs.age && lhs.gender == rhs.gender
    }
    //重载!=
    static func !=(lhs: Person, rhs: Person) -> Bool {
        return !(lhs == rhs)
    }
    //实现CustomStringConvertible协议中的计算属性，可以使用print直接输出对象内容
    var description: String {
        return "fullName: \(self.fullName), age: \(self.age), gender: \(self.gender)"
    }
    //输出Person XXX is running
    func run() {
        print("Person \(self.fullName) is running")
    }
}

var p1 = Person(firstName: "张")
var p2 = Person(firstName: "张", age: 20, gender: .male)
print(p1)  //输出fullName: 张, age: 0, gender: male
print(p1 == p2)  //输出false
print(p1 != p2)  //输出true
//教师类
class Teacher: Person, SchoolProtocol {
    var title: String  //标题
    var department: Department  //公寓
    
    //构造方法
    init(title: String, firstName: String, lastName: String, age: Int, gender: Gender, department: Department) {
        self.title = title
        self.department = department
        super.init(firstName: firstName, lastName: lastName, age: age, gender: gender)
    }
    
    init(title: String, department: Department) {
        self.title = title
        self.department = department
        super.init(firstName: "", lastName: "", age: 0, gender: .unknow)
    }
    
    convenience required init() {
        self.init(title: "", department: Department.one)
    }
    
    //重写父类的计算属性
    override var description: String {
        return "title: \(self.title), fullName: \(self.fullName), age: \(self.age), gender: \(self.gender), department: \(self.department)"
    }
    
    //重载父类run方法
    override func run() {
        print("Teacher \(self.fullName) is running")
    }
    
    //遵循协议的方法
    func lendBook() {
        print("Teacher \(self.fullName) lend a book")
    }
}

var t1 = Teacher(title: "hello", department: .one)
print(t1)  //输出title: hello, fullName: , age: 0, gender: unknow, department: one
//学生类
class Student: Person, SchoolProtocol {
    var stuNo: Int  //学号
    var department: Department  //公寓
    
    //构造方法
    init(stuNo: Int, firstName: String, lastName: String, age: Int, gender: Gender, department: Department) {
        self.stuNo = stuNo
        self.department = department
        super.init(firstName: firstName, lastName: lastName, age: age, gender: gender)
    }
    
    init(stuNo: Int, department: Department) {
        self.stuNo = stuNo
        self.department = department
        super.init(firstName: "", lastName: "", age: 0, gender: Gender.unknow)
    }
    
    required convenience init() {
        self.init(stuNo: 0, department: .one)
    }
    
    //重写父类的计算属性
    override var description: String {
        return "stuNo: \(self.stuNo), fullName: \(self.fullName), age: \(self.age), gender: \(self.gender), department: \(self.department)"
    }
    //重载父类run方法
    override func run() {
        print("Student \(self.fullName) is running")
    }
    //遵循协议的方法
    func lendBook() {
        print("Teacher \(self.fullName) lend a book")
    }
}

var s1 = Student(stuNo: 2015110101, department: .two)
print(s1)  //输出stuNo: 2015110101, fullName: , age: 0, gender: unknow, department: two
//初始化一个空的Person数组
var array = [Person]()

//生成5个Person对象
for i in 1...5 {
    let temp = Person(firstName: "张", lastName: "\(i)", age: 20, gender: .male)
    array.append(temp)
}
//生成3个Teacher对象
for i in 1...3 {
    let temp = Teacher(title: "hello", firstName: "李", lastName: "\(i)", age: 21, gender: .female, department: .one)
    array.append(temp)
}
//生成4个Student对象
for i in 1..<5 {
    let temp = Student(stuNo: 2015110100 + i, firstName: "王", lastName: "\(i)", age: 19, gender: .male, department: .two)
    array.append(temp)
}

//定义一个字典，用于统计每个类的对象个数
var dict = ["Person": 0, "Teacher": 0, "Student": 0]

for item in array {
    if item is Teacher {  //是否是Teacher类
        dict["Teacher"]! += 1
    } else if item is Student {  //是否是Student
        dict["Student"]! += 1
    } else {  //Person类
        dict["Person"]! += 1
    }
}

//输出字典值
for (key, value) in dict {
    print("\(key) has \(value) items")
}
//原始数组
print("------------------------------")
for item in array {
    print(item)
}
//根据age从大到小排序
print("------------------------------")
array.sort { return $0.age > $1.age}
for item in array {
    print(item)
}
//根据全名从前往后排序
print("------------------------------")
array.sort { return $0.fullName < $1.fullName}
for item in array {
    print(item)
}
//根据gender和age从大往小排序
print("------------------------------")
array.sort { return ($0.gender > $1.gender) && ($0.age > $1.age) }
for item in array {
    print(item)
}
//穷举，调用run方法和lendBook方法
print("------------------------------")
for item in array {
    item.run()
    if let teacher = item as? Teacher {
        teacher.lendBook()
    } else if let student = item as? Student {
        student.lendBook()
    }
}

