//
//  MapScreenViewModel.swift
//  Vertagelab_test
//
//  Created by md760 on 19.01.2021.
//try JSONDecoder().decode([Place].self, from: data)

import Foundation

struct MapScreenViewModel {
    
    func getPlaces(_ completion: @escaping (Result<PlaceModel, Error>) -> Void) {
        NetworkService.get(endpoint: "/lat_lng.json") { result in
            switch result {
            case .success(let data):
                data.printJSON()
                do {
                    let places = try JSONDecoder().decode(PlaceModel.self, from: data)
                    completion(.success(places))
                } catch (let error) {
                    completion(.failure(error))
                }
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
}
