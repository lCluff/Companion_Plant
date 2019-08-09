//
//  Weather.swift
//  Companion_Plant
//
//  Created by Leah Cluff on 7/26/19.
//  Copyright © 2019 Leah Cluff. All rights reserved.
//

import Foundation

class Weather: Codable {
    
    private var _cityName: String?
    private var _date: String?
    private var _weatherType: String?
    private var _currentTemp: Double?
    
    init(_cityName: String, _date: String, _weatherType: String, _currentTemp: Double) {
        self._cityName = _cityName
        self._date = _date
        self._weatherType = _weatherType
        self._currentTemp = _currentTemp
    }
    
    var cityName: String {
        if _cityName == nil {
            _cityName = ""
        }
        return _cityName!
    }
    
    var date: String {
        if _date == nil {
            _date = ""
        }
        return _date!
    }
    var weatherType: String {
        if _weatherType == nil {
            _weatherType = ""
        }
        return _weatherType!
    }
    
    var currentTemp: Double {
        if _currentTemp == nil {
            _currentTemp = 0.0
        }
        return _currentTemp!
    }
}
