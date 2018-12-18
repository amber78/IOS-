//
//  ViewController.swift
//  moreMVC2
//
//  Created by 509 on 2018/12/8.
//  Copyright © 2018年 2016110308. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var name: UITextField!
    @IBOutlet weak var no: UITextField!
    
    let userdefault = UserDefaults.standard
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if let tname = userdefault.string(forKey: "tname"),let tno = userdefault.string(forKey: "tno"){
            name.text = tname
            no.text = tno
        }
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "second" {
            let secvc = segue.destination as! secondViewController
            secvc.txname = name.text!
            secvc.txno = no.text!
            userdefault.set(name.text!,forKey: "tname")
            userdefault.set(no.text!, forKey: "tno")
            userdefault.synchronize()
        }
    }
    
    @IBAction func change(segue:UIStoryboardSegue){
        let secvc = segue.source as! secondViewController
        name.text = secvc.txname
        no.text = secvc.txno
    }

}

