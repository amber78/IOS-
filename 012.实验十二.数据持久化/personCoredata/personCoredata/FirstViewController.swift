//
//  ViewController.swift
//  personCoredata
//
//  Created by student on 2018/12/15.
//  Copyright © 2018年 qiuyue. All rights reserved.
//

import UIKit
import CoreData
class FirstViewController: UIViewController {
    let appDelegate = UIApplication.shared.delegate as! AppDelegate
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    var person:Person?
    @IBOutlet weak var lbName: UILabel!
    @IBOutlet weak var lbNo: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        lbName.text = person?.name
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

