//
//  ViewController.swift
//  moreMVC1
//
//  Created by student on 2018/12/6.
//  Copyright © 2018年 hedanyang. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var stu = student()
    
    @IBOutlet weak var no: UITextField!
    @IBOutlet weak var name: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func viewWillAppear(_ animated: Bool) {
        name.text = stu.name
        no.text = stu.no
    }

    @IBAction func showsec(_ sender: Any) {
        
        stu.no = no.text!
        stu.name = name.text!
        
         let secvc = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "second") as! secondController
        secvc.stu = stu
      
        
        self.navigationController?.pushViewController(secvc, animated: true)
    }
}

