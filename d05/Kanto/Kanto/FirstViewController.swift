//
//  FirstViewController.swift
//  Kanto
//
//  Created by Samantha HILLEBRAND on 2019/10/14.
//  Copyright © 2019 Samantha Hillebrand. All rights reserved.
//

import UIKit

class FirstViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    @IBOutlet weak var tableView: UITableView!
    
    let transportItems = ["WeThinkCode_","Waterfront","Canal Walk","Seapoint","Camps Bay","Howard Centre"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    
    //the method returning size of the list
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int{
        return transportItems.count
    }

    //the method returning each cell of the list
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell{

        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)

        //displaying values
        cell.textLabel?.text = transportItems[indexPath.row]
        return cell

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

