//
//  ViewController.swift
//  reansition
//
//  Created by 509 on 2018/11/25.
//  Copyright © 2018年 2016110308. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var myview: UIView!
    @IBOutlet weak var image: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func tranclick(_ sender: Any) {
        image.image = UIImage(named : "1")
        UIView.transition(from: myview, to: image, duration: 2, options: .transitionCurlUp, completion: nil)
    }
    
}

