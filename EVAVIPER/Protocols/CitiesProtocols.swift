//
//  CitiesProtocols.swift
//  EVAVIPER
//
//  Created by husayn on 22/07/2024.
//

import Foundation
import UIKit

protocol CityListInputInteractorProtocol: AnyObject {
    var presenter: CityListOutputInteractorProtocol? {get set}
    //Presenter -> Interactor
    func getCityList(weatherList: [WeatherResponse])
}


protocol CityListOutputInteractorProtocol: AnyObject {
    //Interactor -> Presenter
    func cityListDidFetch(cityList: [City])
}


protocol CityListWireFrameProtocol: AnyObject {
    //Presenter -> Wireframe
    func pushToCityDetail(with city: City,from view: UIViewController)
    static func createCityListModule(cityListRef: ViewController)
}

protocol CityListViewProtocol: AnyObject {
    // PRESENTER -> VIEW
    func showCities(with cities: [City])
}

protocol CityListPresenterProtocol: AnyObject {
    //View -> Presenter
    var interactor: CityListInputInteractorProtocol? {get set}
    var view: CityListViewProtocol? {get set}
    var wireframe: CityListWireFrameProtocol? {get set}

    func viewDidLoad()
    func showCitySelection(with city: City, from view: UIViewController)
}



