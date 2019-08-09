//
//  PlantController.swift
//  Companion_Plant
//
//  Created by Leah Cluff on 7/24/19.
//  Copyright © 2019 Leah Cluff. All rights reserved.
//

import UIKit


class PlantController {
    
    static let SharedInstance = PlantController()
    
    var plants: [Plant] = []
    
    //MARK: - CRUD Functions
    
    func fetchPlants(searchTerm: String, completion: @escaping(Plant?) -> Void) {
        let headers = [
            "Authorization": "Bearer d3hrZm50dktJY0pJTTRudW5DMkhpQT09",
            "Accept": "*/*",
            "Host": "trefle.io",
            "Accept-Encoding": "gzip, deflate",
            "Connection": "keep-alive",
        ]
        
        let request = NSMutableURLRequest(url: NSURL(string: "https://trefle.io/api/plants/")! as URL)
        request.httpMethod = "GET"
        request.allHTTPHeaderFields = headers
        
        let session = URLSession.shared
        let dataTask = session.dataTask(with: request as URLRequest, completionHandler: { (data, response, error) -> Void in
            if (error != nil) {
                print(error?.localizedDescription as Any)
            } else {
                let httpResponse = response as? HTTPURLResponse
                print(httpResponse.debugDescription)
            }
        })
        
        dataTask.resume()
    }
    
    //MARK: - CRUD FUNCTIONS
    
    func createPlant(plant: Plant, withName: String) {
      
    }
   
    func deletePlant(plant: Plant) {
        guard let plantIndex = plants.firstIndex(of: plant) else { return }
        plants.remove(at: plantIndex)
    }

}
