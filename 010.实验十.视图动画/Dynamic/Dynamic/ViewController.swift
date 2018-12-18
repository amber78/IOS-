//
//  ViewController.swift
//  Dynamic
//
//  Created by 509 on 2018/11/25.
//  Copyright © 2018年 2016110308. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var myview: UIView!
    lazy var animator = UIDynamicAnimator(referenceView: self.myview)
    let gravity = UIGravityBehavior()
    let collision = UICollisionBehavior()
        
        
        
    override func viewDidLoad() {
        super.viewDidLoad()
        animator.addBehavior(gravity)
        animator.addBehavior(collision)
        collision.translatesReferenceBoundsIntoBoundary = true
    }


    @IBAction func deleteview(_ sender: Any) {
        for item in self.myview.subviews{
            if item is UILabel{
                item.removeFromSuperview()
                gravity.removeItem(item)
                collision.removeItem(item)
            }
        }
    }
    @IBAction func addview(_ sender: Any) {
        let width = Int(myview.bounds.width / 10)
        let randx = Int(arc4random() % 10) * width
        let label = UILabel(frame: CGRect(x:randx ,y: 0,width: width,height: width))
        label.text = "hdy"
        label.backgroundColor = UIColor.red
        label.textAlignment = .center
        myview.addSubview(label)
        
        gravity.addItem(label)
        collision.addItem(label)
    }
    @IBAction func up(_ sender: Any) {
        gravity.gravityDirection = CGVector(dx: 0,dy: -1)
    }
    
    
    @IBAction func down(_ sender: Any) {
        gravity.gravityDirection = CGVector(dx: 0,dy: 1)
    }
    
    @IBAction func right(_ sender: Any) {
        gravity.gravityDirection = CGVector(dx: 1,dy: 0)
    }
    
    @IBAction func left(_ sender: Any) {
        gravity.gravityDirection = CGVector(dx: -1,dy: 0)
    }
    
}

