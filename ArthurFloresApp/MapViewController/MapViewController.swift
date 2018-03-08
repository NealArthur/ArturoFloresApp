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
        let camera = GMSCameraPosition.camera(withLatitude: 19.86, longitude: -99.20, zoom: 6.0)
        let mapView = GMSMapView.map(withFrame: mapViewContainer.frame, camera: camera)
        mapView.isMyLocationEnabled = true
        mapViewContainer.addSubview(mapView)
        
        
//        let locations = [["latitude":0.2222, "longitude":0.33333, "name":"Tecnológico de Huatusco"], ["latitude":0.1222, "longitude":0.23333, "name":"Tecnológico de Huatusco"], ["latitude":0.3222, "longitude":0.14333, "name":"Tecnológico de Huatusco"], ["latitude":0.322, "longitude":0.13333, "name":"Tecnológico de Huatusco"], ["latitude":0.21222, "longitude":0.43333, "name":"Tecnológico de Huatusco"], ["latitude":0.22242, "longitude":0.33333, "name":"Tecnológico de Huatusco"], ["latitude":0.2122, "longitude":0.23333, "name":"Tecnológico de Huatusco"], ["latitude":0.2322, "longitude":0.13333, "name":"Tecnológico de Huatusco"]]
        
        // Creates a marker in the center of the map.
//        for (dic, index) in locations {
//
//                let marker = GMSMarker()
//                marker.position = CLLocationCoordinate2D(latitude: -33.86, longitude: 151.20)
//                marker.title = dic
//                marker.snippet = "Australia"
//                marker.map = mapView
//
//        }
        
       
        let marker1 = GMSMarker()
        marker1.position = CLLocationCoordinate2D(latitude: 19.86, longitude: -99.20)
        marker1.title = "Tecnológico de Huatusco"
        marker1.snippet = "México"
        marker1.map = mapView
        
        let marker2 = GMSMarker()
        marker2.position = CLLocationCoordinate2D(latitude: 19.286, longitude: -98.20)
        marker2.title = "Universidad Anahuac"
        marker2.snippet = "México"
        marker2.map = mapView
        
        let marker3 = GMSMarker()
        marker3.position = CLLocationCoordinate2D(latitude: 18.86, longitude: -96.20)
        marker3.title = "Primer trabajo"
        marker3.snippet = "México"
        marker3.map = mapView
        
        let marker4 = GMSMarker()
        marker4.position = CLLocationCoordinate2D(latitude: 23.86, longitude: -99.20)
        marker4.title = "Segundo trabajo"
        marker4.snippet = "México"
        marker4.map = mapView
        
        let marker5 = GMSMarker()
        marker5.position = CLLocationCoordinate2D(latitude: 16.86, longitude: -95.20)
        marker5.title = "Trabajo actual"
        marker5.snippet = "México"
        marker5.map = mapView
        
        
        //Todas los datos de localización son meramente demostrativos y no representan los datos reales
        
        
    }
}
