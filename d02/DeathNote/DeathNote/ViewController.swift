//
//  ViewController.swift
//  DeathNote
//
//  Created by Samantha HILLEBRAND on 2019/10/09.
//  Copyright © 2019 Samantha HILLEBRAND. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    let list = ["Bob", "Steve", "Jack"]
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        //Return no. of rows in the table view
        return(list.count)
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: UITableViewCell.CellStyle.default, reuseIdentifier: "cell")
        cell.textLabel?.text = list[indexPath.row]
//        cell.nameLabel.text = list[indexPath.row]
//        https://www.makeschool.com/academy/track/standalone/learn-how-to-build-make-school-notes-in-swift-4/custom-table-view-cells
        return (cell)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


}

