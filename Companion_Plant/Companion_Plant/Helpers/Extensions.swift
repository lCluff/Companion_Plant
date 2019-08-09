//
//  Extensions.swift
//  Companion_Plant
//
//  Created by Leah Cluff on 8/5/19.
//  Copyright © 2019 Leah Cluff. All rights reserved.
//

import Foundation


extension Double {
    func rounded(toPlaces places:Int) -> Double {
        let divisor = pow(10.0, Double(places))
        return (self * divisor).rounded() / divisor
    }
}

// MARK: - Date Extension to covert date to a day in String type.
extension Date {
    func dayOfTheWeek() -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "EEEE"
        return dateFormatter.string(from: self)
    }
}

