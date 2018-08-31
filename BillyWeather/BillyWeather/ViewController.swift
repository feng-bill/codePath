//
//  ViewController.swift
//  WeatherDemo
//
//  Created by Bill Feng on 1/2/17.
//  Copyright © 2017 Bill Feng. All rights reserved.
//
//Location Usage Description

import UIKit

class ViewController: UIViewController, WeatherServiceDelegate {
    
    let weatherService = WeatherService()
    
    @IBOutlet weak var iconImage:        UIImageView!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var tempLabel:        UILabel!
    @IBOutlet weak var cityLabel:        UILabel!
    @IBOutlet weak var cityButton:       UIButton!
    @IBOutlet weak var humidityLabel:    UILabel!
    @IBOutlet weak var windSpeedLabel:   UILabel!
    @IBOutlet weak var tempMAX:          UILabel!
    @IBOutlet weak var tempMin:          UILabel!
    
    //@IBOutlet weak var visibilityLabel:  UILabel!
    
    //@IBOutlet weak var backgroundImage: UIImageView!
    
    @IBAction func setCityTapped(_ sender: Any) {
        print(">>> City button tapped >>>")
        openCityAlert()
    }
    
    
    func openCityAlert() {
        //Create Alert controller
        let alert = UIAlertController(title: "City",
                                      message: "Enter city name",
                                      preferredStyle: UIAlertControllerStyle.alert)
        
        //Create Cancel action
        let cancel = UIAlertAction(title: "Cancel",
                                   style: UIAlertActionStyle.cancel,
                                   handler: nil)
        alert.addAction(cancel)
        
        //Create OK action
        //NOTE: Need take care of empty string
        let ok = UIAlertAction(title: "ok",
                               style: UIAlertActionStyle.default) {
                                (action: UIAlertAction) in
                                let textField = alert.textFields?[0]            //record text
                                let cityName = textField?.text
                                
                                self.cityLabel.text = cityName!                  //change cityLabel to input
                                self.weatherService.getWeather(city: cityName!) //pass city to getWeather
                                
                                
        }
        alert.addAction(ok)
        
        //Add text field
        alert.addTextField { (textfield: UITextField) in
            textfield.placeholder = "City Name"
        }
        
        //view alert controller //create the pop up
        self.present(alert, animated: true, completion: nil)
    }
    
    //MARK: - Weather Service Delegate
    //NOTE: Need round to nearest 2 decimals
    //NOTE: Allow user change F or C
    func setWeather(weather: Weather) {
        let formatter = NumberFormatter()
        formatter.numberStyle = .decimal
        formatter.maximumFractionDigits = 1
        formatter.minimumFractionDigits = 1
        
        let c = formatter.string(from: NSNumber(value: weather.tempC))          //Print temp in C
        
        tempLabel.text = "º\(c!)C"
        humidityLabel.text = "Humidity: \(weather.humidity)%"                   //Humidity - windSpeed - Visibility
        windSpeedLabel.text = "Wind Speed: \(weather.windSpeed) meter/sec"
        //   visibilityLabel.text = "\(weather.visibility)"
        
        cityLabel.text = weather.cityName
        descriptionLabel.text = weather.description
        iconImage.image = UIImage(named: weather.icon)                          //Update cityLabel, descriptionLabel, icon image
        cityButton.setTitle(cityLabel.text, for: .normal)
    }
    
    //Error alert
    func weatherErrorWithMessage(message: String) {
        let alert = UIAlertController(title: "Error", message: message, preferredStyle: UIAlertControllerStyle.alert)
        let ok = UIAlertAction(title: "OK", style: .default, handler: nil)
        alert.addAction(ok)
        
        self.present(alert, animated: true, completion: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.weatherService.delegate = self
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

