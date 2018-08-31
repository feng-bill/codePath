//
//  Weather.swift
//  WeatherDemo
//
//  Created by Bill Feng on 1/2/17.
//  Copyright © 2017 Bill Feng. All rights reserved.
//

import Foundation

//Class contain variables needed to be implemented
//variable to convert Celsius and Fahrenheit

//Interface class??
struct Weather {
    let cityName: String
    let temp: Double
    let description: String
    let icon: String
    
    let tempMax: Double
    let tempMin: Double
    
    let humidity: Double
    let windSpeed: Double // meter/sec
    //   let visibility: Double // meter
    
    let lon: Double
    let lat: Double
    
    var tempF: Double {
        get {
            return 1.8 * (temp - 273) + 32
        }
    }
    
    var tempC: Double {
        get {
            return (tempF - 32) * 5 / 9
        }
    }
    
    var tempMinC: Double {
        get {
            return tempMin - 273.15
        }
    }
    
    var tempMaxC: Double {
        get {
            return tempMax  - 273.15
        }
    }
    
    
    var tempMinF: Double {
        get {
            return tempMinC * 9/5 + 32
        }
    }
    
    var tempMaxF: Double {
        get {
            return tempMaxC * 9/5 + 32
        }
    }
    
    //Constructor
    init(cityName: String,
         temp: Double,
         description: String,
         icon: String,
         tempMax: Double,
         tempMin: Double,
         humidity: Double,
         windSpeed: Double,
         //       visibility: Double,
        lon: Double,
        lat: Double ) {
        
        self.cityName = cityName
        self.temp = temp
        self.description = description
        self.icon = icon
        self.tempMax = tempMax
        self.tempMin = tempMin
        self.humidity = humidity
        self.windSpeed = windSpeed
        //      self.visibility = visibility
        self.lon = lon
        self.lat = lat
    }
    
}
