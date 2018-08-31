//
//  WeatherService.swift
//  WeatherDemo
//
//  Created by Bill Feng on 1/2/17.
//  Copyright © 2017 Bill Feng. All rights reserved.
//

import Foundation

protocol WeatherServiceDelegate {
    func setWeather(weather: Weather)
    func weatherErrorWithMessage(message: String)
}

class WeatherService {
    
    var delegate: WeatherServiceDelegate?
    
    func getWeather(city: String) {
        
        //Create url escape sequence for any city
        let cityEscape = city.addingPercentEncoding(withAllowedCharacters: CharacterSet.urlHostAllowed)
        let appid = "b37944b7ed49a31fb6ed8cab2d9a2728"
        let path = "http://api.openweathermap.org/data/2.5/weather?q=\(cityEscape!)&appid=\(appid)"
        
        //Creating session to record data
        let url = URL(string: path)   //make url from the path
        let session = URLSession.shared //URLSession.shared
        let task = session.dataTask(with: url!) { (data: Data?,
            response: URLResponse?,
            error: Error?) in
            
            if let httpResponse = response as? HTTPURLResponse {  //as? -> casting
                print("**************")
                print(httpResponse.statusCode)
                print("**************")
            }
            
            let json = JSON(data: data!)
            print("json:::::: \(json)")
            
            //Check return status
            //code 404 return string
            //code 200 return int
            var status = 0;
            if let cod = json["cod"].int {
                status = cod
            } else if let cod = json["cod"].string {
                status = Int(cod)!
            }
            
            
            if status == 200 {
                //Using Json to convert data
                let lon         = json["coord"]["lon"].double
                let lat         = json["coord"]["lat"].double
                let temp        = json["main"]["temp"].double
                let name        = json["name"].string
                let desc        = json["weather"][0]["description"].string
                let icon        = json["weather"][0]["icon"].string
                let tempMax     = json["main"]["temp_max"].double
                let tempMin     = json["main"]["temp_min"].double
                let humidity    = json["main"]["humidity"].double
                let windSpeed   = json["wind"]["speed"].double
                //   let visibility  = json["visibility"]["value"].double
                
                let weather = Weather(cityName: name!,
                                      temp: temp!,
                                      description: desc!,
                                      icon: icon!,
                                      tempMax: (tempMax)!,
                                      tempMin: (tempMin)!,
                                      humidity: (humidity)!,
                                      windSpeed: (windSpeed)!,
                                      //visibility: (visibility)!,
                    lon: lon!,
                    lat: lat!
                )
                
                if self.delegate != nil {
                    DispatchQueue.main.sync {
                        self.delegate?.setWeather(weather: weather)
                    }
                }
            } else if status == 404 {
                if self.delegate != nil {
                    DispatchQueue.main.sync {
                        self.delegate?.weatherErrorWithMessage(message: "City Not Found")
                    }
                }
            }
            else {
                if self.delegate != nil {
                    DispatchQueue.main.sync {
                        self.delegate?.weatherErrorWithMessage(message: "Something went wrong")
                    }
                }
            }
        }
        
        task.resume()
        
        //  print("Weather service city: \(city)")
        //make request weather data
        //wait...
        //process data
        /*
         // a weather struct, (constructor), put all variable into one, weather
         let weather = Weather(cityName: city, temp: 237.12, description: "a nice day")
         
         if delegate != nil {
         delegate?.setWeather(weather: weather)
         }
         
         */
    }
}
