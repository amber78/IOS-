//
//  ViewController.swift
//  hhhhhh
//
//  Created by student on 2018/11/21.
//  Copyright © 2018年 cys. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var myview: UIView!
    var time:Timer?
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        time = Timer.scheduledTimer(withTimeInterval: 2, repeats: true, block: {
          (myview) in
            self.myview.center.x
            += 10
        })
    }


    @IBAction func cli(_ sender: Any) {
        time?.invalidate()
        UIView.animate(withDuration: 6, delay: 1, options: .curveEaseOut, animations: {
            self.myview.alpha = 1
            self.myview.transform = CGAffineTransform(rotationAngle: CGFloat(Double.pi))
            self.myview.transform = CGAffineTransform.identity
            self.myview.transform = CGAffineTransform(rotationAngle: CGFloat(Double.pi))
            self.myview.transform = CGAffineTransform.identity
            self.myview.transform = CGAffineTransform(rotationAngle: CGFloat(Double.pi))
            self.myview.transform = CGAffineTransform.identity
            self.myview.transform = CGAffineTransform(rotationAngle: CGFloat(Double.pi))
            self.myview.transform = CGAffineTransform(translationX: self.view.bounds.width, y: self.view.bounds.height)
        })
    }
}

