//
//  ViewController.swift
//  UIAlert
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

    @IBAction func sheet(_ sender: Any) {
        let alert = UIAlertController(title: "选择颜色", message: "choose color", preferredStyle: .actionSheet)
        alert.addAction(UIAlertAction(title: "red", style: .default, handler:{(action) in
            self.view.backgroundColor = UIColor.red
        }))
        alert.addAction(UIAlertAction(title: "gray", style: .default, handler:{(action) in
            self.view.backgroundColor = UIColor.gray
        }))
        alert.addAction(UIAlertAction(title: "white", style: .default, handler:{(action) in
            self.view.backgroundColor = UIColor.white
        }))
        alert.addAction(UIAlertAction(title: "cancel", style: .cancel, handler: nil))
        
        present(alert, animated: true, completion: nil)
    }
    
    @IBAction func login(_ sender: Any) {
        let alert = UIAlertController(title: "login", message: "Please input your personal information", preferredStyle: .alert)
        
        alert.addAction(UIAlertAction(title: "Login", style: .default, handler: {(action) in
            if let username = alert.textFields?.first,let password = alert.textFields?.last{
                 print("username:\(username.text!) password:\(password.text!)")
            }
        }))
        alert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))
        
        alert.addTextField { (textField) in
            textField.placeholder = "your user name?"
        }
        alert.addTextField {(textField) in
            textField.placeholder = "your password?"
        }
        present(alert, animated: true, completion: nil)
    }
}

