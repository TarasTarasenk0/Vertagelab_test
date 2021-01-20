//
//  MapScreen.swift
//  Vertagelab_test
//
//  Created by md760 on 18.01.2021.
//

import UIKit
import JGProgressHUD
import GoogleMaps

final class MapScreen: UIViewController {
    
    @IBOutlet private weak var tableView: UITableView!
    @IBOutlet private weak var mapView: UIView!

    var userEmail = ""
    var placeModel: PlaceModel?
    private let hud = JGProgressHUD(style: .extraLight)
    private let viewModel = MapScreenViewModel()
    private var refreshControl: UIRefreshControl?

    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        loadPlaces()
        setupTableView()
    }
    
    private func setupUI() {
        navigationItem.title = userEmail
    }
    
    private func setupTableView() {
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UINib(nibName: PlaceCell.identifier, bundle: nil), forCellReuseIdentifier: PlaceCell.identifier)
    }
 
    private func loadPlaces() {
        hud.show(in: view)
        viewModel.getPlaces { [weak self] result in
            guard let self = self else { return }
            DispatchQueue.main.async {
                self.hud.dismiss()
                self.refreshControl?.endRefreshing()
                switch result {
                case .success(let places):
                    self.placeModel = places
                    self.tableView.reloadData()
                    self.setupMap()
                case .failure:
                    self.showAlert()
                }
            }
        }
    }
    
    private func setupMap() {
        let startLat = placeModel?.places[0].lat
        let startLng = placeModel?.places[0].lng
        let camera = GMSCameraPosition.camera(withLatitude: startLat ?? 50.450555, longitude: startLng ?? 30.5210808, zoom: 14.0)
        let mapView = GMSMapView.map(withFrame: self.mapView.bounds, camera: camera)
        self.mapView.addSubview(mapView)
        
        guard let places = placeModel?.places else { return }
        for i in 0..<places.count {
            createMarker(place: places[i], mapView: mapView)
        }
    }
    
    private func createMarker(place: Place?, mapView: GMSMapView) {
        let latitude = place?.lat
        let longitude = place?.lng
        let title = place?.name
        let marker = GMSMarker()
        marker.position = CLLocationCoordinate2D(latitude: latitude ?? 50.450555, longitude: longitude ?? 30.5210808)
        marker.title = title ?? "Independence Square"
        marker.map = mapView
    }
}
