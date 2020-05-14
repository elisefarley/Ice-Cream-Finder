//
//  IceCreamLocation.swift
//  Ice Cream Finder
//
//  Created by Elise Farley on 5/12/20.
//  Copyright © 2020 Elise Farley. All rights reserved.
//

import UIKit

class IceCreamLocation: Codable {
    var name : String
    var notes : String
    
    init(name: String, notes: String) {
        self.name = name
        self.notes = notes
    }
}
