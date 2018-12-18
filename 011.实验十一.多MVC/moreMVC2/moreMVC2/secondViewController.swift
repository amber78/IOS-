//
//  secondViewController.swift
//  moreMVC2
//
//  Created by 509 on 2018/12/8.
//  Copyright © 2018年 2016110308. All rights reserved.
//

import UIKit

class secondViewController: UIViewController {

    var txname = ""
    var txno = ""
    
    @IBOutlet weak var name: UITextField!
    @IBOutlet weak var no: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        no.text = txno
        name.text = txname
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        txname = name.text!
        txno = no.text!
    }
    
}
