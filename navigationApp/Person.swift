//
//  Person.swift
//  navigationApp
//
//  Created by Vishal Pandey on 05/02/2018.
//  Copyright © 2018 Vishal Pandey. All rights reserved.
//

import Foundation

class Person {
    // declare properties
    var name : String = ""
    var phone: String
    var address: String
    var image: String
    var url: String
    
    // init functions
    init() {
        self.name = "John Doe"
        self.address = "N/A"
        self.phone = "N/A"
        self.image = "none.jpg"
        self.url = "N/A"
    }
    
    init(name: String, phone: String, address: String, image: String, url: String) {
        self.name = name
        self.address = address
        self.phone = phone
        self.image = image
        self.url = url        
    }
    
    // class methods
    func printPerson() {
        print("Name: \(self.name) Phone: \(self.phone)")
    }
}
