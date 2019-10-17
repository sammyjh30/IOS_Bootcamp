//
//  ViewController.swift
//  Cocoapods
//
//  Created by Samantha HILLEBRAND on 2019/10/17.
//  Copyright © 2019 Samantha Hillebrand. All rights reserved.
//

import UIKit
//import ForecastIO
import RecastAI

let recastToken: String = "0e12962c8287d8b6d6326872d010faf9"

class ViewController: UIViewController {
    
    var chatBot: RecastAIClient?
    
    @IBOutlet weak var botTextField: UITextField!
    @IBOutlet weak var botLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.chatBot = RecastAIClient(token: recastToken, language: "en")
        print("Loaded")
    }
    @IBAction func onSendButtonPress(_ sender: Any) {
        if botTextField.text != "" {
            makeRequest(input: botTextField.text!)
        } else {
            botLabel.text = "Bad input :("
        }
    }
    
    func makeRequest(input: String) {
        self.chatBot?.textRequest(input, successHandler: recastRequestDone(_:), failureHandle: recastRequestFailed(_:))
    }
    
    func recastRequestDone(_ response : Response)
    {
        var toPrint: String = ""
        let datetime = response.get(entity: "datetime")
        let location = response.get(entity: "location")
        print("Stuff \(response)")
        if (datetime != nil) {
            let formatted = datetime!["formatted"] as! String
            toPrint += "\(formatted)"
        }
        if (location != nil) {
            toPrint += "\n\(location!["city"] as! String)"
        }
        if toPrint == "" {
            toPrint = "No data available"
        }
        botLabel.text = toPrint
    }
    
    func recastRequestFailed(_ error: Error)
    {
        botLabel.text = "Error"
        
        print("Failed \(error)")
    }
}

