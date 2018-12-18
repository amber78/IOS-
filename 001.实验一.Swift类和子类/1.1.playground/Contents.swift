import UIKit

func findPrimNumber() -> [Int] {
    var num = [2, 3]
    var flag = true
    var sqr = 0
    for x in 4...10000 {
        sqr = Int(sqrt(Double(x)))
        for y in 2...sqr {
            if x % y == 0 {
                flag = false
                break
            }
        }
        if flag {
            num.append(x)
        }
        flag = true
    }
    return num
} //返回1到10000中所有的质数

var numbers = findPrimNumber()
numbers.sort() //升序排序

//降序排序
/// mark: method 1: 自定义函数的闭包，将函数作为参数传递进排序函数中
func descending(x: Int, y: Int) -> Bool {
    return x > y
}
numbers.sort(by: descending)

/// mark: method 2: 指定参数名和类型的闭包，这个是最标准的闭包的语法
numbers.sort { (x: Int, y: Int) -> Bool in
    return x > y
}

/// mark: method 3: 利用推断只指定参数名的闭包，当定义函数参数时，肯定会定义传入的闭包的类型，所以可以根据上下文推断闭包中参数的类型
numbers.sort { (x, y) -> Bool in
    return x > y
}

/// mark: method 4: 利用推断省略返回值类型的闭包，同第三种方法，返回值类型也可以通过上下文推断
numbers.sort { (x, y) in
    return x > y
}

/// mark: method 5: 利用推断省略参数和返回值的闭包，同第三种方法，参数类型和返回值类型都可以通过上下文推断，所以可以使用一个语法糖来表示参数，其中$0表示第一个参数，$1表示第二个参数，如果还有更多的参数，依次类推
numbers.sort(by: { return $0 > $1 })

/// mark: method 6: 省略return的闭包,当闭包中只有一句return语句时，可以省略return
numbers.sort { $0 > $1 }

/// mark: method 7: 传入操作符函数的闭包，在Swift中，操作符也定义为函数，所以操作符也可以作闭包使用
numbers.sort(by: >)
