//
//  FirstViewController.swift
//  Kanto
//
//  Created by Samantha HILLEBRAND on 2019/10/14.
//  Copyright © 2019 Samantha Hillebrand. All rights reserved.
//

import UIKit
import MapKit

class FirstViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet weak var tableView: UITableView!
    
    let locations = ["Ecole 42", "WeThinkCode_","Waterfront","Canal Walk","Glen Beach","Howard Centre"]
    let locLatitude = [48.896724, -33.906930,-33.903554,-33.892405,-33.946331,-33.933057]
    let locLongitude = [2.318504, 18.417554,18.420533,18.514126,18.376978,18.510873]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    
    //the method returning size of the list
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int{
        return locations.count
    }
    
    //the method returning each cell of the list
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell{
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        
        //displaying values
        cell.textLabel?.text = locations[indexPath.row]
        return cell
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        //
        print ("\(indexPath.row) : \(locLatitude[indexPath.row]); \(locLongitude[indexPath.row])")
        loadMapViewScreen(index: indexPath.row)
    }
    
    func loadMapViewScreen(index: Int) {
        let secondTab = self.tabBarController?.viewControllers![1] as! SecondViewController
        
        secondTab.initialLocation = CLLocation(latitude: locLatitude[index], longitude: locLongitude[index])
        secondTab.pin = Pin(title: locations[index],
                            locationName: "",
                            discipline: "",
                            coordinate: CLLocationCoordinate2D(latitude: locLatitude[index], longitude: locLongitude[index]))
        goToView(row: 1)
    }
    
    func goToView(row: Int) {
        tabBarController?.selectedIndex = row
    }
    
}

