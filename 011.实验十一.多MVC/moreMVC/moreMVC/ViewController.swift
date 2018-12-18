//
//  ViewController.swift
//  moreMVC
//
//  Created by student on 2018/12/6.
//  Copyright © 2018年 hedanyang. All rights reserved.
//

import UIKit

protocol  Stu {
    func change(name:String,no:String)
}

class ViewController: UIViewController,Stu {
    func change(name: String, no: String) {
        self.no = no
        self.name = name
    }
    
    var name = ""
    var no = ""

    @IBOutlet weak var tfname: UITextField!
    @IBOutlet weak var tfno: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        tfname.text = name
        tfno.text = no
    }
    
    @IBAction func showsecond(_ sender: Any) {
        
        name = tfname.text!
        no = tfno.text!
        
        let secvc = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "secondvc") as! secondViewController
        secvc.num = no
        secvc.name = name
        secvc.delegate = self
        
        self.navigationController?.pushViewController(secvc, animated: true)
    }

    @IBAction func showthird(_ sender: Any) {
        let thivc = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "thirdvc")
        present(thivc, animated: true, completion: nil)
    }
    
    }

