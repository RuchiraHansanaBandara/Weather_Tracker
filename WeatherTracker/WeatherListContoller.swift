//
//  ViewController.swift
//  WeatherTracker
//
//  Created by Ruchira Bandara on 5/6/22.
//

import UIKit




class WeatherListContoller: UIViewController {
    
    
    @IBOutlet var tableView: UITableView?
    
    
    let AddCityContoller = AddCityViewController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        let nib = UINib(nibName: "CustomTableViewCell", bundle: nil)
        self.tableView?.register(nib, forCellReuseIdentifier: "CustomTableViewCell")
        
        self.tableView?.delegate = self
        self.tableView?.dataSource = self
        
    }
    
    var weatherDetailsArray: [Weather] = []
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toAddCitySegue" {
            if let AddCityViewController = segue.destination as? AddCityViewController {
                AddCityViewController.delegate = self
            }
        }
    }
}

extension WeatherListContoller: weatherData, UITableViewDelegate, UITableViewDataSource {
    
    
    func didFetchWeatherData(_ weather: Weather) {
        DispatchQueue.main.async {
            self.weatherDetailsArray.append(weather)
            
            self.tableView?.reloadData()
            
        }
        
    }
    
    func tableView(_ tableview: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let DetailViewController = storyboard?.instantiateViewController(identifier: "DetailViewController") as?
            DetailViewController {
            
            DetailViewController.weather = weatherDetailsArray[indexPath.row]
            
            self.navigationController?.pushViewController(DetailViewController, animated: true)
        }
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return weatherDetailsArray.count
        
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CustomTableViewCell", for: indexPath) as! CustomTableViewCell
        
        let weather = weatherDetailsArray[indexPath.row]
        
        cell.cityLable.text = weather.name
        
        cell.tempLable.text = String("\(weather.main.temp) °C")
        
        return cell
    }
}



