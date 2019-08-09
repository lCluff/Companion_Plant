//
//  WeatherForecastViewController.swift
//  Companion_Plant
//
//  Created by Leah Cluff on 7/31/19.
//  Copyright © 2019 Leah Cluff. All rights reserved.
//

import UIKit
import CoreLocation


class WeatherForecastViewController: UIViewController, CLLocationManagerDelegate {
    
    //Outlets
    @IBOutlet weak var cityName: UILabel!
    @IBOutlet weak var weatherType: UILabel!
    @IBOutlet weak var currentTemp: UILabel!
    @IBOutlet weak var currentDate: UILabel!
    @IBOutlet weak var weatherImage: UIImageView!
    @IBOutlet weak var forecastTableView: UITableView!
    
    //constants
    let locationManager = CLLocationManager()
    
    //variables
    var currentWeather: Weather!
    var currentLocation: CLLocation!
    var forecastWeather: ForecastWeather!
    var forecastArray = [ForecastWeather]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        callDelegates()
        applyEffect()
        setUpLocation()
        updateUI()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidLoad()
        locationAuthorizationCheck()
        WeatherController.sharedInstance.fetchWeather(searchTerm: "") { (weather) in
            DispatchQueue.main.async {
                self.view.reloadInputViews()
            }
        }
        print("data successfully downloaded")
    }
    
    //MARK: - Functions
    func callDelegates(){
        locationManager.delegate = self
        forecastTableView.delegate = self
        forecastTableView.dataSource = self
    }
    
    func setUpLocation() {
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        locationManager.requestWhenInUseAuthorization()
        locationManager.startMonitoringSignificantLocationChanges()
    }
    
    func applyEffect() {
        
        specialEffect(view: weatherImage, intensity: 45)
    }
    
    func specialEffect(view: UIView, intensity: Double) {
        //setting up x axis
        let horizontalMotion = UIInterpolatingMotionEffect(keyPath: "center.x", type: .tiltAlongHorizontalAxis)
        horizontalMotion.minimumRelativeValue = -intensity
        horizontalMotion.maximumRelativeValue = +intensity
        //setting up y axis
        let verticalMotion = UIInterpolatingMotionEffect(keyPath: "center.y", type: .tiltAlongVerticalAxis)
        verticalMotion.minimumRelativeValue = -intensity
        verticalMotion.maximumRelativeValue = +intensity
        
        let movement = UIMotionEffectGroup()
        movement.motionEffects = [horizontalMotion, verticalMotion]
        view.addMotionEffect(movement)
    }
    
    func locationAuthorizationCheck() {
        if CLLocationManager.authorizationStatus() == .authorizedWhenInUse {
            currentLocation = locationManager.location
            // passing the long/lat to weather API
            Location.sharedInstance.latitude = currentLocation.coordinate.latitude
            Location.sharedInstance.longitude = currentLocation.coordinate.longitude
        }
    }
    
    func updateUI() {
        cityName.text = currentWeather.cityName
        currentTemp.text = "\(Int(currentWeather.currentTemp))"
        weatherType.text = currentWeather.weatherType
        currentDate.text = currentWeather.date
    }
}

extension WeatherForecastViewController: UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return forecastArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "forecastCell") as! ForecastTableViewCell
        cell.configureCell()
        return cell
        
    }
}
