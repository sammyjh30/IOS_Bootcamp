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

let forecastToken: String = "My_darksky_token"
let recastToken: String = "My_recast_token"

class ViewController: UIViewController {

    var chatBot: RecastAIClient?
//    var forecastClient: APIClient?
    var nbrRequest: Int? = nil
    //Not sure what that is /\
//    var locations: [Location] = []      //Keep track of locations?
    
    @IBOutlet weak var botTextField: UITextField!
    @IBOutlet weak var botLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
//        self.bot = RecastAIClient(token: recastToken, handlerRecastRequestProtocol: self)
        
        if nbrRequest == nil {
            
        }
    }


}

