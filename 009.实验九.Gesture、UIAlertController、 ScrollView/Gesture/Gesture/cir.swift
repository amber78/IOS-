//
//  cir.swift
//  Gesture
//
//  Created by student on 2018/11/21.
//  Copyright © 2018年 hdy. All rights reserved.
//

import UIKit
@IBDesignable
class cir: UIView {

    
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    
    func setup(){
        //阴影
        self.layer.shadowColor = UIColor.gray.cgColor
        self.layer.shadowOffset = CGSize(width:5,height:5)
        self.layer.shadowOpacity = 0.8
        
        let pan = UIPanGestureRecognizer(target: self, action: #selector(pange(recog:)))
        self.addGestureRecognizer(pan)
        
        let pinch = UIPinchGestureRecognizer(target: self, action: #selector(pin(recog:)))
        self.addGestureRecognizer(pinch)
        
        let tap = UITapGestureRecognizer(target: self, action: #selector(dete(recog:)))
        self.addGestureRecognizer(tap)
        tap.numberOfTapsRequired = 2
        
        let rotation = UIRotationGestureRecognizer(target: self, action: #selector(rote(recog:)))
        self.addGestureRecognizer(rotation)
        
        
    }
    
    
    //移动
    @objc func pange(recog:UIPanGestureRecognizer){
        if recog.state == .changed || recog.state == .ended{
            let trans = recog.translation(in: self)
            self.center.x += trans.x
            self.center.y += trans.y
            recog.setTranslation(.zero, in: self)
        }
    }
    
    //放缩
    @objc func pin(recog:UIPinchGestureRecognizer){
        if recog.state == .changed || recog.state == .ended{
            bounds = CGRect(x:0,y:0,width:bounds.width * recog.scale,height:bounds.height*recog.scale)
            recog.scale = 1
        }
    }
    
    
    //删除
    @objc func dete(recog:UITapGestureRecognizer){
        if recog.state == .changed || recog.state == .ended{
            recog.view?.removeFromSuperview()
        }
    }
    
    //旋转
    @objc func rote(recog:UIRotationGestureRecognizer){
        if recog.state == .changed || recog.state == .ended{
            let rotation = recog.rotation
            self.transform = self.transform.rotated(by: rotation)
            recog.rotation = 0
        }
    }
    
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setup()
    }
    
    
    override func draw(_ rect: CGRect) {
        let path = UIBezierPath(rect: rect)
        let redColor = CGFloat(Float(arc4random() % 255) / 255)
        let greenColor = CGFloat(Float(arc4random() % 255) / 255)
        let blueColor = CGFloat(Float(arc4random() % 255) / 255)
        
        UIColor(red: redColor, green: greenColor, blue: blueColor, alpha: 1.0).set()
        path.stroke()
        path.fill()
    }
 

}
