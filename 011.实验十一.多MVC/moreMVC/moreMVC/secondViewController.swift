//
//  secondViewController.swift
//  moreMVC
//
//  Created by student on 2018/12/6.
//  Copyright © 2018年 hedanyang. All rights reserved.
//

import UIKit

class secondViewController: UIViewController {
    
    var name = ""
    var num = ""
    
    var delegate : Stu?

    @IBOutlet weak var tfname: UITextField!
    @IBOutlet weak var tfno: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tfname.text = name
        tfno.text = num
    }
    

    @IBAction func close(_ sender: Any) {
        num = tfno.text!
        name = tfname.text!
        
        delegate?.change(name: name, no: num)
        
        //错误，强转
//        for vc in self.navigationController!.viewControllers{
//            if let firstvc = vc as? ViewController{
//                firstvc.no = num
//                firstvc.name = name
//            }
//        }
        
        self.navigationController?.popViewController(animated: true)
    }

}
