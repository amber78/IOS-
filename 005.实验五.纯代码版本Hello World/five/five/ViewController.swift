//
//  ViewController.swift
//  five
//
//  Created by student on 2018/10/27.
//  Copyright © 2018年 201611038. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        view.backgroundColor = UIColor.brown
        let label = UILabel(frame: CGRect(x:200, y:200, width:200, height:100))
        label.text = "hello boy!"
        label.backgroundColor = UIColor.orange
        label.textAlignment = .center
        label.center = view.center
        view.addSubview(label)
        
        let button = UIButton(frame: CGRect(x:100,y:100,width:200,height:20))
        button.setTitle("click me", for: .normal)
        button.setTitleColor(UIColor.white, for: .normal)
        view.addSubview(button)
        
        button.addTarget(self, action: #selector(clicked), for: .touchUpInside)
        
        self.title = "first"
        
    }
    @IBAction func clicked(){
        if let label = view.subviews.first as? UILabel{
            label.backgroundColor = UIColor.yellow
        }
        self.navigationController?.pushViewController(secondview(), animated: true)
    
    }


}

