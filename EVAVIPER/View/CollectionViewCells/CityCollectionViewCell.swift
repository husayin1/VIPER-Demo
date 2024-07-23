//
//  CityCollectionViewCell.swift
//  EVAVIPER
//
//  Created by husayn on 22/07/2024.
//

import UIKit

class CityCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var countryName: UILabel!
    @IBOutlet weak var tempInCelisuis: UILabel!
    @IBOutlet weak var likeButton: UIButton!
    
    static let identifier = String(describing: CityCollectionViewCell.self)

    func setupCell(city: City){
        self.countryName.text = city.name
        self.tempInCelisuis.text = (city.temp?.roundDouble() ?? "0.0") + " °C"
    }
}
