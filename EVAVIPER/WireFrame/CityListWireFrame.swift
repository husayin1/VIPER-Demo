//
//  CityListWireFrame.swift
//  EVAVIPER
//
//  Created by husayn on 22/07/2024.
//

import Foundation
import UIKit

class CityListWireframe: CityListWireFrameProtocol {
   
    func pushToCityDetail(with city: City,from view: UIViewController) {
        let cityDetailViewController = view.storyboard?.instantiateViewController(withIdentifier: "CityDetailViewController") as! CityDetailViewController
        CityDetailWireFrame.createCityDetailModule(with: cityDetailViewController, and: city)
        view.navigationController?.pushViewController(cityDetailViewController, animated: true)
         
    }
    
    class func createCityListModule(cityListRef: ViewController) {
       let presenter: CityListPresenterProtocol & CityListOutputInteractorProtocol = CityListPresenter()
        
        cityListRef.presenter = presenter
        cityListRef.presenter?.wireframe = CityListWireframe()
        cityListRef.presenter?.view = cityListRef
        cityListRef.presenter?.interactor = CityListInteractor()
        cityListRef.presenter?.interactor?.presenter = presenter
    }
    
}

