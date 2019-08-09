//
//  PlantListTableViewController.swift
//  Companion_Plant
//
//  Created by Leah Cluff on 7/24/19.
//  Copyright © 2019 Leah Cluff. All rights reserved.
//

import UIKit

class PlantListTableViewController: UITableViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        PlantController.SharedInstance.fetchPlants(searchTerm: "") { (plants) in
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }
    }
    
    // MARK: - Table view data source
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return PlantController.SharedInstance.plants.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "plantIndexCell", for: indexPath)
        let thisCellsPlant = PlantController.SharedInstance.plants[indexPath.row]
        cell.textLabel?.text = thisCellsPlant.plantName
        return cell
    }
    
    
    // MARK: - Navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toPlantDetailVC", let indexPath = tableView.indexPathForSelectedRow {
            let destinationVC = segue.destination as? PlantDetailViewController
            let plant =  PlantController.SharedInstance.plants[indexPath.row]
            destinationVC!.plant = plant
        }
    }
    
    
}


