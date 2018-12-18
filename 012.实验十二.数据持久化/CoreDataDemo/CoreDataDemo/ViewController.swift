//
//  ViewController.swift
//  CoreDataDemo
//
//  Created by 509 on 2018/12/10.
//  Copyright © 2018年 2016110308. All rights reserved.
//

import UIKit
import CoreData

class ViewController: UIViewController {

    @IBOutlet weak var tfname: UITextField!
    @IBOutlet weak var tfphone: UITextField!
    
    let appDelegate = UIApplication.shared.delegate as! AppDelegate
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print(NSHomeDirectory())
    }

    @IBAction func add(_ sender: Any) {
        let person = Person(context:context)
        person.name = tfname.text!
        person.phone = tfphone.text!
        appDelegate.saveContext()
    }
    
    @IBAction func update(_ sender: Any) {
    }
    
    @IBAction func del(_ sender: Any) {
        let fetch:NSFetchRequest<Person> = Person.fetchRequest()
        fetch.predicate = NSPredicate(format:"name = %@",tfname.text!)
        let persons = try? context.fetch(fetch)
        if let p = persons?.first{
            context.delete(p)
            appDelegate.saveContext()
        }
    }
    
    
    @IBAction func query(_ sender: Any) {
        let fetch:NSFetchRequest<Person> = Person.fetchRequest()
        fetch.predicate = NSPredicate(format:"name = %@",tfname.text!)
        let persons = try? context.fetch(fetch)
        if let p = persons?.first{
            tfphone.text = p.phone
        }
    }
    
    
}

