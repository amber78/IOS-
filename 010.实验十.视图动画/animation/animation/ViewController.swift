//
//  ViewController.swift
//  animation
//
//  Created by 509 on 2018/11/25.
//  Copyright © 2018年 2016110308. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var myview: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }


    @IBAction func annimationclick(_ sender: Any) {
        UIView.animate(withDuration: 3, delay: 2, options: .curveEaseOut, animations: {
            //透明度
            self.myview.alpha = 0
            
            self.myview.transform = CGAffineTransform(rotationAngle: CGFloat(Double.pi))
            self.myview.transform = CGAffineTransform.identity
            self.myview.transform = CGAffineTransform(rotationAngle: CGFloat(Double.pi))
            self.myview.transform = CGAffineTransform.identity
            self.myview.transform = CGAffineTransform(rotationAngle: CGFloat(Double.pi))
            self.myview.transform = CGAffineTransform.identity
            self.myview.transform = CGAffineTransform(rotationAngle: CGFloat(Double.pi))
            self.myview.transform = CGAffineTransform.identity
            
            self.myview.transform = CGAffineTransform(scaleX: 2, y: 2)

        }) {
            (finished) in
        self.myview.removeFromSuperview()
        }
    }
    
}

