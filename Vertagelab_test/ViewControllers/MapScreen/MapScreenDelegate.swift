//
//  MapScreenDelegate.swift
//  Vertagelab_test
//
//  Created by md760 on 20.01.2021.
//

import UIKit

extension MapScreen: UITableViewDelegate {
}

extension MapScreen: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return placeModel?.places.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: PlaceCell.identifier, for: indexPath) as! PlaceCell
        let cellData = placeModel?.places[indexPath.item]
        cell.configure(cellData)
        return cell
    }
}
