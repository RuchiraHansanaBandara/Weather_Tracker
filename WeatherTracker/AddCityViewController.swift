//
//  AddCityViewController.swift
//  WeatherTracker
//
//  Created by Ruchira Bandara on 5/9/22.
//

import UIKit

class AddCityViewController: UIViewController {
    
    @IBOutlet weak var addCityBTN: UIButton?
    
    var delegate: weatherData?
    
    @IBOutlet weak var getCityNameTextField: UITextField?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    
    @IBAction func addCityBTN(_ sender: UIButton) {
        
        let City = getCityNameTextField?.text ?? ""
        
        if City.isEmpty {
            let alert = UIAlertController(title: weatherStrings.addCityAlertHeader, message: weatherStrings.addCityAlertMassage, preferredStyle: .alert)
            
            let cancelButton = UIAlertAction(title: weatherStrings.addCityAlertCancelBTNTitle, style: .cancel, handler: nil)
            
            alert.addAction(cancelButton)
            
            self.present(alert, animated: true, completion: nil)
        } else {
            
            fetchWeather(cityName: City) { weather in
                
                self.delegate?.didFetchWeatherData(weather)
                
            }
            self.navigationController?.popViewController(animated: true)
            
        }
        
    }
    
    
    func fetchWeather(cityName: String, _ completion: @escaping ((Weather) -> Void)) {
        
        if let url = URL(string: "\(weatherStrings.APILink.LinkPart1)\(cityName)\(weatherStrings.APILink.LinkPart2)") {
            
            URLSession.shared.dataTask(with: url) {(data, response, error) in
                if let error = error {
                    print(weatherStrings.APICAllError.error1, error)
                }
                
                if let data = data {
                    
                    do {
                        let weather = try JSONDecoder().decode(Weather.self, from: data)
                        completion(weather)
                    } catch let error {
                        print(weatherStrings.APICAllError.error2,error)
                    }
                    
                    
                }
            }.resume()
            
        }
        
    }
    
    
}
