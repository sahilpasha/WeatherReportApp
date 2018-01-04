//
//  Forecast .swift
//  WeatherReportApp
//
//  Created by Jayanth Shetty on 2017-12-27.
//  Copyright © 2017 Sprouts. All rights reserved.
//

import UIKit
import Alamofire

class Forecast {
    
    
    var _date: String!
    var _weatherType:String!
    var _highTemp: String!
    var _lowTemp: String!
    
    var date:String {
        
        if _date == nil {
            _date = ""
        }
        return _date
    }
    
   
    var weatherType:String {
        
        if _weatherType == nil {
            _weatherType = ""
        }
        return _weatherType
    }
    
    var highTemp:String {
        
        if _highTemp == nil {
            _highTemp = ""
        }
        return _highTemp
    }
    
    
    var lowTemp:String {
        
        if _lowTemp == nil {
            _lowTemp = ""
        }
        return _lowTemp
    }
    
    init(weatherDict: Dictionary<String , Any>) {
    
        if let temp = weatherDict["main"] as? Dictionary<String, Any> {
            
            if let min = temp ["temp_min"] as? Double {
                
                let kelvinToFarenheitPreDivision = (min * (9/5) - 459.67)
                let kelvinToFraenheit = Double(round(10 * kelvinToFarenheitPreDivision/10))
                self._lowTemp = "\(kelvinToFraenheit)"
                print("here is u r lowtemp",_lowTemp)
            }
            
            if let max = temp["temp_max"] as? Double {
                
                    let kelvinToFarenheitPreDivision = (max * (9/5) - 459.67)
                    let kelvinToFraenheit = Double(round(10 * kelvinToFarenheitPreDivision/10))
                    self._highTemp = "\(kelvinToFraenheit)"
                print("here is u r hightemp",_highTemp)
            }
        }
        
        if let weather = weatherDict["weather"] as? [Dictionary<String ,Any>]  {
            
            
            if let main = weather[0]["main"] as? String {
                
                self._weatherType = main
                print("here is u r weather",_weatherType)
            }
        }
        
        if let date = weatherDict["dt"] as? Double {
            
            let unixConvertedDate = Date(timeIntervalSince1970: date)
            let dateFormatter = DateFormatter()
            dateFormatter.dateStyle = .full
            dateFormatter.dateFormat = "EEEE"
            dateFormatter.timeStyle = .none
            self._date = unixConvertedDate.dayOfTheWeek()
            print("here is date",_date)
        }
        
        
        
        
    }
    
}
    extension Date {
        
        func dayOfTheWeek() -> String {
        let dateFormamtter = DateFormatter()
        dateFormamtter.dateFormat = "EEEE"
        
            return dateFormamtter.string(from: self)
        
        
        }
}
