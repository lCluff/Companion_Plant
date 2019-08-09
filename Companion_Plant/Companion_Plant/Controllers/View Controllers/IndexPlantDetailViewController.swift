//
//  IndexPlantDetailViewController.swift
//  Companion_Plant
//
//  Created by Leah Cluff on 8/8/19.
//  Copyright © 2019 Leah Cluff. All rights reserved.
//

import UIKit

class IndexPlantDetailViewController: UIViewController {

    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var scientificNameLabel: UILabel!
    @IBOutlet weak var growthHabitLabel: UILabel!
    @IBOutlet weak var rootDepthLabel: UILabel!
    @IBOutlet weak var droughtTolerance: UILabel!
    @IBOutlet weak var fertilityLabel: UILabel!
    @IBOutlet weak var waterMaxLabel: UILabel!
    @IBOutlet weak var waterMinLabel: UILabel!
    @IBOutlet weak var shadeToleranceLabel: UILabel!
    @IBOutlet weak var bloomPeriodLabel: UILabel!
    @IBOutlet weak var edibleLabel: UILabel!
    @IBOutlet weak var coldToleranceLabel: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    var plant: Plant? {
        didSet {
            loadViewIfNeeded()
            updateViews()
        }
    }
    
    func updateViews() {
        guard let plants = plant else {return}
        nameLabel.text = plants.plantName
        scientificNameLabel.text = plants.scientificName
        growthHabitLabel.text = plants.growthHabit
        
        
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
