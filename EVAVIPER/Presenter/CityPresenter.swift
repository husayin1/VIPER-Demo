//
//  CityPresenter.swift
//  EVAVIPER
//
//  Created by husayn on 22/07/2024.
//

import Foundation
import UIKit

class CityListPresenter: CityListPresenterProtocol {
    
    var wireframe: CityListWireFrameProtocol?
    weak var view: CityListViewProtocol?
    var interactor: CityListInputInteractorProtocol?
    var weatherList:[WeatherResponse] = []
    
    func showCitySelection(with city: City, from view: UIViewController) {
        wireframe?.pushToCityDetail(with: city, from: view)
    }
    
    func viewDidLoad() {
        self.loadCityList()
    }

    func loadCityList() {
        NetworkService.fetchWeathers { [weak self] result in
            switch result {
            case.success(let response):
                self?.weatherList = response
                self?.interactor?.getCityList(weatherList: self?.weatherList ?? [])
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
//        interactor?.getCityList()
    }
    
}

extension CityListPresenter: CityListOutputInteractorProtocol {
    func cityListDidFetch(cityList: [City]) {
        view?.showCities(with: cityList)
    }
    
}
