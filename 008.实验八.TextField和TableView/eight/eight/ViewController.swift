//
//  ViewController.swift
//  eight
//
//  Created by 509 on 2018/11/20.
//  Copyright © 2018年 2016110308. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {
    
    @IBOutlet weak var table: UITableView!
    var alert : UIAlertController!
    var students = [Student]()
    var teachers = [Teacher]()
    var tableTitle = ["teacher","student"]
    
    
    //单元格长度
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0{
            return teachers.count
        }
        else{
            return students.count
        }
    }
    
    
    //将数据显示在手机上
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let ident = tableTitle[indexPath.section]
        
        var cell:PersonCell!
        
        cell = tableView.dequeueReusableCell(withIdentifier: ident ) as! PersonCell
        
        switch ident {
        case "student":
            let stu = students[indexPath.row]
            cell.name.text = stu.Name
            cell.age.text = "\(stu.age)"
            cell.gender.text = "\(stu.gender)"
            cell.other.text = stu.stuNo
        case "teacher":
            let ter = teachers[indexPath.row]
            cell.name.text = ter.Name
            cell.age.text = "\(ter.age)"
            cell.gender.text = "\(ter.gender)"
            cell.other.text = ter.title
        default:
            break
        }
        return cell
    }
    
    
    //原始数据
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        students.append(Student(Name: "张三", age: 21, gender: Gender.female, stuNo: "201603"))
        students.append(Student(Name: "李四", age: 20, gender: Gender.male, stuNo: "201703"))
        students.append(Student(Name: "王五", age: 21, gender: Gender.female, stuNo: "201604"))
        
        teachers.append(Teacher(Name: "李老师", age: 43, gender: Gender.male, title: "ios"))
        teachers.append(Teacher(Name: "夏老师", age: 40, gender: Gender.male, title: "shark"))
        teachers.append(Teacher(Name: "刘老师", age: 40, gender: Gender.female, title: "wangan"))
        
        students.sort(by: { (s1,s2) -> Bool in
            return s1.age < s2.age
        })
        
        teachers.sort(by: { (t1,t2) -> Bool in
            return t1.age < t2.age
        })
    }
    
    //指定section
    func numberOfSections(in tableView: UITableView) -> Int {
        return tableTitle.count
    }
    
    //给cell加名字
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return tableTitle[section]
    }
    
    //每个单元格的高度
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 70
    }
    
    
    //编辑
    @IBAction func editclick(_ sender: Any) {
        table.isEditing = !table.isEditing
    }
    
    
    //删除
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete{
            if indexPath.section == 0{
                teachers.remove(at: indexPath.row)
            }else{
                students.remove(at: indexPath.row)
            }
            table.deleteRows(at: [indexPath], with: .fade)
        }
    }
    

    //移动
    func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    func tableView(_ tableView: UITableView, moveRowAt sourceIndexPath: IndexPath, to destinationIndexPath: IndexPath) {
        let name = students.remove(at: sourceIndexPath.row)
        students.insert(name, at: destinationIndexPath.row)
    }
    
    //添加学生
    @IBAction func addclick(_ sender: Any) {
        alert = UIAlertController(title: "add student information", message: nil, preferredStyle: .alert)
        
        alert.addAction(UIAlertAction(title:"Add",style: .default,handler: {
            (action) in
            self.add()
        }))
        alert.addAction(UIAlertAction(title:"Cancel",style: .cancel,handler:nil))
        
        alert.addTextField {(textField) in
            textField.placeholder = "name"
        }
        alert.addTextField {(textField) in
            textField.placeholder = "age"
        }
        alert.addTextField {(textField) in
            textField.placeholder = "gender"
        }
        alert.addTextField {(textField) in
            textField.placeholder = "stuNumber"
        }
        
         present(alert, animated: true, completion: nil)
    }
    
    func add(){
        let name = alert.textFields![0].text!
        let age = Int(alert.textFields![1].text!)
        let num = alert.textFields![3].text!
        let gender:Gender
        switch alert.textFields![2].text! {
        case "male":
            gender = .male
        case "female":
            gender = .female
        default:
            gender = .unknow
        }
        let student = Student(Name:name,age:age!,gender:gender,stuNo:num)
        students.append(student)
        table.reloadData()
        
    }

}

