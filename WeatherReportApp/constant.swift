//
//  constant.swift
//  WeatherReport
//
//  Created by Jayanth Shetty on 2017-12-19.
//  Copyright © 2017 Sprouts. All rights reserved.
//

import Foundation
import Alamofire

let BASE_URL = "http://api.openweathermap.org/data/2.5/weather?"
let LATITUDE = "lat="
let LONGITUDE = "&lon="
let APP_ID = "&appid="
let API_KEY = "4ee2ce70f17db83dfe1185fe4f31b180"

typealias DownloadCompleted = () -> ()

let CURRENT_WEATHER_URL = "http://api.openweathermap.org/data/2.5/weather?lat=\(Location.sharedInstance.latitude!)&lon=\(Location.sharedInstance.longitude!)&appid=4ee2ce70f17db83dfe1185fe4f31b180"
  
 let FORECAST_URL = "http://api.openweathermap.org/data/2.5/forecast?lat=\(Location.sharedInstance.latitude!)&lon=\(Location.sharedInstance.longitude!)&appid=4ee2ce70f17db83dfe1185fe4f31b180"








