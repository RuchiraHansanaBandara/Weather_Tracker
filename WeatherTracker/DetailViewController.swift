//
//  DetailViewController.swift
//  WeatherTracker
//
//  Created by Ruchira Bandara on 5/10/22.
//

import UIKit

class DetailViewController: UIViewController {
    
    
    @IBOutlet weak var CityName: UILabel?
    @IBOutlet weak var tempLable: UILabel?
    @IBOutlet weak var tempMaxLable: UILabel?
    @IBOutlet weak var tempMinLable: UILabel?
    @IBOutlet weak var humidityLable: UILabel?
    
    
    var weather: Weather?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        
        CityName?.text = weather?.name
        tempLable?.text = String("\((weather?.main.temp ?? 0) as Double) °C")
        tempMaxLable?.text = String("\((weather?.main.tempMax ?? 0) as Double) °C")
        tempMinLable?.text = String("\((weather?.main.tempMin ?? 0) as Double) °C")
        humidityLable?.text = String("\((weather?.main.humidity ?? 0) as Double)")
        
    }
    
    
}

