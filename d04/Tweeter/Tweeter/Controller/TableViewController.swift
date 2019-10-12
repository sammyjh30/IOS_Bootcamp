//
//  TableViewController.swift
//  Tweeter
//
//  Created by Samantha HILLEBRAND on 2019/10/12.
//  Copyright © 2019 Samantha Hillebrand. All rights reserved.
//

import UIKit

private let reuseIdentifier = "TweetyCell"
private let token = "AAAAAAAAAAAAAAAAAAAAACxLAQEAAAAA3e1hR1XXxwMQx1lLTRgNKAD7UyM%3DsnmfkPJ0YZEF5TpFmQoWOTVSdnqXR7hoEYDvoI8Fy0uwY2E9in"

class TableViewController: UITableViewController, APITwitterDelegate, UISearchBarDelegate {
    //https://stackoverflow.com/questions/24970877/type-myviewcontroller-does-not-conform-to-protocol-uipickerdatasource-in-swift
    func listener(tweet: [Tweet]) {
        DispatchQueue.main.async {
            self.data = tweet
            self.tableView.reloadData()
        }
    }
    
    func NSExceptionErr(err: NSError) {
        print("NSError Found.")
        let alert = AlertHelper()
        alert.showAlert(fromController: self)
    }
    
    var data = [Tweet]()
    
    @IBOutlet weak var tableSearchBar: UISearchBar!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.tableView.register(TweetCell.self, forCellReuseIdentifier: reuseIdentifier)
        self.tableView.alwaysBounceVertical = true
        tion(query: "school 42")
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
       return data.count
   }
   
   override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
       let cell = tableView.dequeueReusableCell(withIdentifier: reuseIdentifier, for: indexPath) as! TweetCell
       
       cell.sizeToFit()
       cell.name = data[indexPath.row].name
       cell.tweet = data[indexPath.row].text
//       cell.date = data[indexPath.row].date
       cell.layoutIfNeeded()
       
       return cell
   }
    
    func tion(query: String) {
        let api = APIController(delegate: self, token: token)
        api.getTheTweets(keyword: query) {
            self.tableView.rowHeight = UITableView.automaticDimension
            self.tableView.estimatedRowHeight = 80
            self.tableView.reloadData()
            tableSearchBar.resignFirstResponder()
        }
    }
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        tion(query: tableSearchBar.text ?? "school 42")
    }
    
}

class AlertHelper {
    
        func showAlert(fromController controller: UIViewController) {
            DispatchQueue.main.async {
            let alert = UIAlertController(title: "Error", message: "An image failed to load", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "OK", style: .cancel, handler: nil))
        controller.present(alert, animated: true, completion: nil)
    
        }
    }
}
