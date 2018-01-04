//
//  Location.swift
//  WeatherReportApp
//
//  Created by Jayanth Shetty on 2017-12-28.
//  Copyright © 2017 Sprouts. All rights reserved.
//

import CoreLocation


class Location {
    
    static var sharedInstance = Location()
    private init() {}
    
    var latitude: Double!
    var longitude:Double!
    
}
