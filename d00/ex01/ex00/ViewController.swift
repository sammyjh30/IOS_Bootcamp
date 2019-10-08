//
//  ViewController.swift
//  ex00
//
//  Created by Samantha HILLEBRAND on 2019/10/08.
//  Copyright © 2019 Samantha HILLEBRAND. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var buttonClickMe: UIButton!
    @IBOutlet weak var label1: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func onClickMe(_ sender: UIButton) {
        label1.text = "Hello World!"
    }
    
}

