//
//  MapViewController.swift
//  ArthurFloresApp
//
//  Created by Arturo Flores on 08/03/18.
//  Copyright © 2018 ArthurFlores. All rights reserved.
//

import UIKit
import GoogleMaps
class MapViewController: UIViewController {

    @IBOutlet var mapViewContainer: UIView!
    override func viewDidLoad() {
        super.viewDidLoad()

        loadMap()
       
    }

    func loadMap()  {
        let camera = GMSCameraPosition.camera(withLatitude: -33.86, longitude: 151.20, zoom: 6.0)
        let mapView = GMSMapView.map(withFrame: mapViewContainer.frame, camera: camera)
        mapView.isMyLocationEnabled = true
        mapViewContainer.addSubview(mapView)
        
        // Creates a marker in the center of the map.
        let marker = GMSMarker()
        marker.position = CLLocationCoordinate2D(latitude: -33.86, longitude: 151.20)
        marker.title = "Sydney"
        marker.snippet = "Australia"
        marker.map = mapView
    }
}
