//
//  CityListInteractor.swift
//  EVAVIPER
//
//  Created by husayn on 22/07/2024.
//

import Foundation


class CityListInteractor: CityListInputInteractorProtocol {
    
    
    weak var presenter: CityListOutputInteractorProtocol?
    
    func getCityList(weatherList: [WeatherResponse]) {
        presenter?.cityListDidFetch(cityList: getAllCitiesDetails(weatherList: weatherList))
    }
    
    func getAllCitiesDetails(weatherList: [WeatherResponse]) -> [City]{
        var cityList = [
            City(name: "Cairo", latitude: 30.033333, longitude: 31.233334, isLiked: false, temp: 0.0),
            City(name: "Tokyo", latitude: 35.652832, longitude: 139.839478, isLiked: false, temp: 0.0),
            City(name: "Madrid", latitude: 40.416775, longitude: -3.703790, isLiked: false, temp: 0.0),
            City(name: "Lagos", latitude: 40.416775, longitude: 3.406448, isLiked: false, temp: 0.0),
            City(name: "Moscow", latitude: 55.751244, longitude: 37.618423, isLiked: false, temp: 0.0),
        ]
        updateCityTemperatures(cityList: &cityList, weatherList: weatherList)
        return cityList
    }
    
    private func updateCityTemperatures(cityList:inout [City],weatherList: [WeatherResponse]) {
        for (index, city) in cityList.enumerated() {
            if let weather = weatherList.first(where: { Int($0.latitude) == Int(city.latitude) && Int($0.longitude) == Int(city.longitude) }) {
                cityList[index].updateTemp(temp: weather.current.temperature_2m)
                print(weather.current.temperature_2m)
                
            }
        }
    }
    
    
}

