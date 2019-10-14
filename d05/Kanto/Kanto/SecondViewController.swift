//
//  SecondViewController.swift
//  Kanto
//
//  Created by Samantha HILLEBRAND on 2019/10/14.
//  Copyright © 2019 Samantha Hillebrand. All rights reserved.
//

import UIKit
import MapKit

class SecondViewController: UIViewController {
    //https://www.raywenderlich.com/548-mapkit-tutorial-getting-started
    
    @IBOutlet weak var mapView: MKMapView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let initialLocation = CLLocation(latitude: 48.896724, longitude: 2.318504)
        centerMapOnLocation(location: initialLocation)
        let ecole42 = Pin(title: "Ecole 42",
                          locationName: "96 Boulevard Bessières, 75017 Paris, France",
                          discipline: "Coding School",
                          coordinate: CLLocationCoordinate2D(latitude: 48.896724, longitude: 2.318504))
        mapView.addAnnotation(ecole42)
    }
    
    let regionRadius: CLLocationDistance = 1000
    func centerMapOnLocation(location: CLLocation) {
        let coordinateRegion = MKCoordinateRegion(center: location.coordinate,
                                                  latitudinalMeters: regionRadius, longitudinalMeters: regionRadius)
        mapView.setRegion(coordinateRegion, animated: true)
    }
    
    @IBAction func mapTypeSegmentSelected(_ sender: UISegmentedControl) {
        switch sender.selectedSegmentIndex {
        case 0:
            mapView.mapType = .standard
        case 1:
            mapView.mapType = .satellite
        default:
            mapView.mapType = .hybrid
        }
    }
        
}

