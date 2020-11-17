//
//  MCUCharacter.swift
//  321_assign4
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
    }
    
    /**
     Assigns values to class variables 
     */
    init(name: String, politicalParty: String, nickName: String, startDate: String, endDate: String, number: Int) {
        self.name = name
        self.politicalParty = politicalParty
        self.nickName = nickName
        self.startDate = startDate
        self.endDate = endDate
        self.number = number 
    }
}
