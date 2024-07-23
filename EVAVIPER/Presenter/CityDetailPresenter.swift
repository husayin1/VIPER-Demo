//
//  CityDetailPresenter.swift
//  EVAVIPER
//
//  Created by husayn on 22/07/2024.
//

import Foundation
import UIKit

class CityDetailPresenter: CityDetailPresenterProtocol {
    
    weak var view: CityDetailViewProtocol?
    var wireframe: CityDetailWireFrameProtocol?
    var city: City?
    
    func viewDidLoad() {
        guard let city = city else { return }
        loadCityDetails(latitude: city.latitude , longitude: city.longitude)
    }
    
    func loadCityDetails(latitude: Double, longitude: Double){
            NetworkService.fetchWeather(with: "\(latitude)", and: "\(longitude)") { [weak self] result in
                switch result {
                case .success(let weather):
                    DispatchQueue.main.async {
                        self?.view?.showCityDetail(with: weather,and: (self?.city)!)
                    }
                case .failure(let failure):
                    print(failure.localizedDescription)
                }
            }

    }
    
    func backButtonPressed(from view: UIViewController) {
        
    }
    
    deinit {
        print("CityDetailPresenter removed")
    }
    
}
