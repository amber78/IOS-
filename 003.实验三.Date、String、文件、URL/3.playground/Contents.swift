import UIKit

// MARK: question1
func getDate(date: Date, zone: Int = 0) -> String {
    let formatter = DateFormatter()  //实例化格式化类
    formatter.dateFormat = "yyyy年MM月dd日EEEE aa KK:mm"  //指定格式化的格式
    formatter.locale = Locale.current  //设置当前位置，可以将对应的星期数和12小时制的上下午设置为中文
    if zone >= 0 { //当传入的为正数时，在东半区
        formatter.timeZone = TimeZone(abbreviation: "UTC+\(zone):00")
    } else {  //当传入的为负数时，在西半区
        formatter.timeZone = TimeZone(abbreviation: "UTC\(zone):00")
    }
    
    let dateString = formatter.string(from: now)  //将传入的日期格式化为字符串
    return dateString
}
let now = Date()  //获取当前时间日期
let beijing = getDate(date: now, zone: +8)  //获取当前北京的时间
print("北京: \(beijing)")  //输出: 北京: 2017年09月19日星期二 下午 10:56
let tokyo = getDate(date: now, zone: 9)  //获取当前东京的时间
print("东京: \(tokyo)")  //输出: 东京: 2017年09月19日星期二 下午 11:56

let newYork = getDate(date: now, zone: -5)  //获取当前纽约的时间
print("纽约: \(newYork)")  //输出: 纽约: 2017年09月19日星期二 上午 09:56

let london = getDate(date: now)  ////获取当前伦敦的时间
print("伦敦: \(london)")  //输出: 伦敦: 2017年09月19日星期二 下午 02:56

// MARK: question2
let parentString = "Swift is a powerful and intuitive programming language for iOS, OS X, tvOS, and watchOS."  //删除指定子串之前的字符串
let subString = parentString.replacingOccurrences(of: "OS", with: "")  //用""来替换子串，相当于删除
print(subString)  //输出: Swift is a powerful and intuitive programming language for i,  X, tv, and watch.
// MARK: question3
let dic = ["date": ["beijing": beijing, "tokyo": tokyo, "newYork": newYork, "london": london], "string": subString] as AnyObject  //将字典转换为任意类型，方便后面写入文件

let defaultDoc = FileManager.default  //获取默认工作路径
//获取工作路径下的Document文件夹
if var path = defaultDoc.urls(for: .documentDirectory, in: .userDomainMask).first?.path {
    path.append("/test.txt")  //在文件夹路径下增加一个test.txt
    print(dic.write(toFile: path, atomically: true))  //新建上面指定的文件，并将数据写入(输出: true)
}

// MARK: question4
let image = try Data(contentsOf: URL(string: "http://img.hb.aicdn.com/c84e2c8cb3e6d732a038ce3ee3453ea93bff9879c490-o6Tjk1_sq320")!) //通过指定的url获取图片，并转换为二进制数据

if var url = defaultDoc.urls(for: .documentDirectory, in: .userDomainMask).first {
    url.appendPathComponent("image.png")
    try image.write(to: url)  //将转换后的二进制数据存储为png图片
}
// MARK: question5
let url = URL(string: "http://www.weather.com.cn/data/sk/101110101.html")! //api的路径
//let str = try String(contentsOf: url)
//print(str)  //显示json数据内容
let data = try Data(contentsOf: url)  //将json转换为二进制数据
let json = try JSONSerialization.jsonObject(with: data, options: .allowFragments)  //序列化json

//解析json数据
if let dic = json as? [String: Any] {
    if let weather = dic["weatherinfo"] as? [String: Any] {
        let city = weather["city"]!
        let temp = weather["temp"]!
        let wd = weather["WD"]!
        let ws = weather["WS"]!
        print("城市: \(city), 温度: \(temp), 风向: \(wd), 风力: \(ws)")
        //输出: 城市: 西安, 温度: 20, 风向: 西南风, 风力: 1级
    }
}

