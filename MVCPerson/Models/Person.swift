//
//  Person.swift
//  MVCPerson
//
//  Created by Fernado Belen on 25/09/2021.
//

import Foundation

class Person: Codable {
    var name: String
    var lastName: String
    var age: Int
    var phone: Int
    var img: String
    var role: String
    var description: String
    
    init(name: String, lastName: String, age: Int, phone: Int, img: String, role: String, description: String) {
        self.name = name
        self.lastName = lastName
        self.age = age
        self.phone = phone
        self.img = img
        self.role = role
        self.description = description
    }
    
    func fullName() -> String {
        return "\(name) \(lastName)"
    }
}

class GroupOfPeron: Codable {
    let persons: [Person]
    
    init(persons: [Person]){
        self.persons = persons
    }
}
