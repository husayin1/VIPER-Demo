//
//  CityDetailViewController.swift
//  EVAVIPER
//
//  Created by husayn on 22/07/2024.
//

import UIKit

class CityDetailViewController: UIViewController, CityDetailViewProtocol {
    
    
    var presenter: CityDetailPresenterProtocol?
    
    @IBOutlet weak var tempLbl: UILabel!
    
    @IBOutlet weak var humidityLbl: UILabel!
    
    @IBOutlet weak var rainLbl: UILabel!
    
    @IBOutlet weak var visibilityLbl: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter?.viewDidLoad()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func showCityDetail(with weather: WeatherResponse,and city: City) {
        title = city.name
        tempLbl.text = String("\(weather.current.temperature_2m.roundDouble()) \(weather.current_units.temperature_2m)")
        humidityLbl.text = String("\(weather.current.relative_humidity_2m)  \(weather.current_units.relative_humidity_2m)")
        rainLbl.text = String("\(weather.current.rain)  \(weather.current_units.rain)")
        visibilityLbl.text = String("\(weather.current.visibility)  \(weather.current_units.visibility)")
        
    }
    
    
    deinit {
        print("CityDetailView removed")
    }
    
}
