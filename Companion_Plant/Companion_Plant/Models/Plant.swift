//
//  Plant.swift
//  Companion_Plant
//
//  Created by Leah Cluff on 7/24/19.
//  Copyright © 2019 Leah Cluff. All rights reserved.
//

import UIKit

class Plant {
    
    var plantName: String
    var date: Date
    var plantDescription: String
    var plantLog: String
    var plantImage: UIImage
    
    init(plantName: String, date: Date, plantDescription: String, plantLog: String, plantImage: UIImage) {
        self.plantName = plantName
        self.date = date
        self.plantDescription = plantDescription
        self.plantLog = plantLog
        self.plantImage = plantImage
    }
}

