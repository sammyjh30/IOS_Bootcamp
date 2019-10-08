//
//  ViewController.swift
//  ex00
//
//  Created by Samantha HILLEBRAND on 2019/10/08.
//  Copyright © 2019 Samantha HILLEBRAND. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var noOnScreen:Double = 0;
    var prevNum:Double = 0;
    var performingMath = false;

    @IBOutlet weak var outputLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func numbers(_ sender: UIButton) {
        if performingMath == true {
            outputLabel.text = String(sender.tag - 1)
//            noOnScreen = Double(outputLabel.text!)!
            performingMath = true
        }
        outputLabel.text = outputLabel.text! + String(sender.tag - 1)
//        noOnScreen = Double(outputLabel.text!)!
        print(String(sender.tag - 1) + " Button pushed.")
    }
    @IBAction func buttons(_ sender: UIButton) {
        if outputLabel.text != "" && sender.tag != 11 && sender.tag != 16 && sender.tag != 17 {
//            prevNum = Double(outputLabel.text!)!
            if sender.tag == 15 {
                print("+ Button pushed.")
                outputLabel.text = "+"
            }
            else if sender.tag == 14 {
                print("- Button pushed.")
            }
            else if sender.tag == 13 {
                print("* Button pushed.")
            }
            else if sender.tag == 12 {
                print("/ Button pushed.")
            }
            performingMath = true;
        }
        else if sender.tag == 11 {
            print("AC Button pushed.")
        }
        else if sender.tag == 16 {
            print("= Button pushed.")
        }
        else if sender.tag == 17 {
            print("NEG Button pushed.")
        }
    }
}
