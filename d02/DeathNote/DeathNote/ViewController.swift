//
//  ViewController.swift
//  DeathNote
//
//  Created by Samantha HILLEBRAND on 2019/10/09.
//  Copyright © 2019 Samantha HILLEBRAND. All rights reserved.
//

import UIKit

//a list to store DataModel
var dataModels = [DataModel]()

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var tableview: UITableView!
      
    var deathNames: [String] = ["Harry Potter", "Mufasa", "Captain Hook"]
    var deathDates: [String] = ["3 August 1994 12:00:00", "07 July 1994 13:00:00", "4 November 2001 12:00:01"]
    var deathDescriptions: [String] = ["Voldemort kills him.", "Killed by his brother.", "Killed by crocodile."]

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        //traversing through all elements of the array
        if dataModels.isEmpty {
            for i in 0..<self.deathNames.count{
                
                dataModels.append(DataModel(deathName: deathNames[i], deathDate: deathDates[i], deathDescription: deathDescriptions[i]))
                //displaying data in tableview
                self.tableview.reloadData()
                
            }
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

