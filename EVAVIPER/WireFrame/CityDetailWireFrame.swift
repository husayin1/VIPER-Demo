//
//  CityDetailWireFrame.swift
//  EVAVIPER
//
//  Created by husayn on 22/07/2024.
//

import Foundation
import UIKit

class CityDetailWireFrame: CityDetailWireFrameProtocol {
   
    
    
    class func createCityDetailModule(with cityDetailRef: CityDetailViewController, and city: City) {
        let presenter = CityDetailPresenter()
        presenter.city = city
        cityDetailRef.presenter = presenter
        cityDetailRef.presenter?.view = cityDetailRef
        cityDetailRef.presenter?.wireframe = CityDetailWireFrame()
    }
    
    func goBackToCitytListView(from view: UIViewController) {
        
    }
    
    deinit {
        print("CityDetailWireFrame removed")
    }
    
}
