//
//  SearchViewController.swift
//  personCoredata
//
//  Created by student on 2018/12/15.
//  Copyright © 2018年 qiuyue. All rights reserved.
//

import UIKit
import CoreData
class SearchViewController: UIViewController {
    let appDelegate = UIApplication.shared.delegate as! AppDelegate
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    @IBOutlet weak var tfName: UITextField!
    @IBOutlet weak var tfNo: UITextField!    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    override func viewWillDisappear(_ animated: Bool) {
        appDelegate.saveContext()
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    @IBAction func cancel(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    @IBAction func add(_ sender: Any) {
        let p = Person(context: context)
        p.name = tfName.text
        p.no = tfNo.text
        dismiss(animated: true, completion: nil)
    }
  
    @IBAction func update(_ sender: Any) {
        let fetch:NSFetchRequest<Person> = Person.fetchRequest()
        fetch.predicate = NSPredicate(format: "name=%@",tfName.text!)
        let persons = try? context.fetch(fetch)
        if let p = persons?.first {
            tfNo.text = p.no
            
        }
    }
    @IBAction func del(_ sender: Any) {
               let fetch:NSFetchRequest<Person> = Person.fetchRequest()
               fetch.predicate = NSPredicate(format: "name=%@",tfName.text!)
               let persons = try? context.fetch(fetch)
                if let p = persons?.first {
                   context.delete(p)
                }
    }
    @IBAction func query(_ sender: Any) {
        let fetch:NSFetchRequest<Person> = Person.fetchRequest()
        fetch.predicate = NSPredicate(format: "name=%@",tfName.text!)
        let persons = try? context.fetch(fetch)
        if let p = persons?.first {
            tfNo.text = p.no
        }
    }
    /*

     // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
