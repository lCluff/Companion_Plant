//
//  CalendarViewController.swift
//  Companion_Plant
//
//  Created by Leah Cluff on 7/29/19.
//  Copyright © 2019 Leah Cluff. All rights reserved.
//

import UIKit


class CalendarViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource{
    
    @IBOutlet weak var monthLabel: UILabel!
    @IBOutlet weak var Calendar: UICollectionView!
    
    let Months = ["January", "February", "March", "April", "May", "June", "July", "August", "September", "October", "November", "December"]
    let DayOfMonth = ["Monday", "Tuesday", "Wednesday", "Thursday", "Friday", "Saturday", "Sunday"]
    var DaysInMonth = [31,28,31,30,31,30,31,31,30,31,30,31]
    
    var currentMonth = String()
    
    var numberOfEmptyBox = Int() // this is the number of empty boxes/cells at the beginning of each month
    
    var nextNumberOfEmptyBox = Int() // same as above but for the next month
    
    var previousNumberOfEmptyBox = 0 // same as above but for previous month
    
    var direction = 0
    
    var positionIndex = 0 //storing the above variables
    
    var leapYearCounter = 1
    
    override func viewDidLoad() {
        super.viewDidLoad()
        currentMonth = Months[month]
        monthLabel.text = "\(currentMonth) \(year)"
        
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        switch direction {
        case 0:
            return DaysInMonth[month] + numberOfEmptyBox
        case 1...:
            return DaysInMonth[month] + nextNumberOfEmptyBox
        case -1:
            return DaysInMonth[month] + previousNumberOfEmptyBox
        default:
            fatalError()
        }
        
    }
    
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "dateCell", for: indexPath) as! DateCollectionViewCell
        cell.backgroundColor = UIColor.clear
        cell.DateLabel.textColor = UIColor.black
        
        if cell.isHidden {
            cell.isHidden = false
        }
        
        switch direction {
        case 0:
            cell.DateLabel.text = "\(indexPath.row + 1 - numberOfEmptyBox)"
        case 1:
            cell.DateLabel.text = "\(indexPath.row + 1 - nextNumberOfEmptyBox)"
        case -1:
            cell.DateLabel.text = "\(indexPath.row + 1 - previousNumberOfEmptyBox)"
        default:
            fatalError()
        }
        if Int(cell.DateLabel.text!)! < 1{
            cell.isHidden = true
        }
        switch indexPath.row {
        case 5,6,12,13,19,20,26,27,33,34: //index of the collection view
            if Int(cell.DateLabel.text!)! > 0 {
                cell.DateLabel.textColor = UIColor.darkGray
            }
        default:
            break
        }
        
        if currentMonth == Months[calendar.component(.month, from: date) - 1] && year == calendar.component(.year, from: date) && indexPath.row + 1 == day {
            cell.DateLabel.layer.borderWidth = 3
            cell.DateLabel.layer.borderColor = UIColor.white.cgColor
            cell.DateLabel.layer.cornerRadius = 17.5
            
        }
        return cell
    }
    
    @IBAction func nextButton(_ sender: Any) {
        switch currentMonth {
        case "December":
            direction = 1
            
            month = 0
            year += 1
            
            if leapYearCounter < 5 {
                leapYearCounter += 1
            }
            
            if leapYearCounter == 4 {
                DaysInMonth[1] = 29
            }
            if leapYearCounter == 5 {
                leapYearCounter = 1
                DaysInMonth[1] = 28
            }
            
       
            getStartDateDayPosition()
            
            currentMonth = Months[month]
            
            monthLabel.text = "\(currentMonth) \(year)"
            moveAnimationNext(Label: monthLabel)
            Calendar.reloadData()
        default:
            month += 1
            direction = 1
            currentMonth = Months[month]
            getStartDateDayPosition()
            monthLabel.text = "\(currentMonth) \(year)"
            moveAnimationNext(Label: monthLabel)
            Calendar.reloadData()
        }
    }
    
    @IBAction func backButton(_ sender: Any) {
        switch currentMonth {
        case "January":
            direction = -1
            month = 11
            year -= 1
            getStartDateDayPosition()
            monthLabel.text = "\(currentMonth) \(year)"
            moveAnimationBack(Label: monthLabel)
            currentMonth = Months[month]
            Calendar.reloadData()
        default:
            month -= 1
            direction = -1
            getStartDateDayPosition()
            monthLabel.text = "\(currentMonth) \(year)"
            moveAnimationBack(Label: monthLabel)
            currentMonth = Months[month]
            Calendar.reloadData()
        }
    }
    
    func getStartDateDayPosition() {
        switch direction {
        case 0:
            switch day {
            case 1...7:
                numberOfEmptyBox = weekday - day
            case 8...14:
                numberOfEmptyBox = weekday - day - 7
            case 15...21:
                numberOfEmptyBox = weekday - day - 14
            case 22...28:
                numberOfEmptyBox = weekday - day - 21
            case 29...31:
                numberOfEmptyBox = weekday - day - 28
                
            default:
                break
            }
            
            positionIndex = numberOfEmptyBox
        case 1...:
            nextNumberOfEmptyBox = (positionIndex + DaysInMonth[month])%7
            positionIndex = nextNumberOfEmptyBox
            
        case -1: nextNumberOfEmptyBox = (7 - (DaysInMonth[month] - positionIndex)%7)
        if previousNumberOfEmptyBox == 7 {
            previousNumberOfEmptyBox = 0
        }
        positionIndex = previousNumberOfEmptyBox
        default:
            fatalError()
        }
    }
}
