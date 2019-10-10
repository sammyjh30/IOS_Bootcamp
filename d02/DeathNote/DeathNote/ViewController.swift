//
//  ViewController.swift
//  DeathNote
//
//  Created by Samantha HILLEBRAND on 2019/10/09.
//  Copyright © 2019 Samantha HILLEBRAND. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var tableview: UITableView!
    
    let list = ["Bob", "Steve", "Jack"]
    
    var deathNames: [String] = ["Name 1", "Name 2", "Name 3"]
    var deathDates: [String] = ["Date 1", "Date 2", "Date 3"]
    var deathDescriptions: [String] = ["Description 1", "Description 2", "Description 3"]

    
    //a list to store DataModel
    var dataModels = [DataModel]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        //traversing through all elements of the array
        for i in 0..<self.deathNames.count{
            
            self.dataModels.append(DataModel(deathName: deathNames[i], deathDate: deathDates[i], deathDescription: deathDescriptions[i]))
            //displaying data in tableview
            self.tableview.reloadData()
            
        }
        
    }
    
    //the method returning size of the list
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int{
        return dataModels.count
    }

    //the method returning each cell of the list
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell{
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! TableViewCell
        
        //getting the hero for the specified position
        let model: DataModel
        
        model = dataModels [indexPath.row]
        
        //displaying values
        cell.deathName.text = model.deathName
        cell.deathDate.text = model.deathDate
        cell.deathDescription.text = model.deathDescription
        
        return cell
        
    }
    
    override func didReceiveMemoryWarning() {
           super.didReceiveMemoryWarning()
           // Dispose of any resources that can be recreated.
       }

////        https://www.makeschool.com/academy/track/standalone/learn-how-to-build-make-school-notes-in-swift-4/custom-table-view-cells
//https://demonuts.com/custom-uitableview-cell-swift/


}

