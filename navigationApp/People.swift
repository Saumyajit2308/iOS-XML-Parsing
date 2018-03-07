//
//  People.swift
//  navigationApp
//
//  Created by Michael David Joseph Glover on 13/02/2018.
//  Copyright © 2018 Vishal Pandey. All rights reserved.
//

import Foundation

class People {
    // properties
    var data : Array<Person>!
    
    // init methods
    init(){
        // make some static data
        data = [
            Person(name: "Sabin Tabirca", phone: "11111111", address: "UCC, WGB", image: "sabin.jpg", url: "www.cs.ucc.ie"),
            Person(name: "Sabine Tabirca", phone: "222222222", address: "Paddy the Farmer's", image: "sabin.jpg", url: "www.cs.ucc.ie"),
            Person(name: "Sabinus Tabirca", phone: "333333333", address: "Lloyd's Pharmacy", image: "sabin.jpg", url: "www.cs.ucc.ie"),
            Person(name: "Sabina Tabirca", phone: "444444444", address: "UCC, BHSC", image: "sabin.jpg", url: "www.cs.ucc.ie"),
            Person(name: "Sabinel Tabirca", phone: "555555555", address: "UCC, ORB", image: "sabin.jpg", url: "www.cs.ucc.ie")
        ]
    }
    
    
    init(fromXMLFile: String) {
        // need a parser
        let parser = XMLPeopleParser(name:fromXMLFile)
        //begin parsing
        parser.beginParsing()
        //get the data
        self.data = parser.people
        
    }
    
    // some get methods
    func getCount() -> Int {
        return data.count
    }
    
    func getPerson(_ id : Int) -> Person {
        return data[id]
    }
    
    func getPeople() -> Array<Person> {
        return data
    }
}
