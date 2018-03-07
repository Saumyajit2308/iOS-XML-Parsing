//
//  XMLPeopleParser.swift
//  navigationApp
//
//  Created by Saumyajit Dutta on 16/02/2018.
//  Copyright © 2018 Vishal Pandey. All rights reserved.
//

import UIKit

class XMLPeopleParser: NSObject, XMLParserDelegate{

    //declare the name property to work with
    var name : String
    init(name:String){self.name=name}
    
    //declare the variables to work with
    var pName, pAddress, pEmail, pPhone, pImage, pUrl : String!
    var passData : Bool=false
    var elemId : Int!
    
    var person=Person()
    var people = [Person]()
    
    var tags = ["name", "address", "email", "phone", "image", "url"]
    
    func beginParsing(){
        // get the file url
        let fileURL = URL(string: self.name, relativeTo: Bundle.main.bundleURL)
        // make a parser object
        let parser = XMLParser(contentsOf: fileURL!)
        //delegate it and start parsing
        parser?.delegate = self
        parser?.parse()
    }
    
    func parser(_ parser: XMLParser, didEndElement elementName: String, namespaceURI: String?, qualifiedName qName: String?) {
        
        // reset the spy vars
        if tags.contains(elementName){
            
            passData = false
            elemId  = -1
            
        }
        
        //test if </person>
        
        if elementName == "person"{
            //new person found then add it to people
            people.append(Person(name: pName, phone: pPhone, address: pAddress, image: pImage, url: pUrl))
            
        }
        
    }
    func parser(_ parser: XMLParser, foundCharacters string: String) {
        
        //if data is to pass then store it in a pVar
        
        if passData{
            
            switch elemId{
                case 0 : pName = string
                case 1 : pAddress = string
                case 2 : pEmail = string
                case 3 : pPhone = string
                case 4 : pImage = string
                case 5 : pUrl = string
            default: break
                
            }
        }
    }
    func parser(_ parser: XMLParser, didStartElement elementName: String, namespaceURI: String?, qualifiedName qName: String?, attributes attributeDict: [String : String] = [:]) {
        
        //pulled element name then reset the spy variables if one of tags
        if tags.contains(elementName)
        {
            //reset the spy-s
            passData = true
            elemId = tags.index(of: elementName)
        }
        
    }
}
