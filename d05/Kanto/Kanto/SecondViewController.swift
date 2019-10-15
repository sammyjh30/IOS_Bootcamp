//
//  SecondViewController.swift
//  Kanto
//
//  Created by Samantha HILLEBRAND on 2019/10/14.
//  Copyright © 2019 Samantha Hillebrand. All rights reserved.
//

import UIKit
import MapKit

class SecondViewController: UIViewController,CLLocationManagerDelegate,MKMapViewDelegate {
    //https://www.raywenderlich.com/548-mapkit-tutorial-getting-started
    
    @IBOutlet weak var mapView: MKMapView!
    var initialLocation: CLLocation!
    var pin: Pin!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        initialLocation = CLLocation(latitude: 48.896724, longitude: 2.318504)
        centerMapOnLocation(location: initialLocation)
        pin = Pin(title: "Ecole 42",
                          locationName: "96 Boulevard Bessières, 75017 Paris, France",
                          discipline: "Coding School",
                          coordinate: CLLocationCoordinate2D(latitude: 48.896724, longitude: 2.318504))
        mapView.addAnnotation(pin)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        centerMapOnLocation(location: initialLocation)
        mapView.addAnnotation(pin)
    }
    
    var locationManager: CLLocationManager!
    private var currentLocation: CLLocation?

    @IBAction func onGeoLocButtonPress(_ sender: Any) {
        locationManager = CLLocationManager()
        self.locationManager.delegate = self
        self.locationManager.desiredAccuracy = kCLLocationAccuracyBest
                
        // Check for Location Services

        if CLLocationManager.locationServicesEnabled() {
            locationManager.requestWhenInUseAuthorization()
            locationManager.startUpdatingLocation()
        }
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        defer { currentLocation = locations.last }
        if currentLocation == nil {
            // Zoom to user location
            if let userLocation = locations.last {
                let viewRegion = MKCoordinateRegion(center: userLocation.coordinate, latitudinalMeters: 2000, longitudinalMeters: 2000)
                mapView.setRegion(viewRegion, animated: false)
            }
        }
        //https://stackoverflow.com/questions/25449469/show-current-location-and-update-location-in-mkmapview-in-swift
//        https://stackoverflow.com/a/17164233
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



