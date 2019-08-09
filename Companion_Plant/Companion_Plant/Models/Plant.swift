//
//  Plant.swift
//  Companion_Plant
//
//  Created by Leah Cluff on 7/24/19.
//  Copyright © 2019 Leah Cluff. All rights reserved.
//

import Foundation

class Plant: Codable {
    
    var plantName: String?
    let lifeSpan: String?
    let scientificName: String?
    let growthHabit: String?
    let rootDepth: Float?
    let droughtTolerance: String?
    let fertility: String?
    let waterMax: Float?
    let waterMin: Float?
    let shadeTolerance: String?
    let bloomPeriod: String?
    let edible: Bool?
    let tempMin: Float?
    
    
    init(plantName: String, lifeSpan: String, scientificName: String, growthHabit: String, rootDepth: Float, droughtTolerance: String, fertility: String, waterMax: Float, waterMin: Float, shadeTolerance: String, bloomPeriod: String, edible: Bool, tempMin: Float ) {
        self.plantName = plantName
        self.lifeSpan = lifeSpan
        self.scientificName = scientificName
        self.growthHabit = growthHabit
        self.rootDepth = rootDepth
        self.droughtTolerance = droughtTolerance
        self.fertility = fertility
        self.waterMax = waterMax
        self.waterMin = waterMin
        self.shadeTolerance = shadeTolerance
        self.bloomPeriod = bloomPeriod
        self.edible = edible
        self.tempMin = tempMin
    }
}

enum CodingKeys:String, CodingKey {
    case lifespan = "lifespan"
    case plantName = "common_name"
    case scientificName = "scientific_name"
    case growthHabit = "growth_habit"
    case rootDepth = "root_depth_minimum_inches"
    case droughtTolerance = "drought_tolerance"
    case fertility = "fertility_requirement"
    case waterMax =  "precipitation_maximum"
    case shadeTolerance = "shade_tolerance"
    case bloomPeriod = "bloom_period"
    case edible =  "palatable_human"
    case tempMin = "temperature_minumum_deg_f"
}


extension Plant: Equatable {
    static func ==(lhs:Plant, rhs:Plant) -> Bool {
        return lhs.plantName == rhs.plantName
            && lhs.lifeSpan == rhs.lifeSpan
            && lhs.scientificName == rhs.scientificName
            && lhs.growthHabit == rhs.growthHabit
            && lhs.rootDepth == rhs.rootDepth
            && lhs.droughtTolerance == rhs.droughtTolerance
            && lhs.fertility == rhs.fertility
            && lhs.waterMax == rhs.waterMax
            && lhs.waterMin == rhs.waterMin
            && lhs.shadeTolerance == rhs.shadeTolerance
            && lhs.bloomPeriod == rhs.bloomPeriod
            && lhs.edible == rhs.edible
            && lhs.tempMin == rhs.tempMin
        
        
    }
}
