//
//  Place.swift
//  Vertagelab_test
//
//  Created by md760 on 18.01.2021.
//

import Foundation

// MARK: - PlaceModel
struct PlaceModel: Codable {
    let places: [Place]
}

// MARK: - Place
struct Place: Codable {
    let id: Int
    let name: String
    let lat: Double
    let lng: Double
}
