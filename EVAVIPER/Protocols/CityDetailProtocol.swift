//
//  CityDetailProtocol.swift
//  EVAVIPER
//
//  Created by husayn on 22/07/2024.
//

import Foundation
import UIKit

protocol CityDetailPresenterProtocol: AnyObject {
    
    var wireframe: CityDetailWireFrameProtocol? {get set}
    var view: CityDetailViewProtocol? {get set}
    
    //View -> Presenter
    func viewDidLoad()
    func backButtonPressed(from view: UIViewController)
    
}

protocol CityDetailViewProtocol: AnyObject {
    //Presenter -> View
    func showCityDetail(with weather: WeatherResponse,and city: City)
}

protocol CityDetailWireFrameProtocol: AnyObject {
    func goBackToCitytListView(from view: UIViewController)
}
