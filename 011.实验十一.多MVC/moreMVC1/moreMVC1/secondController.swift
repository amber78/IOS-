//
//  secondController.swift
//  moreMVC1
//
//  Created by student on 2018/12/6.
//  Copyright © 2018年 hedanyang. All rights reserved.
//

import UIKit

class secondController: UIViewController {
    
    var stu:student!

    @IBOutlet weak var name: UITextField!
    @IBOutlet weak var no: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        no.text = stu.no
        name.text = stu.name
        // Do any additional setup after loading the view.
    }
    
    @IBAction func back(_ sender: Any) {
        
        stu.no = no.text!
        stu.name = name.text!
        
        
        
        navigationController?.popViewController(animated: true)
    }
    
}
