//
//  ViewController.swift
//  WeatherReportApp
//
//  Created by Jayanth Shetty on 2017-12-27.
//  Copyright © 2017 Sprouts. All rights reserved.
//

import UIKit
import Alamofire
import CoreLocation

class ViewController: UIViewController, UITableViewDelegate,UITableViewDataSource,CLLocationManagerDelegate {
    @available(iOS 2.0, *)
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return forecasts.count
    }


    @IBOutlet weak var dateLbl: UILabel!
    @IBOutlet weak var currentTempLbl: UILabel!
    @IBOutlet weak var locationLbl: UILabel!
    @IBOutlet weak var weathertypeLbl: UILabel!
    @IBOutlet weak var weatherImage: UIImageView!
    @IBOutlet weak var tableView: UITableView!

    let locationManager = CLLocationManager()
    var currentLocation: CLLocation!
    
    
    var currentWeather : CurrentWeather!
    var forecast : Forecast!
    var forecasts = [Forecast]()
    //Definition
    
    //Alamofire is a Swift-based HTTP networking library for iOS and Mac OS X. It provides an elegant interface on top of Apple’s Foundation networking stack that simplifies a number of common networking tasks.
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        tableView.delegate = self
        
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        locationManager.requestWhenInUseAuthorization()
        locationManager.startMonitoringSignificantLocationChanges()
        
        currentWeather = CurrentWeather()
        
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        locationAuthStatus()
    }
    
    
    //LOcatin manager
    func locationAuthStatus() {
        if CLLocationManager.authorizationStatus() == .authorizedWhenInUse {
            currentLocation = locationManager.location
            Location.sharedInstance.latitude = currentLocation.coordinate.latitude
            Location.sharedInstance.longitude = currentLocation.coordinate.longitude
            currentWeather.dowloadWeatherDetails {
                self.downloadForecastData {
                    self.UpdateMainUI()
                }
            }
            
        }else{
         locationManager.requestWhenInUseAuthorization()
            locationAuthStatus()
        }
        
    }
    
    

    func downloadForecastData(completed: @escaping DownloadCompleted) {
        //Downloading forecasting weather data for Tableview 
    
        Alamofire.request(FORECAST_URL).responseJSON { response in
            let result = response.result
            
            if let dict = result.value as? Dictionary<String, Any> {
                
                if let list = dict["list"] as? [Dictionary<String, Any>] {
                    for obj in list {
                        
                        let forecast = Forecast(weatherDict: obj)
                        self.forecasts.append(forecast) 
                        
                        print(obj)
                    }
                    self.tableView.reloadData()
                    
                }
            }
            completed()
        }
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as? weatherCell {
            
             let forecast = forecasts[indexPath.row]
                
            cell.configureCell(forecast: forecast)
            return cell
        }else{
            return weatherCell()
        }
        
    }
    
    func UpdateMainUI() {
        dateLbl.text = currentWeather.date
        
       currentTempLbl.text = "\(currentWeather.currentTemp)"
        
        
       weathertypeLbl.text = currentWeather.weatherType
        
        locationLbl.text = currentWeather.cityName
        
        weatherImage.image = UIImage(named: currentWeather.weatherType)
        
    }
}

