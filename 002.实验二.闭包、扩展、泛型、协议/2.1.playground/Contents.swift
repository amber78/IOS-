import UIKit

/// question: 1
let dic = [["name": "zhangsan", "age": 18], ["name": "lisi", "age": 19], ["name": "wangwu", "age": 20]]
let str = dic.map( { $0["name"]! } )  //返回字典数组中每个字典元素的"name"对应的值
print(str)  //输出["zhangsan", "lisi", "wangwu"]

/// question: 2
let arr1 = ["ajsfhu", "182has8f", "187326478", "123"]
let arr2 = arr1.filter( { Int($0) != nil } )  //先将字符串元素强转为Int?，如果值为nil，则表示该字符串不能转换成Int
print(arr2)  //输出["187326478", "123"]

/// question: 3
let arr3 = ["ajsfhu", "182has8f", "187326478"]
var str1 = arr3.reduce("", { $0 + "," + $1 }) //将字符串数组整合
str1.remove(at: str1.startIndex)  //因为整合结果的字符串的第一个字符为","，所以需要将这个","移除
print(str1)  //输出ajsfhu,182has8f,187326478

/// question: 4
var intArr = [10,4,2,11,6,3]
let tuple = intArr.reduce((max: intArr[0], min: intArr[0], sum: 0), { (max: max($0.max, $1), min: min($0.min, $1), $0.sum + $1) })
print(tuple)
/// question: 5
func f1(a: Int) -> Int {
    return a
}  //函数类型为(Int) -> Int
func f2(a: String) -> Int {
    return Int(a)!
}  //函数类型为(String) -> Int
func f3() -> Int {
    return 2
}  //函数类型为() -> Int
func f4(a: Int) {
}  //函数类型为(Int) -> Void
func f5(a: Int) -> Int {
    return a + 1
}  //函数类型为(Int) -> Int
let funArr: [Any] = [f1, f2, f3, f4, f5]
for (index, value) in funArr.enumerated() { //因为循环过程中需要设计到数组的下标，要将数组元素一一列举出来，所以需要调用数组的enumerated()方法。
    if value is (Int) -> Int {
        print(index)  //输出类型为(Int) -> Int的函数在数组中的下标，
    }
}  //输出结果为0 (换行)  4
/// question: 6
extension Int {
    //因为直接使用系统的sqrt(Double)函数会与扩展中定义的函数冲突，所以需要指定系统函数的框架
    /// 求平方根
    /// - Returns: 返回该Int型数据的平方根
    func sqrt() -> Double {
        return Darwin.sqrt(Double(self))
    }
}
print(4.sqrt())  //输出2.0
/// question: 7
//自定义泛型函数，因为需要比较大小，所以该泛型需要遵循Comparable协议，函数参数为可变参数
/// 返回参数中的最大值和最小值
/// - Parameter a: 一组可以直接比较大小的值
/// - Returns: 返回一个元组，第一个值为最大值，第二个值为最小值
func getMaxAndMin<T: Comparable>(a: T...) -> (T, T) {
    var max = a[0]
    var min = a[0]
    
    for item in a {
        if item > max {
            max = item
        } else if item < min {
            min = item
        }
    }
    return (max, min)
}
print(getMaxAndMin(a: 1, 2, 3, 9, 2, 88))  //输出(88, 1)
print(getMaxAndMin(a: 1.0, 2.0, 3.0, 9.0, 2.0, 88.0))  //输出(88.0, 1.0)
print(getMaxAndMin(a: "a", "b", "A", "sss"))  //输出("sss", "A")

