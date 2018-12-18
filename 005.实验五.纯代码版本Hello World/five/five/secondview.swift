//
//  secondview.swift
//  five
//
//  Created by student on 2018/10/27.
//  Copyright © 2018年 201611038. All rights reserved.
//

import UIKit

class MyView:UIView{
    override func  draw(_ rect: CGRect) {
        let path = UIBezierPath(ovalIn: rect)
        UIColor.red.setStroke()//红色边框
        path.stroke()
        UIColor.blue.setFill()//填充
        path.fill()
    }
}


class secondview: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.red
        
        let circle = MyView(frame:CGRect(x:100,y:300,width:200,height:100))
        circle.backgroundColor = UIColor.clear
        view.addSubview(circle)
        
        let label = UILabel(frame: CGRect(x:130, y:100, width:150, height:50))
        label.text = "my circle!"
        label.backgroundColor = UIColor.orange
        label.textAlignment = .center
        view.addSubview(label)
       
        
        self.title = "Second"
    }

}
