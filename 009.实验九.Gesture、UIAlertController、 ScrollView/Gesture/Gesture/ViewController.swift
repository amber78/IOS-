//
//  ViewController.swift
//  Gesture
//
//  Created by student on 2018/11/21.
//  Copyright © 2018年 hdy. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }


    @IBAction func add(_ sender: Any) {
        let x = Int(arc4random()) % Int(self.view.bounds.width)
        let y = Int(arc4random()) % Int(self.view.bounds.height)
        
        let view = cir(frame: CGRect(x:x,y:y,width:50,height:50))
        
        self.view.addSubview(view)
    }
    
    
    @IBAction func moev(_ sender: Any) {
        for view in self.view.subviews{
            if view is cir{
                UIView.animate(withDuration: 1){
                    let x = Int(arc4random()) % Int(self.view.bounds.width)
                    let y = Int(arc4random()) % Int(self.view.bounds.height)
                    view.center = CGPoint(x:x,y:y)
                }
            }
        }
    }
    @IBAction func deleteview(_ sender: Any) {
        for view in self.view.subviews{
            if view is cir{
                view.removeFromSuperview()
            }
        }
    }
}

