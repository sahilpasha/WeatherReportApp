//
//  weatherCell.swift
//  WeatherReportApp
//
//  Created by Jayanth Shetty on 2017-12-28.
//  Copyright © 2017 Sprouts. All rights reserved.
//

import UIKit

class weatherCell: UITableViewCell {

    @IBOutlet weak var weatherIcon: UIImageView!
    @IBOutlet weak var dayLbl: UILabel!
    @IBOutlet weak var typeofWeather: UILabel!
    @IBOutlet weak var highTemp: UILabel!
    @IBOutlet weak var lowTemp: UILabel!
    
    func configureCell(forecast: Forecast) {
        
        weatherIcon.image = UIImage(named: forecast.weatherType)
        dayLbl.text = forecast.date
        typeofWeather.text = forecast.weatherType
        highTemp.text = "\(forecast.highTemp)"
        lowTemp.text = "\(forecast.lowTemp)"
    }
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
       
    }

    
}
