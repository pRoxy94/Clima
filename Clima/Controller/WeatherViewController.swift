//
//  ViewController.swift
//  Clima
//
//  Created by Angela Yu on 01/09/2019.
//  Copyright © 2019 App Brewery. All rights reserved.
//

import UIKit

/**
 UItextFieldDelegate: manage the editing and validation of text
 */
class WeatherViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var conditionImageView: UIImageView!
    @IBOutlet weak var temperatureLabel: UILabel!
    @IBOutlet weak var cityLabel: UILabel!
    @IBOutlet weak var searchTextField: UITextField!
    
    var weatherManager = Weathermanager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
	   // the textfield should report back to our view controller
	   // self refers to the current view controller
	   searchTextField.delegate = self
    }

    @IBAction func searchPressed(_ sender: UIButton) {
	   // hide keyboard
	   searchTextField.endEditing(true)
	   print(searchTextField.text!)
    }
    
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
	   // hide keyboard
	   textField.endEditing(true)
	   print(textField.text!)
	   return true
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
	   if let city = textField.text {
		  weatherManager.fetchWeather(cityName: city)
	   }
	   searchTextField.text = ""
    }
    
    func textFieldShouldEndEditing(_ textField: UITextField) -> Bool {
	   if textField.text != "" {
		  return true
	   } else {
		  textField.placeholder = "Type something"
		  return false
	   }
    }
}

