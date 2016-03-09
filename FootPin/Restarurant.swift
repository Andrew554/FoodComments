//
//  Restarurant.swift
//  FootPin
//
//  Created by SinObjectC on 16/3/4.
//  Copyright © 2016年 SinObjectC. All rights reserved.
//

import Foundation

struct Restaurant {
    var name: String
    var type: String
    var location: String
    var image: String
    var isVisited: Bool
    var rate: String

    init(name: String, type: String, location: String, image: String, isVisited: Bool) {
        self.name = name
        self.type = type
        self.location = location
        self.image = image
        self.isVisited = isVisited
        self.rate = ""
    }
    
    init(name: String, type: String, location: String, image: String, isVisited: Bool, rate: String) {
        self.name = name
        self.type = type
        self.location = location
        self.image = image
        self.isVisited = isVisited
        self.rate = rate
    }
    
    init() {
        self.name = ""
        self.type = ""
        self.location = ""
        self.image = ""
        self.isVisited = false
        self.rate = ""
    }
}

