//
//  ViewController.swift
//  EVAVIPER
//
//  Created by husayn on 22/07/2024.
//

import UIKit

class ViewController: UIViewController, CityListViewProtocol {
    var presenter:CityListPresenterProtocol?
    var cityList = [City]()
    @IBOutlet weak var citiesCollectionView: UICollectionView!
    override func viewDidLoad() {
        super.viewDidLoad()
        registerCells()
        CityListWireframe.createCityListModule(cityListRef: self)
        presenter?.viewDidLoad()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func showCities(with cities: [City]) {
        DispatchQueue.main.async {[weak self] in
            
            self?.cityList = cities
            self?.citiesCollectionView.reloadData()
        }
    }
    
    
}

extension ViewController {
    
    func registerCells(){
        citiesCollectionView.register(UINib(nibName: CityCollectionViewCell.identifier, bundle: nil), forCellWithReuseIdentifier: CityCollectionViewCell.identifier)
    }
}

extension ViewController: UICollectionViewDelegate, UICollectionViewDataSource{
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return cityList.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = citiesCollectionView.dequeueReusableCell(withReuseIdentifier: CityCollectionViewCell.identifier, for: indexPath) as! CityCollectionViewCell
        cell.setupCell(city: cityList[indexPath.row])
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print(cityList[indexPath.row])
        presenter?.showCitySelection(with: cityList[indexPath.row], from: self)
    }
    
}
