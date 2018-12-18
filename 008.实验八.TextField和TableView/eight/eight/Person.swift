//
//  Person.swift
//  eight
//
//  Created by 509 on 2018/11/20.
//  Copyright © 2018年 2016110308. All rights reserved.
//
import Foundation
enum Gender:Int{
    case male,female,unknow
    static func >(lhs: Gender, rhs: Gender) -> Bool {
        return lhs.rawValue < rhs.rawValue
    }
}


class Person {
    var Name:String
    var age:Int
    var gender:Gender
    init(Name:String, age:Int, gender:Gender){
        self.Name=Name
        self.age=age
        self.gender=gender
    }
    convenience init (name:String){
        self.init(Name:name,age:21, gender: Gender.female)
    }
    
    var description: String {
        return "Name: \(Name), age: \(age), gender: \(gender)"
    }
    static func ==(p1:Person,p2:Person)->Bool{
        return p1.Name==p2.Name
    }
    static func != (p1:Person,p2:Person)->Bool{
        return p1.Name != p2.Name
    }
}

class Student:Person{
    var stuNo:String
    init(Name:String, age:Int, gender:Gender,stuNo:String){
        self.stuNo=stuNo
        super.init(Name:Name,age:age, gender:gender)
    }
    convenience init (name:String,nom:String){
        self.init(Name:name,age:20, gender: Gender.female,stuNo:nom)
    }
    override var description:String {
        return super.description + " stuNo:\(stuNo)"
    }
}


class Teacher:Person{
    var title:String
    init(Name:String, age:Int, gender:Gender,title:String){
        self.title=title
        super.init(Name:Name, age:age, gender:gender)
    }
    convenience init (name:String,nom:String){
        self.init(Name:name,age:44, gender: Gender.male,title:nom)
    }
    override var description:String {
        return super.description + " title:\(title)"
    }
}

