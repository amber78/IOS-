//
//  ViewController.swift
//  Sqlite
//
//  Created by 509 on 2018/12/10.
//  Copyright © 2018年 2016110308. All rights reserved.
//

import UIKit
import SQLite3

class ViewController: UIViewController {

    @IBOutlet weak var tfphone: UITextField!
    @IBOutlet weak var tfname: UITextField!
    let db = SQLiteDB.shared
    override func viewDidLoad() {
        super.viewDidLoad()
        let result = db.open(dbPath: "",copyFile: true)
        let r = db.execute(sql: "create table if not exists Person(name varchar(20),phone varchar(20))")
        print("re:\(r)")
//        print(NSHomeDirectory())
//        print(Bundle.main.bundlePath)
    }
    
    @IBAction func shanchu(_ sender: Any) {
        let r = db.execute(sql: "delete from Person where name = '\(tfname.text!)'")
        print("re:\(r)")
    }
    @IBAction func add(_ sender: Any) {
        let r = db.execute(sql: "insert into Person(name,phone) values('\(tfname.text!)','\(tfphone.text!)')")
        print("re:\(r)")
    }
    
    @IBAction func chaxun(_ sender: Any) {
        let persons = db.query(sql: "select * from Person where name = '\(tfname.text!)'")
        if let person = persons.first,let phone =  person["phone"] as? String {
            tfphone.text = phone
        }
    }
    @IBAction func gengxin(_ sender: Any) {
        let r = db.execute(sql: "update Person set phone = '\(tfphone.text!)' where name = '\(tfname.text!)'")
        print("re:\(r)")
    }
}

