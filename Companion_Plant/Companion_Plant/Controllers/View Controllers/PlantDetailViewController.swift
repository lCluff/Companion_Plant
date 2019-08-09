//
//  PlantDetailViewController.swift
//  Companion_Plant
//
//  Created by Leah Cluff on 7/24/19.
//  Copyright © 2019 Leah Cluff. All rights reserved.
//

import UIKit

class PlantDetailViewController: UIViewController {

    @IBOutlet weak var customImageView: UIImageView!
    @IBOutlet weak var lifespanLabel: UILabel!
    @IBOutlet weak var rootDepthLabel: UILabel!
    @IBOutlet weak var shadeToleranceLabel: UILabel!
    @IBOutlet weak var waterMaxLabel: UILabel!
    @IBOutlet weak var waterMinLabel: UILabel!
    @IBOutlet weak var edibleLabel: UILabel!
    @IBOutlet weak var coldToleranceLabel: UILabel!
    @IBOutlet weak var growthHabitLabel: UILabel!
    @IBOutlet weak var bloomPeriodLabel: UILabel!
    @IBOutlet weak var nameTextField: UITextField!
    
    
    

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    // MARK: - Navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
    }
    
    var plant: Plant? {
        didSet {
            loadViewIfNeeded()
            updateViews()
        }
    }
    
    func updateViews() {
        
    }

}
