//
//  MCUCharacter.swift
//  CSCI321_assign5
//
//  Created by Rutvik Patel (Z1865128).
//  Created by Aviraj Parmar (Z1861160).
//
//  Copyright © 2020 Aviraj. All rights reserved.
//

import Foundation

class President: Decodable {
    var name = ""
    var politicalParty = ""
    var nickName = ""
    var startDate = ""
    var endDate = ""
    var number: Int
    var imageUrlString = ""
    
    /**
     Used to assign input file key names to our local variables (using a method named CodingKey)
     */
    private enum CodingKeys: String, CodingKey {
        case name = "Name"
        case number = "Number"
        case startDate = "Start Date"
        case endDate = "End Date"
        case nickName = "Nickname"
        case politicalParty = "Political Party"
        case imageUrlString = "URL"
    }
    
    /**
     Assigns values to class variables 
     */
    init(name: String, politicalParty: String, nickName: String, startDate: String, endDate: String, number: Int, imageUrlString: String) {
        self.name = name
        self.politicalParty = politicalParty
        self.nickName = nickName
        self.startDate = startDate
        self.endDate = endDate
        self.number = number
        self.imageUrlString = imageUrlString
    }
}
