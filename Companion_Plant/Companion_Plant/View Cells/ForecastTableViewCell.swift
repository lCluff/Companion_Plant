//
//  ForecastTableViewCell.swift
//  Companion_Plant
//
//  Created by Leah Cluff on 8/6/19.
//  Copyright © 2019 Leah Cluff. All rights reserved.
//

import UIKit

class ForecastTableViewCell: UITableViewCell {
    
    @IBOutlet weak var forecastDayLabel: UILabel!
    @IBOutlet weak var forecastTempLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
    func configureCell() {
        self.forecastDayLabel.text = ""
        self.forecastTempLabel.text = ""
    }
}
