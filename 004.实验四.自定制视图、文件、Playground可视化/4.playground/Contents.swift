import UIKit
import PlaygroundSupport
//第一题
let manager = FileManager.default
let document = manager.urls(for: .documentDirectory, in: .userDomainMask).first?.path
let file = document?.appending("/image") //图片文件夹

//print(document!) //输出Document路径，方便查看
if manager.fileExists(atPath: file!) {  //若该文件夹存在
    let image = file?.appending("/lake.png")  //图片文件
    if manager.fileExists(atPath: image!) {  //若该文件存在，则显示到界面上
        do{
            let data = try Data(contentsOf: URL(fileURLWithPath: image!))
            let img = UIImage(data: data)
            //let imageView = UIImageView(image: img)
            //imageView.frame = CGRect(x: 0, y: 100, width: 400, height: 300)
            //self.view.addSubview(imageView)
            print("存在")
        } catch {
            print(error)
        }
    } else {  //若不存在，则从网络下载一个图片并保存为图片文件
        let url = URL(string: "https://ss0.bdstatic.com/5aV1bjqh_Q23odCf/static/superman/img/logo/bd_logo1_31bdc765.png")
        do{
            let data = try Data(contentsOf: url!)
            try data.write(to: URL(fileURLWithPath: image!), options: .atomicWrite)
            print("文件不存在，已成功创建文件")
        } catch {
            print(error)
        }
    }
} else {  //若该文件夹不存在，则创建该文件夹
    do {
        try manager.createDirectory(atPath: file!, withIntermediateDirectories: true, attributes: nil)
        print("文件夹不存在，已成功创建文件夹")
    } catch {
        print(error)
    }
}
//第二、三题
class MyView:UIView{
    override func  draw(_ rect: CGRect) {
        let path = UIBezierPath(ovalIn: rect)
        UIColor.red.setStroke()//红色边框
        path.stroke()
        UIColor.blue.setFill()//填充
        path.fill()
    }
}

class Controller:UIViewController{
    var label:UILabel!
    var circle:MyView!
    override func loadView() {
        view = UIView(frame:CGRect(x:0,y:0,width:400,height:1000))
        view.backgroundColor=UIColor.red
        //创建圆
        let circle = MyView(frame:CGRect(x:100,y:300,width:200,height:100))
        circle.backgroundColor = UIColor.clear
        view.addSubview(circle)
        
        
        label = UILabel(frame: CGRect(x:100,y:20,width:200,height:50))
        label.backgroundColor=UIColor.yellow
        label.textColor=UIColor.black
        label.textAlignment = .center
        label.text = "hello world"
        view.addSubview(label)
        
        
        let botton = UIButton(frame: CGRect(x:100,y:550,width:200,height:50))
        botton.backgroundColor = UIColor.yellow
        botton.setTitle("Click Me", for: .normal)
        
        botton.addTarget(self, action: #selector(Controller.clicked), for: .touchUpInside)
        view.addSubview(botton)
        
    }
    @IBAction func clicked(){
        print("hello hdy")
        label?.text = "hello hdy"
        UIView.animate(withDuration: 1){
            self.circle.center = CGPoint(x:200,y:0)
        }
        
    }
}


let coo = Controller()
PlaygroundPage.current.liveView = coo

